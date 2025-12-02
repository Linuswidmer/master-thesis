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
