check_normality_qq <- function(data, dv, group) {
  ggplot(data, aes(sample = {{ dv }})) +
    stat_qq() +
    stat_qq_line() +
    facet_wrap(vars({{ group }})) +
    theme_minimal() +
    labs(
      title = "QQ Plot by Group",
      subtitle = paste("Normality check for", deparse(substitute(dv)))
    )
}


check_normality_hist <- function(data, dv, group, binwidth = NULL) {
  dv_sym <- ensym(dv)
  group_sym <- ensym(group)

  ggplot(data, aes(x = !!dv_sym, fill = !!group_sym)) +
    geom_histogram(color = "black", alpha = 0.6, position = "identity", binwidth = binwidth) +
    facet_wrap(vars(!!group_sym)) +
    theme_minimal() +
    labs(
      title = paste("Distribution of", as_string(dv_sym), "by", as_string(group_sym)),
      x = as_string(dv_sym),
      y = "Count",
      fill = as_string(group_sym)
    )
}

# shapiro.test(df %>% 
#   filter(threatCondition == "noThreat") %>% 
#   pull(GKSELF)) 

check_homogeneity <- function(data, dv, group) {
  dv_sym <- ensym(dv)
  group_sym <- ensym(group)

  formula <- as.formula(paste(as_string(dv_sym), "~", as_string(group_sym)))
  leveneTest(formula, data = data)
}

run_ttest <- function(data, dv, group, alternative = "two.sided", var_equal = FALSE) {
  dv_sym <- ensym(dv)
  group_sym <- ensym(group)

  formula <- as.formula(paste(as_string(dv_sym), "~", as_string(group_sym)))

  t.test(
    formula,
    data = data,
    alternative = alternative,
    var.equal = var_equal
  )
}

# -----------------------------------------------------------------------------
# Quasibinomial GLM for proportion data (e.g., word completion scores)
# -----------------------------------------------------------------------------

#' Fit a binomial/quasibinomial GLM for proportion outcome data
#'
#' @param data Data frame containing the variables
#' @param score_col Name of the proportion score column (0-1 scale)
#' @param predictor Name of the predictor variable (e.g., "threatCondition")
#' @param n_trials Number of trials used to compute the proportion
#' @param use_quasibinomial If TRUE uses quasibinomial (handles overdispersion),
#'        if FALSE uses binomial (compatible with DHARMa diagnostics). Default FALSE.
#' @return A list containing the GLM model and diagnostic information
run_binomial_glm <- function(data, score_col, predictor, n_trials,
                                  use_quasibinomial = FALSE) {
  # Create success/failure counts
  data$glm_success <- data[[score_col]] * n_trials
  data$glm_failure <- n_trials - data$glm_success
  data$glm_response <- cbind(data$glm_success, data$glm_failure)

  # Fit the model
  formula <- as.formula(paste("glm_response ~", predictor))
  glm_family <- if (use_quasibinomial) quasibinomial else binomial
  model <- glm(formula, data = data, family = glm_family)

  # Return model and data with response matrix
  list(
    model = model,
    data = data
  )
}

#' Compute Cook's distance diagnostics for a GLM model
#'
#' @param model A GLM model object
#' @return A list with threshold, influential indices, and Cook's distances
glm_cooks_diagnostics <- function(model) {
  cooks_dist <- cooks.distance(model)
  n <- nobs(model)
  k <- length(coef(model))
  threshold <- 4 / (n - k)

  influential_indices <- which(cooks_dist > threshold)

  list(
    cooks_distance = cooks_dist,
    threshold = threshold,
    influential_indices = influential_indices,
    n_influential = length(influential_indices),
    n_total = n
  )
}

#' Print Cook's distance diagnostic summary
#'
#' @param diagnostics Output from glm_cooks_diagnostics()
print_cooks_summary <- function(diagnostics) {
  cat("Cook's Distance Threshold:", round(diagnostics$threshold, 4), "\n")
  cat("Total observations:", diagnostics$n_total, "\n")
  cat("Influential observations:", diagnostics$n_influential, "\n")

  if (diagnostics$n_influential > 0) {
    cat("\nInfluential observation indices:", diagnostics$influential_indices, "\n")
    cat("Cook's Distance values:\n")
    print(round(diagnostics$cooks_distance[diagnostics$influential_indices], 4))
  }
}

