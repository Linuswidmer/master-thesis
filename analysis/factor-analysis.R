summarizeFitIndices <- function(model, indices = c("cfi", "tli", "rmsea", "srmr"),
                                criteria = c(cfi = 0.95, tli = 0.95, rmsea = 0.06, srmr = 0.08),
                                digits = 3) {
  # Extract fit indices from model
  fit_values <- fitMeasures(model, indices)

  # Ensure criteria are aligned with the requested indices
  crit_values <- criteria[names(fit_values)]

  # Create summary data.frame
  fit_summary <- data.frame(
    Index = names(fit_values),
    Value = round(fit_values, digits),
    Criteria = crit_values
  )

  return(fit_summary)
}

run_cfa_model <- function(model_syntax, data, model_name = "CFA_Model", show_mi = TRUE) {
  message("\n===========================================================")
  message("Running CFA: ", model_name)
  message("===========================================================\n")

  fit <- cfa(model_syntax, data = data, std.lv = TRUE)

  cat("\n-------------------------\n")
  cat("MODEL SUMMARY\n")
  cat("-------------------------\n")
  print(summary(fit, fit.measures = TRUE, standardized = TRUE))

  cat("\n-------------------------\n")
  cat("MODEL FIT INDICES\n")
  cat("-------------------------\n")
  fit_indices <- fitMeasures(
    fit,
    c("cfi", "tli", "rmsea", "srmr", "chisq", "df")
  )
  print(summarizeFitIndices(fit))

  cat("\n-------------------------\n")
  cat("STANDARDIZED FACTOR LOADINGS\n")
  cat("-------------------------\n")
  loadings <- standardizedSolution(fit) %>%
    filter(op == "=~") %>%
    select(Factor = lhs, Item = rhs, Std_Loading = est.std)
  print(loadings)

  if (show_mi) {
    cat("\n-------------------------\n")
    cat("TOP MODIFICATION INDICES\n")
    cat("-------------------------\n")
    mi <- modindices(fit, sort = TRUE, maximum.number = 5)
    print(mi)
  } else {
    mi <- NULL
  }

  invisible(list(
    fit = fit,
    fit_indices = fit_indices,
    loadings = loadings,
    mod_indices = mi
  ))
}
