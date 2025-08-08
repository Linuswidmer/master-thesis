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
  score_sym <- sym(score_col)  # turn string into a symbol
  
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
