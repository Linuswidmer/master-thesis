#let citeWithPrefix(prefix: "", keys: none, suffix: "") = {
  let citationAuthor = cite(keys, form: "author")
  let citationYear = cite(keys, form: "year")
  text("(" + prefix + "; " + citationAuthor + ", " + citationYear + ")");
}

#let reportZStatistic(zValue: none, pValue: none) = {
  // --- Input Validation ---
  if zValue == none or pValue == none {
    return text("Error: Both zValue and pValue must be provided.")
  }

  // CORRECT: Using 'digits' as the second positional argument.
  // The value of 'digits' is 2 by default.
  let z_formatted =  str(calc.round(zValue, digits: 2))

  // 2. Format the p-Value (e.g., .049 or < .001)
  let p_text = if pValue < 0.001 {
    "< .001"
  } else {
    // Round p-value to 3 digits (fixed, as per APA)
    let p_rounded = calc.round(pValue, digits: 3)
    
    // Convert to string and slice off the leading zero
    let p_str = repr(p_rounded)
    
    if p_str.starts-with("0.") {
      p_str.slice(1) // Slice from index 1 to remove the leading '0'
    } else {
      p_str
    }
  }

  let first = emph("z")
  let second = emph("p")

  text(first + " = " + z_formatted + ", " + second + " = " + p_text)
}

#let reportMeanAndSD(mean: none, sd: none) = {

  let meanFormatted = str(calc.round(mean, digits: 1))
  let sdFormatted = str(calc.round(sd, digits: 1))

  let first = emph("M")
  let seconf = emph("SD")

  text(first + " = " + meanFormatted + ", " + second + " = " + sdFormatted)
}