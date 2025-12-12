#import "@preview/versatile-apa:7.1.2": apa-figure
#import "../utils.typ": *

= Results
All statistical analyses were conducted on the mean number of positively completed aggressive (or anxious) cognition word fragment trials for each participant.

Given that the aggressive and anxious word fragment completion tasks naturally yield a count outcome bounded by the total number of trials, the dependent variable is assumed to follow a binomial distribution. Therefore, a Generalized Linear Model (GLM) with a binomial family and a logit link function (Logistic Regression) was used for all parametric inferential tests concerning mean differences. This approach is justified by the data's inherent distributional properties.

To ensure the robustness and validity of the results, several checks were implemented. Prior to the main analyses, Levene's Tests were performed to assure the homogeneity of variance. Furthermore, residual Q-Q plots were inspected to ensure the normality of the residuals, confirming the suitability of the model framework. Because outliers may distort the validity of the results (Aguinis, Gottfredson, & Joo, 2013), a sensitivity analysis is included. This involved identifying and removing influential observations (using a threshold of $4 / (n - k)$) and refitting the model to confirm the stability of the findings.

A conservative level of significance (_p_ = .05) was applied throughout all tests. To control the family-wise error rate across analyses within the same dataset (i.e., aggressive cognition trials vs. anxious cognition trials), all $p$-values were subjected to a Bonferroni-Holm correction (Abdi, 2010). Finally, achieved power was _post-hoc_ calculated using G\*Power 3 (Cunningham & McCrum-Gardner, 2007) and was considered sufficient when exceeding the commonly used $alpha = .80$ criterion (Aberson, 2011).

#apa-figure(
  caption: [Boxplot aggressive and anxious cognition],
  image("../images/aggressive-anxious-cognition-by-threat-boxplot.png"),
  label: "fig:agg-anx-cog-boxplot",
  note:[TODO]
)
#linebreak()

== Masculinity Threat Effects
#ref(<fig:agg-anx-cog-boxplot>) illustrates anxious and aggressive cognition values by threat condition.

=== Masculinity Threat on Aggressive Cognition (Hypothesis 1a)
For Hypothesis 1a, a higher mean of aggressive cognition in the threat condition compared to the no threat condition was predicted.
Descriptive statistics, however, indicated a pattern contrary to the hypothesis: the mean aggressive cognition was lower in the threat condition (#reportMeanAndSD(mean: 19.5, sd: 12.3)) than in the no threat condition (#reportMeanAndSD(mean: 22.8, sd: 12.3)). 

Prior to the main analysis, the assumption checks were satisfied (report statistics ???). A GLM with a binomial distribution was conducted to test the effect of masculinity threat on aggressive cognition. The model revealed no statistically significant difference between the two conditions, #reportZStatistic(zValue: -0.1994, pValue: 0.111). Given the directional nature of the hypothesis (predicted effect $beta > 0$), and the observed effect going in the opposite direction, the one-sided $p$-value was $p = .944$, leading to a failure to reject the null hypothesis.

Finally, a sensitivity analysis was performed. After identifying and excluding five influential observations , the GLM was refitted on the reduced sample. The analysis continued to show no significant effect, #reportZStatistic(zValue: -0.191, pValue: 0.139) with a directed one-sided $p$-Value of $p = .93$.

=== Masculinity Threat on Aggressive Cognition (Hypothesis 1b)
...
#linebreak()
#linebreak()
#linebreak()
#linebreak()

#linebreak()
== Moderation of Masculinity Threat Effects

=== Factor Structure Motivation For Masculine Behavior

A crucial predecessor for the moderation analysis was the validation and reliability assessment of the MMB scale.
The hypothesized two-factor model by @stanaland2021man constrained the factors Pressured motivation (Items 1–5) and Autonomous motivation (Items 6–9) to be uncorrelated.
A Confirmatory Factor Analysis (CFA) was run to validate this model.
Computing the Kaiser-Meyer-Olkin criterion on the item correlations yielded an overall Measure of Sampling Adequacy of .85, indicating the data were suitable for factor analysis. The fit indices of the CFA did non satidfy the predefined criteria: (CFI = [TODO], TLI = [TODO], RMSEA = [TODO], SRMR = [TODO]).

To improve model fit and better understand the data structure, an Exploratory Factor Analysis (EFA) with oblimin rotation was conducted. 
A parallel analysis and scree plot suggested retaining two factors. 
The resulting factor loadings (displayed in Table (TODO)) showed a strong coherence for the first five items on the first factor (Pressured). 
However, Item 9, "TODO" displayed a significant cross-loading on both factors (loading on Factor 1 and Factor 2), suggesting poor fit for this item within the intended structure.

A subsequent CFA was conducted on the original 9 items, allowing for a correlation between the two latent factors. This notably improved model fit (CFI = [TODO], TLI = [TODO], RMSEA = [TODO], SRMR = [TODO]), yet the predefined criteria for fit were still not entirely satisfied.

Given the EFA results, Item 9 was identified as problematic due to its high cross-loading and was removed from the scale for further analysis. 
A subsequent examination of the Modification Indices also suggested a high residual covariance between Item 7 and Item 8, which makes conceptual sense as both items express a positive, internal emotional connection ("happy," "glad") to masculine identity. 
A final CFA was run on the 8-item scale, allowing the correlation between the latent factors and between the residuals of Item 7 and Item 8. 
This final model yielded the following fit indices: CFI = [TODO final fit], TLI = [TODO final fit], RMSEA = [TODO final fit], SRMR = [TODO final fit].
This final model was deemed sufficient because the CFI and SRMR satisfied the target values of $0.95$ and $0.08$, respectively. 
While the TLI was just below the target, it can be considered acceptable, and the RMSEA, though still elevated, was substantially reduced. 
This pattern of fit indices may be partially attributed to the restricted final sample size ($N = 154$).

Lastly, reliability scores were computed for the two subscales. McDonald’s omega ($omega$) was used because it does not assume tau-equivalence of the items. 
Scores revealed excellent reliability for the Pressured scale ($omega = .93$) and acceptable reliability for the Autonomous scale ($omega = .7$). 
For the subsequent moderation analysis, row means were used to compute scores for Pressured and Autonomous motivation, with Item 9 excluded from the Pressured scale.

#apa-figure(
  grid(
  columns: (auto, auto),
  grid.cell(
  image("../images/aggressive-cognition-pressured-motivation-line-chart.png"),
  ),grid.cell(
  image("../images/anxious-cognition-autonomous-motivation-line-chart.png"),
  )
),
  caption: [Moderation of word completion scores by motivation for masculine behaviour],
  label: "fig:moderation-masculinity-threat",
  note:[TODO]
)

=== Pressured Motivation on Aggressive Cognition (Hypothesis 2a)
...

#ref(<fig:moderation-masculinity-threat>) illustrates the moderation of 

=== Autonomous Motivation on Anxious Cognition (Hypothesis 2b)
...