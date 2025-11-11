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


plotHist <- function(score_col, x_range = NULL, condition = NULL) {
  palette <- c("#D3D3D3", "#808080")
  score_sym <- sym(score_col)

  # Common theme
  common_theme <- theme_apa() +
    theme(
      axis.title.y = element_text(face = "bold"),
      axis.title.x = element_text(face = "bold")
    )

  # Common y-axis scale
  common_scale <- scale_y_continuous(expand = c(0, 0))

  if (!is.null(condition)) {
    cond_sym <- sym(condition)

    # Ensure the column is a factor
    df[[condition]] <- factor(df[[condition]])

    p <- ggplot(df, aes(x = !!score_sym, fill = !!cond_sym)) +
      geom_histogram(binwidth = 0.4, color = "black", position = "dodge", alpha = 0.7) +
      scale_fill_manual(values = palette, name = "Condition") + # legend title
      common_theme +
      common_scale +
      labs(
        title = paste("Histogram of", score_col),
        x = score_col,
        y = "Count"
      )
  } else {
    p <- ggplot(df, aes(x = !!score_sym)) +
      geom_histogram(binwidth = 0.4, fill = palette[1], color = "black") +
      common_theme +
      common_scale +
      labs(
        title = paste("Histogram of", score_col),
        x = score_col,
        y = "Count"
      )
  }

  # Apply x-axis range if specified
  if (!is.null(x_range) && length(x_range) == 2) {
    p <- p + coord_cartesian(xlim = x_range)
  }

  return(p)
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

plotLine <- function(x, y, condition = NULL, df) {
  x_sym <- sym(x)
  y_sym <- sym(y)

  if (!is.null(condition)) {
    cond_sym <- sym(condition)
    p <- ggplot(df, aes(x = !!x_sym, y = !!y_sym, color = !!cond_sym)) +
      geom_point(alpha = 0.5) +
      geom_smooth(method = "lm", se = FALSE) +
      theme_minimal() +
      labs(x = x, y = y, color = condition)
  } else {
    p <- ggplot(df, aes(x = !!x_sym, y = !!y_sym)) +
      geom_point(alpha = 0.5) +
      geom_smooth(method = "lm", se = FALSE, color = "blue") +
      theme_minimal() +
      labs(x = x, y = y)
  }

  return(p)
}
