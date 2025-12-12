#import "@preview/versatile-apa:7.1.2": apa-figure


// = Final thoughts
// #lorem(50)

// == Thoughts on the future
// #lorem(20)

// #lorem(30)

// === Future work
// #lorem(50)

// ==== Fourth level
// #lorem(100)

// = Acknowledgements
// #lorem(50)

= Materials Supplement

Hier auch immer die Englische Version (Original) zu den Items geben!

== Motivation For Masculine Behavior
Answered on a 7 point Likert Scale ranging from "Stimme überhaupt nicht zu" to "Stimme voll und ganz zu"
=== Pressured Motivation Subscale
+ Im Allgemeinen verhalte ich mich männlich, weil ich die Akzeptanz und Anerkennung anderer möchte.
+ Im Allgemeinen bin ich männlich, weil das von mir erwartet wird.
+ Ich verhalte mich männlich, weil ich möchte, dass man mich mag.
+ Ich verhalte mich in Gegenwart anderer männlich, um ihre Erwartungen zu erfüllen.
+ Ich bin nicht weiblich, weil ich glaube, dass mich die Leute sonst nicht mögen würden.
=== Autonomous Motivation Subscale
+ Es ist mir wichtig, männlich zu sein.
+ Ich bin gerne männlich
+ Es macht mich glücklich, wenn ich männlich bin.
+ Es ist mir wichtig, nicht weiblich zu sein.

#linebreak()

== Gender Knowledge Test
+ Ein Motorrad mit 8000 Umdrehungen pro Minute erzeugt ein Auspuffgeräusch bei (4000 U/min vs. 8000 U/min)
+ Um die Leistung eines Motors zu erhöhen, sollte man (den Kraftstoff einspritzen vs. den Hubraum verringern)
+ In der Natur entspricht eine Zündkerze am ehesten (Sonnenfeuer vs. Blitz)
+ Karate entstand aus Kampfkünsten, entwickelt in (Japan vs. China) 
+ Welche Art von Gewehren wurde im Zweiten Weltkrieg oft von Soldaten verwendet? (Gatling vs. Tommy)
+ Die Rillen im Lauf eines Revolvers sind (spiralförmig vs. glatt)
+ Wenn man den Schwimmer im Spülkasten austauschen muss, fragt man nach (einer Absperrklappe vs. einem Kugelhahn)
+ Die Paste, die man zum Löten verwendet, heißt (Gel vs. Flussmittel)
+ Hugh Hefner veröffentlichte das erste Playboy-Magazin im Jahr (1963 vs. 1953)
+ In welchem Film tötete Arnold Schwarzenegger mehr Menschen? (True Lies vs. Total Recall)
+ Laut Olympischen Regeln wiegen Boxhandschuhe in allen Gewichtsklassen (12 Unzen vs. 10 Unzen)
+ Beim Zuschlagen sollte die Faust worauf gerichtet sein? (hinter das Ziel vs. direkt auf das Ziel)
+ Beim Zuschlagen kommt die meiste Kraft von (der Geschwindigkeit der Faust vs. dem Oberarm und der Schulter)
+ Was ist der beste Weg, einen Schlag abzuwehren? (mit dem Unterarm zum Block vs. mit der Hand fangen)
+ Wenn man ein Auto rammt, um es außer Gefecht zu setzen, sollte man worauf zielen? (hinteren Beifahrerreifen vs. vorderen Fahrerreifen) 
+ Man trägt Manolo Blahniks am (Kopf vs. Fuß)
+ Botox glättet Falten vorübergehend durch (Hautbefeuchtung vs. Muskelentspannung)
+ Die erste Firma, die Haarfärbemittel entwickelte, war (Clairol vs. L’Oréal)
+ Welches Getränk machte die Sendung "Sex and the City" populär? (Cosmopolitan vs. Manhattan)
+ In welchem Alter beginnen Kinder typischerweise mit dem Zahnen? (über 1 Jahr vs. unter 1 Jahr)
+ In welchem Alter sollte die Sauberkeitserziehung sollte beginnen? (36 Monate vs. 12 Monate)
+ Welches Medikament sollte Kindern nicht gegeben werden? (Ibuprofen vs. Aspirin)
+ Wie viele Tassen Wasser braucht man, um 1 Tasse Reis zu kochen? (2 Tassen vs. 3 Tassen)
+ Wie lange können Reste bei Zimmertemperatur bedenkenlos aufbewahrt werden (4 Stunden vs. 2 Stunden)
+ Wenn kein Backpulver vorhanden ist, ersetzt man es durch Natron und (Salz vs. Weinstein)
+ Eine Mehlschwitze ist am besten zu beschreiben als (Soße vs. Kuchen)
+ Im Vergleich zu Männern benötigen Frauen mehr (Eisen vs. Zink)
+ Welches dieser Lebensmittel enthält einen natürlichen Stimmungsaufheller? (Schokolade vs. Kaviar)
+ Während der Schwangerschaft tritt morgendliche Übelkeit normalerweise in welchem Trimester auf? (zweites vs. erstes)
+ Übungen, die das Sexualleben einer Frau verbessern, heißen (Kegel-Übungen vs. Pilates)

