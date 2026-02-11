// Declaration of Independence (Eigenständigkeitserklärung)
// This is a separate document that can be included in the thesis

#let declaration-page(
  location: "Berlin",
  date: datetime.today().display("[day].[month].[year]"),
  signature-image: none,
) = {

  set text(font: "Libertinus Serif", size: 11pt, lang: "de")
  set par(justify: true, leading: 0.65em, first-line-indent: 0pt)

  // Logo header
  align(right)[
    #image("../assets/hu-logo-small.svg", width: 2.5cm)
  ]

  v(1cm)

  // Title
  align(center)[
    #underline[*Eigenständigkeitserklärung*]
  ]

  v(0.8cm)

  // Declaration text
  [
    Ich versichere, dass ich die vorliegende schriftliche Arbeit selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel verwendet habe, alle Ausführungen, die anderen Schriften wörtlich oder sinngemäß entnommen wurden, kenntlich gemacht sind und die Arbeit in gleicher oder ähnlicher Form noch nicht für andere Prüfungen verwendet wurde sowie keiner anderen Prüfungsbehörde vorgelegen hat.

    Ich habe alle Stellen, die dem Wortlaut oder dem Sinn nach (inkl. Übersetzungen) anderen Werken entnommen sind, unter genauer Angabe der Quelle (einschl. des World Wide Web sowie anderer elektronischer Datensammlungen) deutlich als Entlehnung kenntlich gemacht. Dies gilt auch für angefügte Zeichnungen, bildliche Darstellungen, Skizzen und dergleichen.

    Zusätzlich versichere ich, dass ich beim Einsatz von IT-/KI-gestützten Werkzeugen diese Werkzeuge in der unten genannten „Übersicht verwendeter Hilfsmittel" mit ihrem Produktnamen und der Versionsnummer, meiner Bezugsquelle (z.B. URL) und Angaben zur Nutzung vollständig aufgeführt sowie die Checkliste wahrheitsgemäß ausgefüllt habe. Davon ausgenommen sind diejenigen IT-/KI-gestützten Schreibwerkzeuge, die von meinem zuständigen Prüfungsbüro bis zum Zeitpunkt der Abgabe meiner Arbeit als nicht anzeigepflichtig eingestuft wurden („Whitelist"). Bei der Erstellung dieser Arbeit habe ich durchgehend eigenständig und beim Einsatz IT-/KI-gestützter Schreibwerkzeuge steuernd gearbeitet.

    Mir ist bekannt, dass bei Verstößen gegen diese Grundsätze ein Verfahren wegen Täuschungsversuchs bzw. Täuschung gemäß der fachspezifischen Prüfungsordnung und/oder der Fächerübergreifenden Satzung zur Regelung von Zulassung, Studium und Prüfung der Humboldt-Universität zu Berlin (ZSP-HU) eingeleitet wird.
  ]

  v(1.5cm)

  // Signature line
  [
    #if signature-image != none {
      place(dx: 4cm, dy: -1cm)[#image(signature-image, width: 4cm)]
    }
    #location, #date
    #v(-0.3cm)
    #line(length: 100%, stroke: 0.5pt + black)
    #text(size: 10pt)[Ort, Datum, Unterschrift]
  ]

  pagebreak()

  // === PAGE 2: Übersicht verwendeter Hilfsmittel ===

  align(right)[
    #image("../assets/hu-logo-small.svg", width: 2.5cm)
  ]

  v(1cm)

  align(center)[
    #underline[*Übersicht verwendeter Hilfsmittel*]
  ]

  v(0.5cm)

  [
    *Ausfüllhinweis:* Bitte geben Sie an, welche der folgenden Programme Sie im Rahmen Ihrer Arbeit verwendet haben. Bitte tragen Sie dazu bei jedem Programm ein, wie Sie dieses genutzt haben. Tragen Sie dazu die jeweilige Ziffer in die Spalte "Nutzung" ein. Es können mehrere Ziffern je Programm eingetragen werden. Sollten Sie ein Programm genutzt haben, welches nicht in der Tabelle aufgeführt ist, ergänzen Sie dieses bitte unter Angabe der Nutzungsart.
  ]

  v(0.5cm)

  [*Nutzung:*]

  v(0.2cm)

  enum(
    start: 0,
    indent: 0.5cm,
    [Nicht verwendet],
    [Generierung von Ideen/Brainstorming],
    [Literaturrecherche],
    [Übersetzung von Texten],
    [Zusammenfassen von Quellen],
    [Inhalte auf andere Art und Weise erklären lassen (z. B. Konstrukte, methodische Vorgehensweisen, Analysen)],
    [Erstellen von Textabschnitten, welche als Vorlage dienen],
    [Überarbeitung von eigenen Textelementen (bitte Seitenzahl der Arbeit angeben)],
    [Auswertung von Daten (z. B. Schreiben von Code, Definieren der passenden Auswertungsmethoden, Erstellen von Abbildungen)],
    [Rechtschreibprüfung],
    [Visualisierungen zu illustrativen oder dekorativen Zwecken],
  )

  v(0.5cm)

  [*Checkliste: IT-/KI-gestützte Schreibwerkzeuge:*]

  v(0.3cm)

  // Table for AI tools
  table(
    columns: (1fr, 1fr, 0.8fr),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left,
    // Header
    [*Programm* \ #text(size: 9pt)[(Bitte geben Sie auch weitere Programme an, die Sie verwendet haben, um Ihre Arbeit zu schreiben.)]],
    [*falls relevant: betroffene Abschnitte* \ #text(size: 9pt)[(Bitte geben Sie Seitenzahlen an, sofern es nicht auf das gesamte Dokument zutrifft.)]],
    [*Nutzung* \ #text(size: 9pt)[(Bitte Zahl eintragen – siehe oben)]],
    // Data rows - fill in your usage
    [ChatGPT], [], [1, 2, 3, 4, 5, 6, 7, 8, 9],
    [Elicit.org], [], [],
  )

  pagebreak()

  // === PAGE 3: Continuation ===

  align(right)[
    #image("../assets/hu-logo-small.svg", width: 2.5cm)
  ]

  v(0.5cm)

  // Continuation of table
  table(
    columns: (1fr, 1fr, 0.8fr),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left,
    [Grammarly], [], [],
    [GitHub Copilot], [], [],
    [Perplexity AI], [], [],
    [ChatPDF], [], [],
    [DeepL], [], [3],
    [BingChat], [], [],
    [Gamma], [], [],
    [Humanata AI], [], [],
    [Keenious], [], [],
    [Monica], [], [],
    [Claude], [], [1, 2, 3, 4, 5, 6, 7, 8, 9],
    [Gemini], [], [6, 7, 9],
  )

  // v(0.5cm)

  [
    Sofern Sie sich unsicher sind, ob ein Programm unter "künstliche Intelligenz" fällt, tragen Sie es ein. Es erwachsen Ihnen keine Nachteile durch die Nennung des Programms. Sollten Sie weitere Programme verwendet haben, können Sie diese in die leeren Zeilen eintragen.
  ]

  v(0.8cm)

  align(center)[
    #underline[*Whitelist*]
  ]

  v(0.5cm)

  [
    Folgende Programme müssen nicht aufgelistet oder bewertet werden. Diese Programme können ohne weitere Angaben genutzt werden:

    #list(
      marker: sym.checkmark,
      [Microsoft Office, LaTeX, OpenOffice, iWork],
      [Google Scholar],
      [Datenbanken der Universitätsbibliothek],
      [Literaturverwaltungsprogramme (Zotero, Endnote, Mendeley, etc.)],
    )
  ]

  v(0.8cm)

  [*Ggf. weitere Erklärungen:*]

  v(3cm)
}

// Call the function to render
#declaration-page(signature-image: "../assets/signature.jpg")
