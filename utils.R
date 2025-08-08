printNumberOfParticipants = function(df) {
  n = count(df)$n
  
  printf('Number of Observations: %d', n)
}

get_non_existing_words <- function(df, WFCT_items) {
  non_matches <- list()
  
  for (key in WFCT_items) {
    non_matches[[key]] <- character(0)  # initialize empty vector
    
    for (i in seq_len(nrow(df))) {
      word <- tolower(df[[key]][i])
      
      if (!is.na(word)) {
        valid_words <- tolower(word_catalog[[key]]$word)
        
        if (!(word %in% valid_words)) {
          non_matches[[key]] <- c(non_matches[[key]], word)
        }
      }
    }
  }
  
  return(non_matches)
}
# get_non_existing_words(df, WFCT_all_items)
