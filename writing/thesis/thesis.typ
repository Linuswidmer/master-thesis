#import "versatile-apa/lib.typ": *
#import "utils.typ": *

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
          Submitted by
          #v(0.1cm)
          #set par(leading: 0.4em)
          Widmer, Linus \
          Matriculation Number: 627542 \
          Email: widmerli\@student.hu-berlin.de \
          Date, Place of Birth: 17.08.1999, Bremen (Germany)

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

// Enable section numbering for main content
#set heading(numbering: "1.1")

// Show heading numbers in the document
#show heading: it => {
  if it.numbering != none {
    block[
      #counter(heading).display(it.numbering)
      #h(0.5em)
      #it.body
    ]
  } else {
    it
  }
}

= Introduction
#include "sections/introduction.typ"
#include "sections/methods.typ"
#include "sections/results.typ"
#include "sections/discussion.typ"

// Disable numbering for back matter
#set heading(numbering: none)

#pagebreak()
#bibliography(
  "bibliography/ref.bib",
  title: "References",
)

// = Final thoughts
// #lorem(50)

// // = Acknowledgements
// #lorem(50)

#pagebreak()
= Declaration of Independence
#include "sections/declaration.typ"

#show: appendix.with(
  heading-numbering: "A",
  supplement: "Appendix",
)

// #pagebreak()
#include "sections/appendix.typ"

= List of Appendices
#appendix-outline(title: none)
