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

summary_mean_sd <- function(data, column, digits = 2) {
  col_sym <- rlang::sym(column)
  
  data %>%
    summarise(
      mean = round(mean(!!col_sym, na.rm = TRUE), digits),
      sd   = round(sd(!!col_sym, na.rm = TRUE), digits)
    )
}

freq_table <- function(data, column) {
  col_sym <- rlang::ensym(column)  # tidy evaluation
  col_levels <- levels(factor(data[[as_string(col_sym)]])) # get all unique levels
  
  data %>%
    count(!!col_sym, name = "Count") %>%                  # count existing rows
    complete(!!col_sym := col_levels, fill = list(Count = 0)) %>% # add missing levels
    mutate(Percent = round(100 * Count / sum(Count), 1)) %>%
    arrange(desc(Count))
}