#' Remove influential observations and refit GLM
#'
#' @param glm_result Output from run_binomial_glm()
#' @param diagnostics Output from glm_cooks_diagnostics()
#' @param predictor Name of the predictor variable
#' @param use_quasibinomial If TRUE uses quasibinomial, if FALSE uses binomial. Default FALSE.
#' @return A list with cleaned data, new model, and summary
glm_remove_influential <- function(glm_result, diagnostics, predictor,
                                   use_quasibinomial = FALSE) {
  if (diagnostics$n_influential == 0) {
    cat("No influential observations to remove.\n")
    return(list(
      data_clean = glm_result$data,
      model_clean = glm_result$model,
      n_removed = 0
    ))
  }

  # Remove influential observations
  is_not_influential <- diagnostics$cooks_distance <= diagnostics$threshold
  data_clean <- glm_result$data[is_not_influential, ]

  # Refit model
  formula <- as.formula(paste("glm_response ~", predictor))
  glm_family <- if (use_quasibinomial) quasibinomial else binomial
  model_clean <- glm(formula, data = data_clean, family = glm_family)

  cat("--- Data Cleaning Summary ---\n")
  cat("Original observations:", diagnostics$n_total, "\n")
  cat("Removed (influential):", diagnostics$n_influential, "\n")
  cat("Remaining observations:", nrow(data_clean), "\n")

  list(
    data_clean = data_clean,
    model_clean = model_clean,
    n_removed = diagnostics$n_influential
  )
}

#' Format GLM results as a summary table with optional sensitivity analysis
#'
#' Creates a formatted table comparing the main GLM analysis with a sensitivity
#' analysis (e.g., model without influential observations). Works for both simple
#' GLMs with one predictor and moderation GLMs with interaction terms.
#'
#' @param model The primary GLM model object (full sample)
#' @param model_clean Optional sensitivity analysis GLM model (e.g., without influential obs)
#' @param labels Optional named vector to rename terms for display
#'               (e.g., c("threatConditionthreat" = "Threat Condition"))
#' @param one_tailed Optional named vector specifying directional hypotheses for terms.
#'        Use "positive" if you expect a positive coefficient, "negative" if negative.
#'        e.g., c("threatConditionthreat" = "positive")
#'        One-tailed p-values are calculated as:
#'        - If effect is in expected direction: p_one = p_two / 2
#'        - If effect is opposite to expected: p_one = 1 - (p_two / 2)
#' @return A formatted summary data frame with columns for both models
glm_summary_table <- function(model, model_clean = NULL, labels = NULL, one_tailed = NULL) {
  # Helper to extract and format coefficients from a model
  extract_coefs <- function(mod, suffix = "", one_tailed_spec = NULL) {
    coefs <- summary(mod)$coefficients

    df <- data.frame(
      Term = rownames(coefs),
      Estimate = round(coefs[, "Estimate"], 3),
      SE = round(coefs[, "Std. Error"], 3),
      z = round(coefs[, "z value"], 2),
      p_raw = coefs[, "Pr(>|z|)"],
      stringsAsFactors = FALSE
    )

    # Apply one-tailed correction if specified
    if (!is.null(one_tailed_spec)) {
      df$p <- sapply(seq_len(nrow(df)), function(i) {
        term <- df$Term[i]
        if (term %in% names(one_tailed_spec)) {
          expected_dir <- one_tailed_spec[term]
          estimate <- coefs[term, "Estimate"]
          p_two <- df$p_raw[i]

          # Check if effect is in expected direction
          in_expected_dir <- (expected_dir == "positive" && estimate > 0) ||
                             (expected_dir == "negative" && estimate < 0)

          if (in_expected_dir) {
            return(p_two / 2)
          } else {
            return(1 - (p_two / 2))
          }
        }
        return(df$p_raw[i])
      })
    } else {
      df$p <- df$p_raw
    }

    # Remove raw p-value column
    df$p_raw <- NULL

    # Add significance stars (based on corrected p-values)
    df$Sig <- ifelse(df$p < 0.001, "***",
      ifelse(df$p < 0.01, "**",
        ifelse(df$p < 0.05, "*",
          ifelse(df$p < 0.1, ".", "")
        )
      )
    )

    # Format p-values
    df$p <- ifelse(df$p < 0.001, "< .001", sprintf("%.3f", df$p))

    # Rename columns with suffix if provided
    if (suffix != "") {
      names(df)[names(df) != "Term"] <- paste0(names(df)[names(df) != "Term"], suffix)
    }

    df
  }

  # Extract coefficients from main model
  result <- extract_coefs(model, one_tailed_spec = one_tailed)

  # If sensitivity model provided, merge the results
  if (!is.null(model_clean)) {
    clean_coefs <- extract_coefs(model_clean, "_sens", one_tailed_spec = one_tailed)
    result <- merge(result, clean_coefs, by = "Term", all = TRUE, sort = FALSE)

    # Reorder to match original model term order
    term_order <- rownames(summary(model)$coefficients)
    result <- result[match(term_order, result$Term), ]
  }

  # Apply custom labels if provided
  if (!is.null(labels)) {
    result$Term <- ifelse(result$Term %in% names(labels),
                          labels[result$Term],
                          result$Term)
  }

  # Reset row names

  rownames(result) <- NULL

  result
}

