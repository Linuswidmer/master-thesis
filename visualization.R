plotEDU = function() {
  ggplot(df, aes(x = EDU_label)) +
    geom_bar(fill = "#4E79A7") +
    labs(
      title = "Was ist ihr höchster Schulabschluss?",
      x = NULL,
      y = "Anzahl"
    ) +
    theme_minimal() +
    coord_flip()
}

plotOCC = function() {
  ggplot(df, aes(x = OCC_label)) +
    geom_bar(fill = "#59A14F") +
    labs(
      title = "Welchen höchsten beruflichen Abschluss haben Sie?",
      x = NULL,
      y = "Anzahl"
    ) +
    theme_minimal() +
    coord_flip()
}

plotWordCompletions <- function(score_col) {
  score_sym <- sym(score_col)
  
  df %>%
    group_by(threatCondition) %>%
    summarise(
      mean_score = mean(!!score_sym, na.rm = TRUE)
    ) %>%
    mutate(mean_score_pct = mean_score * 100) %>%
    ggplot(aes(x = threatCondition, y = mean_score_pct, fill = threatCondition)) +
    geom_col() +
    labs(
      title = paste("Percentage of", score_col, "by Threat Condition"),
      x = "Threat Condition",
      y = "Completions (%)"
    ) +
    theme_minimal() +
    theme(legend.position = "none")
}

plotHist <- function(score_col, x_range = NULL) {
  score_sym <- sym(score_col)
  
  p = ggplot(df, aes(x = !!score_sym)) +
    geom_histogram(binwidth = 0.05, fill = "#59A14F", color = "black") +
    labs(
      title = paste("Histogram of", score_col),
      x = score_col,
      y = "Count"
    ) +
    theme_minimal()
  
  if (!is.null(x_range) && length(x_range) == 2) {
    p <- p + coord_cartesian(xlim = x_range)
  }
  
  p
}

plotBox = function(cols) {
  cols <- as.character(cols)
  
  long_df <- df %>%
    pivot_longer(cols = all_of(cols), names_to = "variable", values_to = "value")
  
  ggboxplot(long_df, x = "variable", y = "value", 
            fill = "threatCondition",  palette = c("#D3D3D3", "#808080"), xlab = "Motivation for Masculine Behaviour") + 
    theme_apa()
}

# ggboxplot(summary.re, x = "variable", y = "value", 
#           palette = c("#D3D3D3", "#808080"), ylab = "% correct", xlab = "condition age", ylim = c(25,100), fill = "conditionAge", ) + labs(y = "% correct", x = "", fill = c("Elderly, Young")) + theme_apa() + geom_hline(yintercept=50, linetype="dashed")  + theme_apa() 
# plotBoth + theme(legend.position = "None")
