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
                               width = 6, height = 5) {
  if (!dir.exists(folder)) dir.create(folder, recursive = TRUE)

  file_path <- file.path(folder, paste0(name, ".png"))


  # Greyscale color palette for APA accessibility
  # Dark = negative correlations, White = zero, Light grey = positive correlations
  grey_palette <- colorRampPalette(c("grey15", "white", "grey70"))(100)

  png(filename = file_path, width = width, height = height, units = "in", res = 300)

  corrplot::corrplot(cor_matrix,
    method = "color",
    type = "upper",
    order = "original",
    tl.col = "black",
    tl.srt = 45,
    tl.cex = 0.9,
    cl.cex = 0.8,
    diag = FALSE,
    addCoef.col = "black",
    number.cex = 0.7,
    col = grey_palette,
    mar = c(0, 0, 1, 0)
  )

  dev.off()

  message("Saved corrplot: ", file_path)
}
