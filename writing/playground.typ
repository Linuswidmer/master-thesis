#import "@preview/versatile-apa:7.1.1": *


#let citeWithPrefix(prefix: "", keys: none)  = {
  let citationAuthor = cite(keys, form: "author")
  let citationYear = cite(keys, form: "year")
  text("(" + prefix + "; " + citationAuthor + ", " + citationYear + ")");
}

normal single citation: #cite(<hoogland1998robustness>))

normal multi citation: #cite(<hoogland1998robustness>) #cite( <winer1971statistical>))

inline citation: #citeWithPrefix(prefix: "Rank 1/3", keys: <hoogland1998robustness>)

#bibliography("thesis/bibliography/ref.bib", style: "apa")