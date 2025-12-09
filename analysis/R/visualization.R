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
#' @param ylim Optional numeric vector of length 2 for y-axis limits, e.g., c(0, 100)
#' @param legend_position Position of legend inside plot: "top.left", "top.right",
#'        "bottom.left", "bottom.right", or "none" to hide. Default: "top.left"
#' @return A ggplot boxplot object
plotBox <- function(cols, fill_var = NULL, x_label = NULL, y_label = NULL,
                    var_labels = NULL, fill_labels = NULL, legend_title = NULL,
                    ylim = NULL, legend_position = "top.left") {
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

  # Bold axis titles for APA style
  p <- p + theme(
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

  # Apply custom legend title
  if (!is.null(fill_var) && !is.null(legend_title)) {
    p <- p + labs(fill = legend_title)
  }

  # Apply y-axis limits with expand = c(0, 0) to remove padding
  if (!is.null(ylim)) {
    p <- p + scale_y_continuous(limits = ylim, expand = c(0, 0))
  }

  # Position legend inside the plot
  if (!is.null(fill_var) && legend_position != "none") {
    # Convert position string to coordinates
    legend_coords <- switch(legend_position,
      "top.left" = c(0.02, 0.98),
      "top.right" = c(0.98, 0.98),
      "bottom.left" = c(0.02, 0.02),
      "bottom.right" = c(0.98, 0.02),
      c(0.02, 0.98)  # default to top.left
    )
    legend_hjust <- if (grepl("left", legend_position)) 0 else 1
    legend_vjust <- if (grepl("top", legend_position)) 1 else 0

    p <- p + theme(
      legend.position = legend_coords,
      legend.justification = c(legend_hjust, legend_vjust),
      legend.background = element_rect(fill = "white", color = "black", linewidth = 0.2),
      legend.key.size = unit(0.4, "cm")
    )
  } else if (legend_position == "none") {
    p <- p + theme(legend.position = "none")
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


#' Create APA-style moderation plot (regression lines by condition)
#'
#' Uses solid vs dashed lines to distinguish conditions, with bold axis titles.
#'
#' @param x Name of the continuous moderator variable (x-axis)
#' @param y Name of the outcome variable (y-axis)
#' @param condition Name of the categorical condition variable (e.g., "threatCondition")
#' @param df Data frame containing the variables
#' @param x_label Optional custom label for x-axis
#' @param y_label Optional custom label for y-axis
#' @param condition_labels Optional named vector to rename condition levels
#'        e.g., c("noThreat" = "No Threat", "threat" = "Threat")
#' @param legend_title Optional custom title for the legend
#' @param ylim Optional numeric vector of length 2 for y-axis limits
#' @param xlim Optional numeric vector of length 2 for x-axis limits
#' @param legend_position Position of legend inside plot: "top.left", "top.right",
#'        "bottom.left", "bottom.right", or "none". Default: "top.left"
#' @return A ggplot object
plotModeration <- function(x, y, condition, df, x_label = NULL, y_label = NULL,
                           condition_labels = NULL, legend_title = NULL,
                           ylim = NULL, xlim = NULL, legend_position = "top.left") {
  x_sym <- sym(x)
  y_sym <- sym(y)
  cond_sym <- sym(condition)

  # Create a copy of df to avoid modifying the original
  plot_df <- df

  # Apply custom condition labels if provided
  if (!is.null(condition_labels)) {
    plot_df[[condition]] <- ifelse(
      plot_df[[condition]] %in% names(condition_labels),
      condition_labels[as.character(plot_df[[condition]])],
      as.character(plot_df[[condition]])
    )
    # Preserve order
    plot_df[[condition]] <- factor(plot_df[[condition]], levels = condition_labels)
  }

  cond_sym <- sym(condition)

  p <- ggplot(plot_df, aes(x = !!x_sym, y = !!y_sym, linetype = !!cond_sym)) +
    geom_smooth(method = "lm", se = FALSE, color = "black") +
    scale_linetype_manual(values = c("solid", "dashed")) +
    theme_apa() +
    theme(
      axis.title.x = element_text(face = "bold"),
      axis.title.y = element_text(face = "bold")
    )

  # Apply custom axis labels
  x_lab <- if (!is.null(x_label)) x_label else x
  y_lab <- if (!is.null(y_label)) y_label else y
  p <- p + labs(x = x_lab, y = y_lab)

  # Apply custom legend title
  if (!is.null(legend_title)) {
    p <- p + labs(linetype = legend_title)
  }

  # Apply axis limits using coord_cartesian to avoid removing data points
  if (!is.null(ylim) || !is.null(xlim)) {
    p <- p + coord_cartesian(ylim = ylim, xlim = xlim, expand = FALSE)
  }

  # Position legend inside the plot
  if (legend_position != "none") {
    legend_coords <- switch(legend_position,
      "top.left" = c(0.02, 0.98),
      "top.right" = c(0.98, 0.98),
      "bottom.left" = c(0.02, 0.02),
      "bottom.right" = c(0.98, 0.02),
      c(0.02, 0.98)
    )
    legend_hjust <- if (grepl("left", legend_position)) 0 else 1
    legend_vjust <- if (grepl("top", legend_position)) 1 else 0

    p <- p + theme(
      legend.position = legend_coords,
      legend.justification = c(legend_hjust, legend_vjust),
      legend.background = element_rect(fill = "white", color = "black", linewidth = 0.2),
      legend.key.size = unit(0.4, "cm")
    )
  } else {
    p <- p + theme(legend.position = "none")
  }

  return(p)
}
