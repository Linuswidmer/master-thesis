preprocessData = function(df, all_items) {
  # df = df %>% select(all_of(all_items))
  
  df = addQuestionLabelToDataframe(df)
  
  df = encodeWordCompletions(df)
  
  df$threatCondition <- factor(df$threatCondition, levels = c("threat", "noThreat"))
  
  printNumberOfParticipants(df)
  return(df)
}

encodeWordCompletions = function(df) {
  for (key in WFCT_aggression_items) {
    df[[key]] <- recode_WFCT_column(df[[key]], key)
  }
  
  for (key in WFCT_anxiety_items) {
    df[[key]] <- recode_WFCT_column(df[[key]], key)
  }
  
  
  df$aggressiveWordCompletionScore <- rowMeans(
    replace(df[WFCT_aggression_items], is.na(df[WFCT_aggression_items]), 0)
  )
  
  df$anxiousWordCompletionScore <- rowMeans(
    replace(df[WFCT_anxiety_items], is.na(df[WFCT_anxiety_items]), 0)
  )
  
  # arc sine square root transformation of word completion scores
  df$aggressiveWordCompletionScoreTransformed = asin(sqrt(df$aggressiveWordCompletionScore))
  df$anxiousWordCompletionScoreTransformed = asin(sqrt(df$anxiousWordCompletionScore)) 
  
  df$validWordCompletionScore <- rowSums(!is.na(df[WFCT_all_items])) / length(WFCT_all_items)
  
  return (df)
}


recode_WFCT_column <- function(col, key) {
  # Get the catalog for this WFCT item
  word_df <- word_catalog[[key]]
  
  # Make sure word_df has lowercase words for matching
  word_df$word <- tolower(word_df$word)
  
  sapply(col, function(word) {
    if (is.na(word) || word == "") {
      return(NA)  # empty or missing
    }
    word_lower <- tolower(word)
    
    match_row <- word_df[word_df$word == word_lower, ]
    if (nrow(match_row) == 0) {
      return(NA)  # not in catalog
    }
    if (match_row$encoding == "A") {
      return(1)
    } else if (match_row$encoding == "N") {
      return(0)
    } else {
      return(NA)  # in case there are other encodings
    }
  })
}

addQuestionLabelToDataframe = function(df) {
  df$EDU_label <- factor(
    str_wrap(edu_labels[df$EDU], width = 25),  # Wrap at 25 characters
    levels = str_wrap(edu_labels, width = 25)
  )
  
  df$OCC_label <- factor(
    str_wrap(occ_labels[df$OCC], width = 25),  # Wrap at 25 characters
    levels = str_wrap(occ_labels, width = 25)
  )

  df$GKFEEDBACK_label = factor(
    str_wrap(gkfeedback_labels[df$GKFEEDBACK], width = 25),  # Wrap at 25 characters
    levels = str_wrap(gkfeedback_labels, width = 25)
  )
  
  df$GKSELF_label = factor(
    str_wrap(gkfeedback_labels[df$GKSELF], width = 25),  # Wrap at 25 characters
    levels = str_wrap(gkfeedback_labels, width = 25)
  )
  return(df)
}

exclude_participants <- function(df, condition, description = "Exclusion") {
  before_n <- nrow(df)
  
  df_filtered <- df %>% filter({{ condition }})
  
  after_n <- nrow(df_filtered)
  excluded_n <- before_n - after_n
  
  cat(
    glue::glue(
      "{description}: Excluded {excluded_n} participants ({before_n - after_n} of {before_n}).
Remaining: {after_n}\n\n"
    )
  )
  
  return(df_filtered)
}