library(dplyr)

# Helper: truncated normal sampler
rtruncnorm <- function(n, mean, sd, minval, maxval) {
  vals <- rnorm(n, mean, sd)
  while(any(vals < minval | vals > maxval)) {
    bad <- which(vals < minval | vals > maxval)
    vals[bad] <- rnorm(length(bad), mean, sd)
  }
  return(vals)
}

simulate_data <- function(n = 100,
                          base_mean_aggressive = 0.25,
                          base_mean_anxious = 0.55,
                          sd_aggressive = 0.1,
                          sd_anxious = 0.2,
                          item_noise = 0.5) {   # smaller = higher correlation
  set.seed(123)
  
  # Condition assignment
  threatCondition <- sample(c("noThreat", "threat"), n, replace = TRUE)
  
  # --- Simulate latent factor scores for MMB facets ---
  latent_pressured  <- rtruncnorm(n, mean = 3.5, sd = 1.5, minval = 1, maxval = 7)
  latent_autonomous <- rtruncnorm(n, mean = 5,   sd = 2,   minval = 1, maxval = 7)
  
  # --- Generate items with small deviation from latent score ---
  pressured_items <- sapply(1:5, function(i) {
    round(rtruncnorm(n, mean = latent_pressured, sd = item_noise, minval = 1, maxval = 7))
  })
  colnames(pressured_items) <- paste0("MMBi", 1:5)
  
  autonomous_items <- sapply(1:4, function(i) {
    round(rtruncnorm(n, mean = latent_autonomous, sd = item_noise, minval = 1, maxval = 7))
  })
  colnames(autonomous_items) <- paste0("MMBi", 6:9)
  
  # Compute aggregated scores
  mmb_pressured_score  <- rowMeans(pressured_items)
  mmb_autonomous_score <- rowMeans(autonomous_items)
  
  # Threat effect coefficients
  beta_autonomous <- 0.05
  beta_pressured  <- 0.07
  
  # Aggressive words
  mean_aggressive <- base_mean_aggressive +
    ifelse(threatCondition == "threat",
           beta_pressured * (mmb_pressured_score - mean(mmb_pressured_score)), 0)
  aggressiveWordCompletionScore <- rtruncnorm(
    n, mean = mean_aggressive, sd = sd_aggressive, minval = 0, maxval = 1
  )
  
  # Anxious words
  mean_anxious <- base_mean_anxious +
    ifelse(threatCondition == "threat",
           beta_autonomous * (mmb_autonomous_score - mean(mmb_autonomous_score)), 0)
  anxiousWordCompletionScore <- rtruncnorm(
    n, mean = mean_anxious, sd = sd_anxious, minval = 0, maxval = 1
  )
  
  # Transformations
  aggressiveWordCompletionScoreTransformed <- asin(sqrt(aggressiveWordCompletionScore))
  anxiousWordCompletionScoreTransformed    <- asin(sqrt(anxiousWordCompletionScore))
  
  # Combine into dataframe
  data <- data.frame(
    id = 1:n,
    SEX = "AO01",
    GER = "AO05",
    threatCondition,
    aggressiveWordCompletionScore,
    aggressiveWordCompletionScoreTransformed,
    anxiousWordCompletionScore,
    anxiousWordCompletionScoreTransformed,
    mmb_pressured_score,
    mmb_autonomous_score,
    pressured_items,
    autonomous_items
  )
  
  return(data)
}
