#import "@preview/versatile-apa:7.1.1": *
#import "utils.typ": *
#import "@preview/muchpdf:0.1.0": muchpdf

#let doc-title = [Motivated Responses to a Masculinity Threat in a German Cultural Context]

#let abstract-content = include("sections/abstract.typ")

#let date = datetime.today().display()

#show: versatile-apa.with(
  title: doc-title,
 
  authors: (
    (
      name: [
        Master Thesis of
        
        L i n u s W i d m e r

        #linebreak()

        Matriculation Number: _627542_

        Mail: _widmerli\@student.hu-berlin.de_
      ],
    ),
  ),
  affiliations: (
    (
      id: "AF-1",
      name: [ #linebreak() 
      Humboldt-University Berlin #linebreak() 
Institute of Psychology #linebreak() 
Chair of Social and Organizational Psychology

    ],
    ),
  ),
  due-date: date,

  // Student-specific fields
  // course: [Course Code: Course Name],
  instructor: [
    #linebreak()
    First Supervisor: _Dr. Ulrich Klocke_
    
    Second Supervisor: _Prof. Dr. Ursula Hess_
  ],

  // Professional-specific fields
  running-head: [Motivation, Masculinity & Threat],
  // author-notes: [
  //   #include-orcid([Author Name], "0000-0000-0000-0000")

  //   #lorem(50)
  // ],
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
