preprocessData <- function(df, all_items) {
  # df = df %>% select(all_of(all_items))

  df <- addQuestionLabelToDataframe(df)

  df <- encodeWordCompletions(df)

  df$threatCondition <- factor(df$threatCondition, levels = c("threat", "noThreat"))

  printNumberOfParticipants(df, "threatCondition")
  return(df)
}

encodeWordCompletions <- function(df) {
  for (key in WFCT_aggression_items) {
    df[[key]] <- recode_WFCT_column(df[[key]], key)
  }

  for (key in WFCT_anxiety_items) {
    df[[key]] <- recode_WFCT_column(df[[key]], key)
  }

  df$validWordCompletionScore <- rowSums(!is.na(df[WFCT_all_items])) / length(WFCT_all_items)

  return(df)
}


recode_WFCT_column <- function(col, key) {
  # Get the catalog for this WFCT item
  word_df <- word_catalog[[key]]

  # Ensure lowercase
  word_df$word <- tolower(word_df$word)

  # Also extract first letters of all words
  word_df$first_letter <- substr(word_df$word, 1, 1)

  sapply(col, function(word) {
    if (is.na(word) || word == "") {
      return(NA)
    }

    word_lower <- tolower(word)

    ##
    ## 1. FULL-WORD MATCH
    ##
    full_match <- word_df[word_df$word == word_lower, ]
    if (nrow(full_match) == 1) {
      return(ifelse(full_match$encoding == "A", 1,
             ifelse(full_match$encoding == "N", 0, NA)))
    }

    ##
    ## 2. FIRST LETTER MATCH
    ##
    # If the participant typed exactly one character
    if (nchar(word_lower) == 1) {
      letter_matches <- word_df[word_df$first_letter == word_lower, ]

      if (nrow(letter_matches) == 0) {
        return(NA)  # letter does not correspond to any catalog word
      }

      encodings <- unique(letter_matches$encoding)

      # If the letter maps unambiguously to A or N
      if (length(encodings) == 1) {
        return(ifelse(encodings == "A", 1, 0))
      } else {
        # Letter corresponds to both aggressive AND neutral words
        return(NA)
      }
    }

    ##
    ## 3. Otherwise no match
    ##
    return(NA)
  })
}


addQuestionLabelToDataframe <- function(df) {
  df$EDU_label <- factor(
    str_wrap(edu_labels[df$EDU], width = 25), # Wrap at 25 characters
    levels = str_wrap(edu_labels, width = 25)
  )

  df$OCC_label <- factor(
    str_wrap(occ_labels[df$OCC], width = 25), # Wrap at 25 characters
    levels = str_wrap(occ_labels, width = 25)
  )

  df$GKFEEDBACK_label <- factor(
    str_wrap(gkfeedback_labels[df$GKFEEDBACK], width = 25), # Wrap at 25 characters
    levels = str_wrap(gkfeedback_labels, width = 25)
  )

  df$GKSELF_label <- factor(
    str_wrap(gkfeedback_labels[df$GKSELF], width = 25), # Wrap at 25 characters
    levels = str_wrap(gkfeedback_labels, width = 25)
  )
  return(df)
}

exclude_participants <- function(df, condition, vars = NULL, description = "Exclusion") {
  before_n <- nrow(df)
  df_filtered <- df %>% dplyr::filter({{ condition }})
  after_n <- nrow(df_filtered)
  excluded_n <- before_n - after_n

  cat(glue::glue(
    "{description}: Excluded {excluded_n} participants ({excluded_n} of {before_n}).\nRemaining: {after_n}\n\n"
  ))

  # Only show details if there were exclusions AND vars were provided
  if (excluded_n > 0 && !is.null(vars)) {
    df_excluded <- df %>% dplyr::filter(!({{ condition }}))

    for (var in vars) {
      cat(glue::glue("Excluded responses summary for `{var}`:\n"))

      excluded_summary <- df_excluded %>%
        dplyr::count(.data[[var]], name = "n") %>%
        dplyr::arrange(desc(n))

      print(excluded_summary)
      cat("\n")
    }
  }

  return(df_filtered)
}