== Masculinity Threatening and Non-Threatening Feedback
Men in the Threat condition received the following feedback:

"Glückwunsch! Du hast gerade den Geschlechtsidentitäts-Fragebogen abgeschlossen.
Dieser Fragebogen misst, wie deine Geschlechtsidentität mit den anderen Teilnehmenden in Verbindung steht.
Die Skala der Auswertung geht von -4 (maximaler weiblicher Score) zu 4 (maximal männlicher Score). Dein Geschlechtsidentitäts-Score ist: -0.5.

Interpretation deines Testergebnisses: Dein Score liegt deutlich unter dem Wert, der durchschnittlich bei Männern gemessen wird (2.5). Das bedeutet, dass dein Selbstverständnis mehr weiblich als männlich ist und deutlich weniger männlich als der durchschnittliche Mann.

Unten dargestellt ist dein Testergebnis zusammen mit der Verteilung aller Männer, die am Geschlechtsidentitäts-Fragebogen teilgenommen haben."

#align(center, image("../assets/DistributionMasculinityThreat.png", height: 25%)
)



== Word Fragment Completion Task

#apa-figure(
  table(
    align: (x, y) => if y == 0 and x >= 0 {
      center
    } else if x == 0 and y > 0 {
      left
    } else {
      center
    },
    columns: (1fr, 2fr, 2fr),
    table.hline(),
    table.header(
      [Word Fragment],
      [Aggressive Completion],
      [Neutral Completion],
    ),
    table.hline(),
    [\_UT], [WUT], [MUT, HUT], 
    [\_ORN], [ZORN], [DORN, KORN, HORN],  
    [\_IER], [GIER], [BIER, TIER, VIER],  
    [\_AGE], [RAGE], [VAGE, TAGE, SAGE],  
    [\_UNDE], [WUNDE], [RUNDE, HUNDE],  
    [\_IEB], [DIEB, HIEB], [SIEB, LIEB, RIEB],  
    [\_ASS], [HASS], [NASS, FASS, BASS, DASS],  
    [\_OBEN], [TOBEN], [LOBEN, ROBEN],  
    [\_AGEN], [JAGEN, WAGEN], [TAGEN, SAGEN, MAGEN, RAGEN],  
    [\_AMPF], [KAMPF], [DAMPF],

    
  ),
    label: "table:wfct",
      caption: [Items for the Word Fragment Completion Task on Aggressive Cognition],
)
#apa-figure(
  table(
    align: (x, y) => if y == 0 and x >= 0 {
      center
    } else if x == 0 and y > 0 {
      left
    } else {
      center
    },
    columns: (1fr, 2fr, 2fr),
    table.hline(),
    table.header(
      [Word Fragment],
      [Anxious Completion],
      [Neutral Completion],
    ),
    table.hline(),
[\_ORGEN], [SORGEN], [MORGEN, BORGEN],  
[\_ANGEN], [BANGEN], [FANGEN, WANGEN, SANGEN],  
[\_EUE], [REUE], [NEUE],  
[\_ROST], [TROST], [PROST],  
[\_AST], [LAST], [MAST, FAST, RAST, BAST],  
[\_EERE], [LEERE], [BEERE],  
[\_ERN], [FERN], [KERN, GERN],  
[\_ESSEL], [FESSEL], [KESSEL, NESSEL, SESSEL],  
[\_ANISCH], [PANISCH], [MANISCH],  
[\_ANNE], [PANNE], [KANNE, TANNE],    
  ),
    label: "table:wfct",
      caption: [Items for the Word Fragment Completion Task on Anxious Cognition],
)

// == Manipulation Check
// == Demographic Items

== Power Analysis

