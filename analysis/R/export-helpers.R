save_plot <- function(plot, name, folder = "writing/thesis/images", formats = c("png")) {
  if (!dir.exists(folder)) dir.create(folder, recursive = TRUE)

  for (ext in formats) {
    file_path <- file.path(folder, paste0(name, ".", ext))

    ggplot2::ggsave(
      filename = file_path,
      plot = plot,
      width = 6, height = 4, dpi = 300
    )
  }

  message("Saved: ", paste(paste0(name, ".", formats), collapse = ", "))
}

save_corrplot_apa <- function(cor_matrix, name,
                              folder = "writing/thesis/images",
                              width = 6, height = 5,
                              cluster_groups = NULL) {
  if (!dir.exists(folder)) dir.create(folder, recursive = TRUE)

  file_path <- file.path(folder, paste0(name, ".png"))

  # Greyscale diverging palette: light for negative, dark for positive
  grey_palette <- colorRampPalette(c("grey90", "grey10"))(200)

  png(filename = file_path, width = width, height = height, units = "in", res = 300)

  corrplot::corrplot.mixed(cor_matrix,
    upper = "circle",
    lower = "number",
    order = "original",
    tl.col = "black",
    tl.pos = "lt",
    tl.cex = 0.9,
    number.cex = 0.7,
    upper.col = grey_palette,
    lower.col = "black",
    cl.cex = 0.8,
    mar = c(0, 0, 1, 0)
  )

  # Add rectangles around cluster groups if specified
  # cluster_groups should be pairs of start/end indices, e.g., c(1, 5, 6, 9)
  # draws rectangles around items 1-5 and 6-9
  if (!is.null(cluster_groups)) {
    n <- nrow(cor_matrix)
    # Process pairs of indices
    for (i in seq(1, length(cluster_groups), by = 2)) {
      start_idx <- cluster_groups[i]
      end_idx <- cluster_groups[i + 1]
      # corrplot coordinates: x goes left to right (1 to n), y goes bottom to top (1 to n)
      # but visually row 1 is at the top, so we need to flip y
      rect(
        xleft = start_idx - 0.5,
        ybottom = n - end_idx + 0.5,
        xright = end_idx + 0.5,
        ytop = n - start_idx + 1.5,
        border = "black",
        lwd = 2
      )
    }
  }

  dev.off()

  message("Saved corrplot: ", file_path)
}
