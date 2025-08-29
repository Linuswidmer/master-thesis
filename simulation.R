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

# Main simulation function
simulate_data <- function(n = 100,
                          base_mean_aggressive = 0.25,
                          base_mean_anxious    = 0.55,
                          sd_aggressive = 0.1,
                          sd_anxious    = 0.2) {
  set.seed(123)
  
  # Condition assignment
  threatCondition <- sample(c("noThreat", "threat"), n, replace = TRUE)
  
  # Motivation scores
  mmb_autonomous_score <- rtruncnorm(n, mean = 5,   sd = 2,   minval = 1, maxval = 7)
  mmb_pressured_score  <- rtruncnorm(n, mean = 3.5, sd = 1.5, minval = 1, maxval = 7)
  
  # Threat effect coefficients
  beta_autonomous <- 0.05  # how much autonomous increases anxious words under threat
  beta_pressured  <- 0.07  # how much pressured increases aggressive words under threat
  
  # Aggressive words
  mean_aggressive <- base_mean_aggressive +
    ifelse(threatCondition == "threat",
           beta_pressured * (mmb_pressured_score - mean(mmb_pressured_score)), 0)
  
  aggressiveWordCompletionScore <- rtruncnorm(
    n,
    mean = mean_aggressive,
    sd   = sd_aggressive,
    minval = 0,
    maxval = 1
  )
  
  # Anxious words
  mean_anxious <- base_mean_anxious +
    ifelse(threatCondition == "threat",
           beta_autonomous * (mmb_autonomous_score - mean(mmb_autonomous_score)), 0)
  
  anxiousWordCompletionScore <- rtruncnorm(
    n,
    mean = mean_anxious,
    sd   = sd_anxious,
    minval = 0,
    maxval = 1
  )
  
  # Combine into dataframe
  data <- data.frame(
    id = 1:n,
    SEX = "AO01",
    GER = "AO05",
    threatCondition,
    aggressiveWordCompletionScore,
    anxiousWordCompletionScore,
    mmb_autonomous_score,
    mmb_pressured_score
  )
  
  return(data)
}