#apa-figure(
  table(
    align: (x, y) => if y == 0 and x >= 0 {
      center
    } else if x == 0 and y > 0 {
      left
    } else {
      center
    },
    columns: (2fr, 1.5fr, 1fr, 1fr),
    table.hline(),
    table.header(
      [Study],
      [Dependent Variable],
      [Effect Size],
      [Note],
    ),
    [#cite(<vandello2008precarious>, form: "prose"), Study 4], [anxious cognition], [$d$ = 0.55], [-],

    [#cite(<stanaland2021man>, form: "prose")],
    [aggressive cognition],[$d$ = 0.41], [-],
    
    [#cite(<vandello2008precarious>, form: "prose"), Study 5], [aggressive cognition], [$d$ = 0.91], [-],

    [#cite(<stanaland2024adolescent>, form: "prose")], [aggressive cognition], [$d$ = 0.35], [adolescents],

    [#cite(<stanaland2024adolescent>, form: "prose")], [pressured motivation], [$f$ = 0.17], [adolescents],
    table.hline(),
  ),
  caption: [Effect Sizes for Masculinity Threat and Motivation of Masculine Behavior],
  note: [
   Effect Sizes for aggressive and anxious cognition induced by a masculinity threat. All studies measured aggressive and anxious cognition using a WFCT and induced operationalized masculinity threat via a negative feedback on the Gender Knowledge Test.
  ],
  label: "table:effect-sizes",
)

#apa-figure(
  caption: [Power Analysis for Masculinity Threat on Aggressive Cognition],
 image("../assets/PowerAnalysis1.png", height: 25%),
  label: "fig:sample-bar-graph",
)

#apa-figure(
  caption: [Power Analysis for Masculinity Threat on Anxious Cognition],
 image("../assets/PowerAnalysis2.png", height: 25%),
  label: "fig:sample-bar-graph",
)

#apa-figure(
  caption: [Power Analysis for Moderation of Motivation for Masculine Behavior on Threat Effect],
 image("../assets/PowerAnalysis3.png", height: 25%),
  label: "fig:sample-bar-graph",
)

= Results Supplement

#apa-figure(
  table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    stroke: none,
    table.hline(),
    table.header(
      [Item], [Description], [_M_], [_SD_],
    ),
    table.hline(),
    [1], [I'm masculine because I want others' acceptance and approval.], [3.55], [1.78],
    [2], [I'm masculine because that is what people expect from me.], [3.75], [1.74],
    [3], [I'm masculine because I want people to like me.], [3.35], [1.68],
    [4], [I'm masculine around other people because that is how others think I should be.], [3.51], [1.74],
    [5], [I'm not feminine because people wouldn't like me.], [2.97], [1.68],
    table.hline(stroke: 0.5pt),
    [6], [It's important to me to be masculine.], [4.06], [1.79],
    [7], [I enjoy being masculine.], [5.29], [1.49],
    [8], [It makes me happy if I'm masculine.], [4.32], [1.68],
    [9], [It is important to me not to be feminine.], [3.26], [1.77],
    table.hline(),
  ),
  caption: [Descriptive Statistics for Motivation for Masculine Behavior Items],
  note: [_N_ = 154. Items 1–5 = Pressured Motivation subscale; Items 6–9 = Autonomous Motivation subscale. Items rated on a 7-point Likert scale (1 = strongly disagree, 7 = strongly agree).],
  label: "table:mmb-descriptives",
)

#apa-figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (center, left, center, center, center),
    stroke: none,
    table.hline(),
    table.header(
      [Item], [Fragment], [_M_], [_SD_], [_n_],
    ),
    table.hline(),
    [1], [\_UT], [.05], [.21], [146],
    [2], [\_ORN], [.13], [.34], [150],
    [3], [\_IER], [.07], [.26], [149],
    [4], [\_AGE], [.08], [.27], [148],
    [5], [\_UNDE], [.03], [.18], [151],
    [6], [\_IEB], [.51], [.50], [152],
    [7], [\_ASS], [.10], [.30], [143],
    [8], [\_OBEN], [.41], [.49], [140],
    [9], [\_AGEN], [.23], [.42], [142],
    [10], [\_AMPF], [.64], [.48], [141],
    table.hline(),
  ),
  caption: [Descriptive Statistics for Aggressive Word Fragment Completion Items],
  note: [Mean represents proportion of aggressive completions (0 = neutral, 1 = aggressive).],
  label: "table:wfct-agg-descriptives",
)

#apa-figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (center, left, center, center, center),
    stroke: none,
    table.hline(),
    table.header(
      [Item], [Fragment], [_M_], [_SD_], [_n_],
    ),
    table.hline(),
    [1], [\_ORGEN], [.31], [.47], [144],
    [2], [\_ANGEN], [.03], [.18], [145],
    [3], [\_EUE], [.85], [.36], [108],
    [4], [\_ROST], [.26], [.44], [145],
    [5], [\_AST], [.33], [.47], [140],
    [6], [\_EERE], [.36], [.48], [148],
    [7], [\_ERN], [.16], [.37], [144],
    [8], [\_ESSEL], [.08], [.27], [151],
    [9], [\_ANISCH], [.86], [.35], [105],
    [10], [\_ANNE], [.17], [.37], [144],
    table.hline(),
  ),
  caption: [Descriptive Statistics for Anxious Word Fragment Completion Items],
  note: [Mean represents proportion of anxious completions (0 = neutral, 1 = anxious).],
  label: "table:wfct-anx-descriptives",
)