# -----------------------------------------------------------------------------
# Quasibinomial GLM with Moderation (Interaction Effects)
# -----------------------------------------------------------------------------

#' Fit a binomial GLM with a moderator (interaction term)
#'
#' @param data Data frame containing the variables
#' @param score_col Name of the proportion score column (0-1 scale)
#' @param predictor Name of the main predictor variable (e.g., "threatCondition")
#' @param moderator Name of the continuous moderator variable (e.g., "pressuredMotivation")
#' @param n_trials Number of trials used to compute the proportion
#' @param use_quasibinomial If TRUE uses quasibinomial (handles overdispersion),
#'        if FALSE uses binomial (compatible with DHARMa diagnostics). Default FALSE.
#' @return A list containing the GLM model and the data with response matrix
run_binomial_glm_moderation <- function(data, score_col, predictor, moderator, n_trials,
                                             use_quasibinomial = FALSE) {
  # Create success/failure counts
  data$glm_success <- data[[score_col]] * n_trials
  data$glm_failure <- n_trials - data$glm_success
  data$glm_response <- cbind(data$glm_success, data$glm_failure)

  # Fit the model with interaction term
  formula <- as.formula(paste("glm_response ~", predictor, "*", moderator))
  glm_family <- if (use_quasibinomial) quasibinomial else binomial
  model <- glm(formula, data = data, family = glm_family)

  list(
    model = model,
    data = data
  )
}

#' Remove influential observations and refit moderation GLM
#'
#' @param glm_result Output from run_binomial_glm_moderation()
#' @param diagnostics Output from glm_cooks_diagnostics()
#' @param predictor Name of the predictor variable
#' @param moderator Name of the moderator variable
#' @param use_quasibinomial If TRUE uses quasibinomial, if FALSE uses binomial. Default FALSE.
#' @return A list with cleaned data, new model, and summary
glm_remove_influential_moderation <- function(glm_result, diagnostics, predictor, moderator,
                                              use_quasibinomial = FALSE) {
  if (diagnostics$n_influential == 0) {
    cat("No influential observations to remove.\n")
    return(list(
      data_clean = glm_result$data,
      model_clean = glm_result$model,
      n_removed = 0
    ))
  }

  # Remove influential observations
  is_not_influential <- diagnostics$cooks_distance <= diagnostics$threshold
  data_clean <- glm_result$data[is_not_influential, ]

  # Refit model with interaction
  formula <- as.formula(paste("glm_response ~", predictor, "*", moderator))
  glm_family <- if (use_quasibinomial) quasibinomial else binomial
  model_clean <- glm(formula, data = data_clean, family = glm_family)

  cat("--- Data Cleaning Summary ---\n")
  cat("Original observations:", diagnostics$n_total, "\n")
  cat("Removed (influential):", diagnostics$n_influential, "\n")
  cat("Remaining observations:", nrow(data_clean), "\n")

  list(
    data_clean = data_clean,
    model_clean = model_clean,
    n_removed = diagnostics$n_influential
  )
}

#' Check multicollinearity between predictor and moderator
#'
#' @param data Data frame containing the variables
#' @param predictor Name of the categorical predictor (will be converted to numeric)
#' @param moderator Name of the continuous moderator
#' @param predictor_levels Optional: levels for factor conversion (default: c("noThreat", "threat"))
#' @return Correlation coefficient
check_multicollinearity <- function(data, predictor, moderator,
                                     predictor_levels = c("noThreat", "threat")) {
  predictor_numeric <- as.numeric(factor(data[[predictor]], levels = predictor_levels)) - 1
  correlation <- cor(predictor_numeric, data[[moderator]], use = "complete.obs")

  cat("Correlation between", predictor, "and", moderator, ":", round(correlation, 4), "\n")

  if (abs(correlation) < 0.3) {
    cat("Interpretation: Low correlation - no multicollinearity concern\n")
  } else if (abs(correlation) < 0.7) {
    cat("Interpretation: Moderate correlation - some multicollinearity possible\n")
  } else {
    cat("Interpretation: High correlation - multicollinearity concern\n")
  }

  invisible(correlation)
}

#' Check residuals for a GLM model using DHARMa simulation-based diagnostics
#'
#' For binomial/quasibinomial GLMs, standard Q-Q plots against a normal distribution
#' are inappropriate. This function uses DHARMa to create randomized quantile residuals
#' via simulation, which should be uniformly distributed if the model is correct.
#'
#' @param model A GLM model object
#' @param n_sim Number of simulations for DHARMa (default 1000)
#' @return A DHARMa residual plot (Q-Q plot against uniform distribution + residuals vs predicted)
check_glm_residual_normality <- function(model, n_sim = 1000) {
  sim_output <- DHARMa::simulateResiduals(fittedModel = model, n = n_sim)
  plot(sim_output)
}
