#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#let consort-flowchart = {
  set text(size: 9pt)

  diagram(
    spacing: (10mm, 8mm),
    node-stroke: 0.5pt,
    edge-stroke: 0.5pt,

    // Enrollment
    node((0, 0), align(center)[*Enrollment*], stroke: none, name: <enrollment-label>),
    node((1, 0), align(center)[
      Completed survey \
      ($n = 196$)
    ], width: 45mm, name: <enrolled>),

    // Withdrew data
    edge(<enrolled>, <after-withdraw>, "-|>"),
    node((2, 0), align(left)[
      Withdrew data after debriefing ($n = 8$)
    ], width: 55mm, name: <withdrew>),
    edge(<enrolled>, <withdrew>, "-|>"),

    // After withdrawal
    node((1, 1), align(center)[
      Remaining \
      ($n = 188$)
    ], width: 45mm, name: <after-withdraw>),

    // Eligibility exclusions
    edge(<after-withdraw>, <after-eligibility>, "-|>"),
    node((2, 1), align(left, box[
      #set par(leading: 0.4em, spacing: 0.4em)
      Did not meet eligibility ($n = 13$) #linebreak()
      #text(size: 8pt)[- Gender other than male ($n = 9$)] 
      #text(size: 8pt)[- Under 18 years ($n = 3$)]
      #text(size: 8pt)[- Insufficient German ($n = 1$)]
    ]), width: 55mm, name: <eligibility>),
    edge(<after-withdraw>, <eligibility>, "-|>"),

    // After eligibility
    node((1, 2), align(center)[
      Remaining \
      ($n = 175$)
    ], width: 45mm, name: <after-eligibility>),

    // Suspicion exclusions
    edge(<after-eligibility>, <after-suspicion>, "-|>"),
    node((2, 2), align(left)[
      Identified study purpose ($n = 9$)
    ], width: 55mm, name: <suspicion>),
    edge(<after-eligibility>, <suspicion>, "-|>"),

    // After suspicion
    node((1, 3), align(center)[
      Remaining \
      ($n = 166$)
    ], width: 45mm, name: <after-suspicion>),

    // Attention exclusions
    edge(<after-suspicion>, <randomized>, "-|>"),
    node((2, 3), align(left, box[
      #set par(leading: 0.4em, spacing: 0.4em)
      Insufficient task completion ($n = 12$) #linebreak()
      #text(size: 8pt)[- WFCT < 50% complete ($n = 11$)]
      #text(size: 8pt)[- MMB all items missing ($n = 1$)]
    ]), width: 55mm, name: <attention>),
    edge(<after-suspicion>, <attention>, "-|>"),

    // Analysis label
    node((0, 4), align(center)[*Analysis*], stroke: none, name: <analysis-label>),

    // Randomized / Final sample split
    node((1, 4), align(center)[
      Analyzed \
      ($N = 154$)
    ], width: 45mm, name: <randomized>),

    // Split to conditions
    edge(<randomized>, <threat>, "-|>"),
    edge(<randomized>, <no-threat>, "-|>"),

    // Threat condition
    node((0.3, 5), align(center)[
      Threat condition \
      ($n = 79$)
    ], width: 40mm, name: <threat>),

    // No-threat condition
    node((1.7, 5), align(center)[
      No-threat condition \
      ($n = 75$)
    ], width: 40mm, name: <no-threat>),
  )
}

#consort-flowchart
