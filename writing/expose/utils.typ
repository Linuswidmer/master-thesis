#let citewith(comment, key) = {
  let citation = cite(key, form: "parenthetical")
  "(" + comment + "; " + citation + ")"
}