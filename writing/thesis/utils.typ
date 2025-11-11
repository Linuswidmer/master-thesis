#let citeWithPrefix(prefix: "", keys: none, suffix: "")  = {
  let citationAuthor = cite(keys, form: "author")
  let citationYear = cite(keys, form: "year")
  text("(" + prefix + "; " + citationAuthor + ", " + citationYear + ")");
}
