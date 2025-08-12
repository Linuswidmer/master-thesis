
plotBarHorizontal <- function(col, condition = NULL) {
  col_sym <- sym(col)
  
  if (!is.null(condition)) {
    cond_sym <- sym(condition)
    p <- ggplot(df, aes(x = !!col_sym, fill = !!cond_sym)) +
      geom_bar(position = "dodge") +
      theme_minimal() +
      coord_flip()
  } else {
    p <- ggplot(df, aes(x = !!col_sym)) +
      geom_bar(fill = "#59A14F") +
      theme_minimal() +
      coord_flip()
  }
  
  return(p)
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

plotBox <- function(cols, fill_var = NULL) {
  cols <- as.character(cols)
  
  long_df <- df %>%
    pivot_longer(cols = all_of(cols), names_to = "variable", values_to = "value")
  
  if (!is.null(fill_var)) {
    p <- ggboxplot(
      long_df, 
      x = "variable", 
      y = "value", 
      fill = fill_var,
      width = 0.4,
      palette = c("#D3D3D3", "#808080"),
      ggtheme = theme_apa()
    )
  } else {
    p <- ggboxplot(
      long_df, 
      x = "variable", 
      y = "value", 
      width = 0.4,
      palette = c("#D3D3D3", "#808080"),
      ggtheme = theme_apa()
    )
  }
  
  return(p)
}
