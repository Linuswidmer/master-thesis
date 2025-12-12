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
  let second = emph("SD")

  text(first + " = " + meanFormatted + ", " + second + " = " + sdFormatted)
}

#let reportTStatistic(tValue: none, pValue: none, df: none) = {
  if tValue == none or pValue == none or df == none {
    return text("Error: tValue, pValue, and df must be provided.")
  }

  let t_formatted = str(calc.round(tValue, digits: 2))
  let df_formatted = str(df)

  let p_text = if pValue < 0.001 {
    "< .001"
  } else {
    let p_rounded = calc.round(pValue, digits: 3)
    let p_str = repr(p_rounded)
    if p_str.starts-with("0.") {
      p_str.slice(1)
    } else {
      p_str
    }
  }

  text(emph("t") + "(" + df_formatted + ") = " + t_formatted + ", " + emph("p") + " = " + p_text)
}

#let reportModelFitIndices(cfi: none, tli: none, rmsea: none, srmr: none) = {
  // Format each index to 2 decimal places (APA standard for fit indices)
  let format_index = (value) => {
    if value == none {
      return "—"
    }
    let rounded = calc.round(value, digits: 2)
    let str_val = repr(rounded)
    // Remove leading zero for values < 1
    if str_val.starts-with("0.") {
      str_val.slice(1)
    } else {
      str_val
    }
  }

  let cfi_fmt = format_index(cfi)
  let tli_fmt = format_index(tli)
  let rmsea_fmt = format_index(rmsea)
  let srmr_fmt = format_index(srmr)

  text("CFI = " + cfi_fmt + ", TLI = " + tli_fmt + ", RMSEA = " + rmsea_fmt + ", SRMR = " + srmr_fmt)
}