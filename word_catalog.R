agg1_word_list = list(
  c('wut', 'A'),
  c('mut', 'N'),
  c('hut', 'N'),
  c('gut', 'N'),
  c('tut', 'N')
)

agg2_word_list = list(
  c('zorn', 'A'),
  c('dorn', 'N'),
  c('korn', 'N'),
  c('horn', 'N'),
  c('vorn', 'N')
)

agg3_word_list = list(
  c('gier', 'A'),
  c('bier', 'N'),
  c('tier', 'N'),
  c('vier', 'N')
)

agg4_word_list = list(
  c('rage', 'A'),
  c('vage', 'N'),
  c('tage', 'N'),
  c('sage', 'N'),
  c('lage', 'N'),
  c('page', 'N'),
  c('jage', 'N')
)

agg5_word_list = list(
  c('wunde', 'A'),
  c('runde', 'N'),
  c('hunde', 'N'),
  c('munde', 'N'),
  c('kunde', 'N'),
  c('bunde', 'N')
)

agg6_word_list = list(
  c('dieb', 'A'),
  c('hieb', 'A'),
  c('sieb', 'N'),
  c('lieb', 'N'),
  c('rieb', 'N')
)

agg7_word_list = list(
  c('hass', 'A'),
  c('nass', 'N'),
  c('fass', 'N'),
  c('bass', 'N'),
  c('dass', 'N'),
  c('pass', 'N'),
  c('lass', 'N'),
  c('mass', 'N')
)

agg8_word_list = list(
  c('toben', 'A'),
  c('loben', 'N'),
  c('hoben', 'N')
)

agg9_word_list = list(
  c('jagen', 'A'),
  c('wagen', 'A'),
  c('sagen', 'N'),
  c('tagen', 'N'),
  c('magen', 'N'),
  c('ragen', 'N'),
  c('nagen', 'N')
)

agg10_word_list = list(
  c('kampf', 'A'),
  c('dampf', 'N'),
  c('mampf', 'N')
)

all_aggs <- list(
  WFCTagg1 = agg1_word_list,
  WFCTagg2 = agg2_word_list,
  WFCTagg3 = agg3_word_list,
  WFCTagg4 = agg4_word_list,
  WFCTagg5 = agg5_word_list,
  WFCTagg6 = agg6_word_list,
  WFCTagg7 = agg7_word_list,
  WFCTagg8 = agg8_word_list,
  WFCTagg9 = agg9_word_list,
  WFCTagg10 = agg10_word_list
)


word_catalog <- list()

for (agg_name in names(all_aggs)) {
  agg_data <- all_aggs[[agg_name]]
  
  df <- do.call(rbind, lapply(agg_data, function(entry) {
    data.frame(word = entry[1], encoding = entry[2], stringsAsFactors = FALSE)
  }))
  
  word_catalog[[agg_name]] <- df
}