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


plotHist <- function(score_col, x_range = NULL, condition = NULL, binwidth = 0.4) {
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
      geom_histogram(binwidth = binwidth, color = "black", position = "dodge", alpha = 0.7) +
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
      geom_histogram(binwidth = binwidth, fill = palette[1], color = "black") +
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


#' Create APA-style boxplot
#'
#' @param cols Character vector of column names to plot
#' @param fill_var Optional grouping variable for fill color (e.g., "threatCondition")
#' @param x_label Optional custom label for x-axis (default: "variable")
#' @param y_label Optional custom label for y-axis (default: "value")
#' @param var_labels Optional named vector to rename the variables (cols) in the plot
#'        e.g., c("aggressiveWordCompletionScore" = "Aggressive", "anxiousWordCompletionScore" = "Anxious")
#' @param fill_labels Optional named vector to rename the fill variable levels
#'        e.g., c("noThreat" = "No Threat", "threat" = "Threat")
#' @param legend_title Optional custom title for the legend (default: fill_var name)
#' @return A ggplot boxplot object
plotBox <- function(cols, fill_var = NULL, x_label = NULL, y_label = NULL,
                    var_labels = NULL, fill_labels = NULL, legend_title = NULL) {
  cols <- as.character(cols)

  long_df <- df %>%
    pivot_longer(cols = all_of(cols), names_to = "variable", values_to = "value")

  # Apply custom variable labels if provided
  if (!is.null(var_labels)) {
    long_df$variable <- ifelse(
      long_df$variable %in% names(var_labels),
      var_labels[long_df$variable],
      long_df$variable
    )
    # Preserve order based on input cols
    label_order <- ifelse(cols %in% names(var_labels), var_labels[cols], cols)
    long_df$variable <- factor(long_df$variable, levels = label_order)
  }

  # Apply custom fill labels if provided
  if (!is.null(fill_var) && !is.null(fill_labels)) {
    long_df[[fill_var]] <- ifelse(
      long_df[[fill_var]] %in% names(fill_labels),
      fill_labels[as.character(long_df[[fill_var]])],
      as.character(long_df[[fill_var]])
    )
    # Preserve order based on original factor levels
    label_order <- ifelse(names(fill_labels) %in% names(fill_labels), fill_labels, names(fill_labels))
    long_df[[fill_var]] <- factor(long_df[[fill_var]], levels = label_order)
  }

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

  # Apply custom axis labels
  x_lab <- if (!is.null(x_label)) x_label else "variable"
  y_lab <- if (!is.null(y_label)) y_label else "value"
  p <- p + labs(x = x_lab, y = y_lab)

  # Apply custom legend title
  if (!is.null(fill_var) && !is.null(legend_title)) {
    p <- p + labs(fill = legend_title)
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
