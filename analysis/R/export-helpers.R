save_plot <- function(plot, name, folder = "analysis/output/figures", formats = c("png")) {
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
