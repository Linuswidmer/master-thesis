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
