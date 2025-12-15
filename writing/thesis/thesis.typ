#import "@preview/versatile-apa:7.1.5": *
#import "utils.typ": *
#import "@preview/muchpdf:0.1.0": muchpdf

#let doc-title = [Motivated Responses to a Masculinity Threat in a German Cultural Context]

#let abstract-content = include("sections/abstract.typ")

#let date = datetime.today().display()

#show: versatile-apa.with(
  title: [
    #set text(weight: "regular", size: 12pt)
    #v(-3cm)
    #align(right)[
      #image("assets/hu-logo-cropped.svg", width: 103%)
    ]
    #align(left)[
      #set par(leading: 0.4em)
      #text(weight: "bold")[Faculty of Life Sciences] \
      Institute of Psychology
    ]
    #v(1.5cm)
    #align(center)[
      #text(size: 14pt, weight: "bold")[Master Thesis]
      #v(0.3cm)
      for the attainment of the academic degree Master of Science
    ]
    #v(1cm)
    #align(left)[
      #text(size: 13pt, weight: "bold")[#doc-title]
    ]

    #v(1cm)
    #date
  ],

  authors: (
    (
      name: [
        #align(left)[
          #v(1fr)
          submitted by
          #v(0.3cm)
          #set par(leading: 0.4em)
          Widmer, Linus \
          Matriculation Number: 627542 \
          Email: widmerli\@student.hu-berlin.de \
          Birthdate & place: 17.08.1999, Bremen (Germany)

          #set par(leading: 0.4em)
          First Examiner: Dr. Ulrich Klocke \
          Second Examiner: Prof. Dr. Ursula Hess
        ]
      ],
    ),
  ),

  affiliations: (
    (
      id: "AF-1",
      name: [],
    ),
  ),

  // Professional-specific fields
  running-head: [Motivation, Masculinity & Threat],
  keywords: ("Fragile Masculinity", "Identity Threat", "Motivation"),
  abstract: abstract-content,

  // Common fields
  font-family: "Libertinus Serif",
  font-size: 12pt,
  region: "us",
  language: "en",
  paper-size: "us-letter",
  implicit-introduction-heading: false,
  abstract-as-description: true,
)

#outline()
#pagebreak()

= #doc-title
#include "sections/introduction.typ"
#include "sections/methods.typ"
#include "sections/results.typ"

// #pagebreak()
// #include "sections/quotes.typ"

// #pagebreak()
// #include "sections/computer-code.typ"

// #pagebreak()
// #include "sections/math.typ"

#pagebreak()
#bibliography(
  "bibliography/ref.bib", // or ref.yml
  full: true,
  title: auto,
)



// #pagebreak()
// #include "sections/footnote.typ"

// #pagebreak()
// #include "sections/tables.typ"

// #pagebreak()
// #include "sections/figures.typ"

#pagebreak()
= Declaration of Independence
#muchpdf(read("assets/12-a-Vorlage Eigenständigkeitserklärung-KI-Psychologie.pdf", encoding: none), height: 90%, width: 100%)

#show: appendix.with(
  heading-numbering: "A",
  supplement: "Appendix",
)

#pagebreak()
#include "sections/appendix.typ"

= List of Appendices
#appendix-outline(title: none)
