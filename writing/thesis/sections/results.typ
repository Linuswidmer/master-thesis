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
#linebreak()
== Moderation of Masculinity Threat Effects

#ref(<fig:moderation-masculinity-threat>) illustrates the moderation of 

===  Motivation For Masculine Behavior
A crucial predecessor for the moderation of masculinity threat effects by MMB is the validity and reliability of the MMB scale:
- 9 Items were conducted to assess the oarticipants Motivation for Mascuine Behavior and validate the hypothesized 2 factor structure.
- Means and SD of Items can be found in Table (TODO).
- The correlation between items is visualized in Figure (TODO).
- Computing the Kaiser-Maier-Olkin criterion on the correlation of items yielded an overall MSA of .85, indicating a sampling adequacy for factor analysis.

The hypothesized model by @stanaland2021man stated a latent factor for pressured motivation that loads on items 1-5, as well as a latent factor for pressured motivation loading on items 6 - 9 and constraining the covariance between the two latent factors to 0. 

To validate the hypothesized factor structure by Stanaland et al. (2021), a confirmatory factor analysis was run and fit indices were evaluated:

=== Pressured Motivation on Aggressive Cognition (Hypothesis 2a)
...

=== Autonomous Motivation on Anxious Cognition (Hypothesis 2b)
...