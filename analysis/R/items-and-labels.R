## ITEMS

MMB_item_codes <- c("MMBi1", "MMBi2", "MMBi3", "MMBi4", "MMBi5", "MMBi6", "MMBi7", "MMBi8", "MMBi9")
WFCT_aggression_items <- c("WFCTagg1", "WFCTagg2", "WFCTagg3", "WFCTagg4", "WFCTagg5", "WFCTagg6", "WFCTagg7", "WFCTagg8", "WFCTagg9", "WFCTagg10")
WFCT_anxiety_items <- c("WFCTanx1", "WFCTanx2", "WFCTanx3", "WFCTanx4", "WFCTanx5", "WFCTanx6", "WFCTanx7", "WFCTanx8", "WFCTanx9", "WFCTanx10")
demographic_items <- c("AGE", "EDU", "EDUPUPIL", "OCCDEGREE", "SEX", "GER")
manipulation_items <- c("threatCondition", "GKFEEDBACK", "DEBRIEFCONSENT", "GKSELF")
suspicion_items <- c("OPENFEEDBACK", "SUS", "SUSTEXT")
all_items <- c("id", MMB_item_codes, WFCT_aggression_items, WFCT_anxiety_items, demographic_items, manipulation_items)
WFCT_all_items <- c(WFCT_aggression_items, WFCT_anxiety_items)

mmb_pressured_items <- c("MMBi1", "MMBi2", "MMBi3", "MMBi4", "MMBi5")
mmb_autonomous_items <- c("MMBi6", "MMBi7", "MMBi8", "MMBi9")

mmb_labels <- c(
  "Allgemein verhalte ich mich männlich, weil ich die Akzeptanz und Anerkennung anderer möchte",
  "Allgemein bin ich männlich, weil das von mir erwartet wird",
  "Ich verhalte mich männlich, weil ich möchte, dass man mich mag",
  "Ich verhalte mich in Gegenwart anderer männlich, um ihre Erwartungen zu erfüllen",
  "Ich verhalte mich nicht weiblich, weil ich glaube, dass mich die Leute sonst nicht mögen würden",
  "Es ist mir wichtig, männlich zu sein",
  "Ich bin gerne männlich",
  "Es macht mich glücklich, mich männlich zu verhalten",
  "Es ist mir wichtig, mich nicht weiblich zu verhalten"
)

## LABELS

edu_labels <- c(
  "AO01" = "Noch kein Abschluss/Schüler",
  "AO02" = "Schule beendet ohne Abschluss",
  "AO03" = "Haupt-/ Volksschule",
  "AO04" = "Mittlerer Schulabschluss / Realschule / mittlere Reife",
  "AO05" = "Fachhochschulreife / Fachoberschule",
  "AO06" = "Abitur, allgemeine oder fachgebundene Hochschulreife / (EOS)"
)

occ_labels <- c(
  "AO01" = "Noch keinen Berufsabschluss",
  "AO03" = "Lehre (beruflich-betrieblich)",
  "AO04" = "Ausbildung an Berufsfachschule, Handelsschule (beruflich- schulische Ausbildung)",
  "AO05" = "Fachschule (Meister-, Technikerschule, Berufs- oder Fachakademie)",
  "AO06" = "Fachhochschule / Ingenieurschule",
  "AO07" = "Universität / Hochschule",
  "AO08" = "Anderen Berufsabschluss (z.B. im Ausland erworben)"
)

edupupil_label <- c(
  "AO01" = "Haupt-/ Volksschule",
  "AO02" = "Mittlerer Schulabschluss/Realschule/mittlere Reife",
  "AO03" = "Fachhochschulreife/ Fachoberschule",
  "AO04" = "Abitur, allgemeine oder fachgebundene Hochschulreife/ (EOS)"
)

gkfeedback_labels <- c(
  "AO01" = "Sehr typisch weiblich",
  "AO02" = "Eher typisch weiblich",
  "AO03" = "Weder typisch männlich noch typisch weiblich",
  "AO04" = "Eher typisch männlich",
  "AO05" = "Sehr typisch männlich"
)
