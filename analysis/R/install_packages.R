# Install required packages for analysis-report.Rmd

install.packages(c(
  # Data manipulation
  "dplyr",
  "tidyr",
  "stringr",

  # Visualization
  "ggplot2",
  "ggpubr",
  "corrplot",
  "gridExtra",

  # Reporting
  "knitr",
  "kableExtra",
  "rmarkdown",

  # Statistical analysis
  "psych",
  "car",
  "boot",
  "DHARMa",

  # Structural equation modeling
  "lavaan",
  "semTools",

  # Item response theory
  "mirt",

  # Utilities
  "here",
  "R.utils",
  "rlang",
  "jtools"
))
