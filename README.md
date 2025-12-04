# Master Thesis: Motivated Responses to a Masculinity Threat in a German Cultural Context

This repository contains the data analysis for a master thesis investigating how masculinity threats affect cognitive responses, and how motivation for masculine behaviour moderates these effects.

## Project Structure

```
├── analysis/
│   ├── R/                    # Helper functions
│   ├── analysis-report.Rmd   # Main analysis report
│   ├── analysis-report.pdf   # Rendered report
│   └── tex/                   # LaTeX templates
├── data/
│   └── fragile_masculinity_motivation_anonymized.csv
└── writing/                  # Thesis document
```

## Getting Started

### Prerequisites

- R (version 4.2 or higher recommended)

### Installation

1. Clone the repository
2. Open R and install required packages:

```r
source("analysis/R/install_packages.R")
```

### Running the Analysis

Open `analysis/analysis-report.Rmd` in RStudio - and run or knit to pdf

```r
rmarkdown::render("analysis/analysis-report.Rmd")
```

## Analysis Overview

The analysis includes:

1. **Study Inclusion Criteria** - Participant filtering based on consent, demographics, and data quality
2. **Demographics** - Descriptive statistics of the sample
3. **Manipulation Check** - Verification of experimental condition effects
4. **Test Quality Criteria** - Validity and reliability assessment of measurement scales (MMB, WFCT)
5. **Hypothesis Testing** - Statistical tests for main effects and moderation analyses
