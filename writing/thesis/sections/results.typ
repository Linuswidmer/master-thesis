#import "../utils.typ": *

= Results
All statistical analyses were conducted on the proportion of aggressive (or anxious) word fragment completions for each participant.

The word fragment completion task yields a count outcome bounded by the total number of trials, and therefore the dependent variable follows a binomial distribution. Accordingly, a Generalized Linear Model (GLM) with a binomial family and logit link function was used for all inferential tests.

To ensure robustness, several diagnostic checks were performed. Prior to the main analyses, Levene's tests assessed homogeneity of variance across conditions. Model diagnostics were evaluated using simulated residuals via the DHARMa package @DHARMa. Because influential obsrvations may distort the validity of the results @aguinis2013best, a sensitivity analysis was conducted by identifying cases exceeding a Cook's distance threshold of $4 / (n - k)$, removing them, and refitting the model to confirm the stability of findings.

A significance level of $alpha = .05$ was applied throughout. To control the family-wise error rate across analyses within the same outcome domain (aggressive vs. anxious cognition), $p$-values were adjusted using the Bonferroni-Holm correction  @abdi2010holm. Post-hoc power was calculated using G*Power 3 @cunningham2007power and was considered sufficient when above the commonly used 80% criterion @aberson2011applied.

#apa-figure(
  caption: [Aggressive and Anxious Word Completion Scores by Threat Condition],
  image("../images/aggressive-anxious-cognition-by-threat-boxplot.png"),
  label: "fig:agg-anx-cog-boxplot",
  note: [Boxplots display the distribution of aggressive and anxious word completion scores (%) by experimental condition. The horizontal line represents the median, boxes represent the interquartile range, and whiskers extend to 1.5 times the interquartile range.]
)

== Masculinity Threat Effects
#ref(<fig:agg-anx-cog-boxplot>) displays the distribution of aggressive and anxious cognition scores by threat condition.

=== Masculinity Threat on Aggressive Cognition (Hypothesis 1a)
Hypothesis 1a predicted higher aggressive cognition in the threat condition compared to the no-threat condition.
Contrary to this prediction, descriptive statistics indicated the opposite pattern: aggressive cognition was lower in the threat condition (#reportMeanAndSD(mean: 19.5, sd: 12.3)) than in the no-threat condition (#reportMeanAndSD(mean: 22.8, sd: 12.3)).

Assumption checks were satisfactory: Levene's test indicated homogeneous variances, and DHARMa residual diagnostics revealed no significant deviations from the expected distribution.
A binomial GLM was conducted to test the effect of threat condition on aggressive cognition.
The model revealed no statistically significant difference between conditions (#reportZStatistic(zValue: -1.592, pValue: 0.111)).
Given the directional hypothesis (predicted $beta > 0$) and the observed effect in the opposite direction, the one-tailed $p$-value was $p = .944$, leading to a failure to reject the null hypothesis.

A sensitivity analysis was performed by identifying and excluding five influential observations.
The GLM refitted on the reduced sample continued to show no significant effect (#reportZStatistic(zValue: -1.479, pValue: 0.139); one-tailed $p = .93$).

=== Masculinity Threat on Anxious Cognition (Hypothesis 1b)
Hypothesis 1b predicted higher anxious cognition in the threat condition compared to the no-threat condition.
Descriptive statistics revealed virtually identical means across conditions: the threat condition (#reportMeanAndSD(mean: 0.28, sd: 0.13)) and the no-threat condition (#reportMeanAndSD(mean: 0.28, sd: 0.15)) showed no meaningful difference.

Assumption checks were satisfactory: Levene's test indicated homogeneous variances, and DHARMa residual diagnostics revealed no significant deviations from the expected distribution.
A binomial GLM was conducted to test the effect of threat condition on anxious cognition.
The model revealed no statistically significant difference between conditions (#reportZStatistic(zValue: 0.177, pValue: 0.859)).
Given the directional hypothesis (predicted $beta > 0$), the one-tailed $p$-value was $p = .430$, leading to a failure to reject the null hypothesis.

A sensitivity analysis was performed by identifying and excluding five influential observations.
The GLM refitted on the reduced sample continued to show no significant effect (#reportZStatistic(zValue: 1.04, pValue: 0.30); one-tailed $p = .15$).

#linebreak()
== Moderation of Masculinity Threat Effects

=== Factor Structure of Motivation for Masculine Behavior

#apa-figure(
  image("../images/corrplot-mmb.png", width: 70%),
  caption: [Polychoric Correlation Matrix for MMB Items],
  note: [Items 1–5 = Pressured Motivation subscale; Items 6–9 = Autonomous Motivation subscale. Rectangles indicate the hypothesized factor structure. Darker shading indicates stronger positive correlations.],
  label: "fig:corrplot-mmb",
)

Prior to the moderation analysis, the validity and reliability of the MMB scale were assessed (see #ref(<fig:corrplot-mmb>) for correlations and #ref(<table:mmb-descriptives>) for item descriptives).
The Kaiser-Meyer-Olkin (KMO) criterion yielded an overall Measure of Sampling Adequacy of .85, indicating the data were suitable for factor analysis.
The hypothesized two-factor model by #cite(<stanaland2021man>, form: "prose") specified uncorrelated latent factors for Pressured Motivation (Items 1–5) and Autonomous Motivation (Items 6–9).
A Confirmatory Factor Analysis (CFA) was conducted to validate this structure; however, the fit indices did not satisfy the predefined criteria (#reportModelFitIndices(cfi: 0.851, tli: 0.801, rmsea: 0.179, srmr: 0.248)).

To better understand the data structure, an Exploratory Factor Analysis (EFA) with oblimin rotation was conducted.
A parallel analysis and scree plot supported a two-factor solution.
The resulting factor loadings (#ref(<table:efa-mmb>)) showed strong coherence for Items 1–5 on the first factor (Pressured Motivation).
However, Item 9 ("It is important to me not to be feminine") displayed a cross-loading on both factors, suggesting poor discriminant validity.

#apa-figure(
  table(
    align: (x, y) => if y == 0 and x >= 0 {
      center
    } else if x == 0 and y > 0 {
      left
    } else {
      center
    },
    columns: (0.5fr, 4fr, 1fr, 1fr),
    table.hline(),
    table.header(
      [Item],
      [Description],
      [Factor 1],
      [Factor 2],
    ),
    table.hline(),
    [1], [In general, I'm masculine because I want others' acceptance and approval.], [.83], [],
    [2], [In general, I'm masculine because that is what people expect from me.], [.90], [],
    [3], [I'm masculine because I want people to like me.], [.79], [],
    [4], [I'm masculine around other people because that is how others think I should be.], [.89], [],
    [5], [I'm not feminine because people wouldn't like me.], [.78], [],
    [6], [It's important to me to be masculine.], [], [.69],
    [7], [I enjoy being masculine.], [], [.74],
    [8], [It makes me happy if I'm masculine.], [], [.80],
    [9], [It is important to me not to be feminine.], [.39], [.39],
    table.hline(),
  ),
  caption: [EFA Factor Loadings for Motivation for Masculine Behavior Scale],
  note: [
    Factor loadings below .30 are suppressed for clarity. Factor 1 = Pressured Motivation; Factor 2 = Autonomous Motivation. Extraction method: Maximum Likelihood with oblimin rotation.
  ],
  label: "table:efa-mmb",
)

A subsequent CFA allowing correlation between the two latent factors notably improved model fit (#reportModelFitIndices(cfi: 0.901, tli: 0.863, rmsea: 0.148, srmr: 0.099)), yet the predefined criteria were still not satisfied.

Based on the EFA results, Item 9 was removed due to its cross-loading.
Examination of modification indices further suggested a residual covariance between Items 7 and 8, which is conceptually plausible as both items express positive affect toward masculine identity ("enjoy," "happy").
A final CFA on the 8-item scale, allowing correlation between the latent factors and between the residuals of Items 7 and 8, yielded acceptable fit (#reportModelFitIndices(cfi: 0.966, tli: 0.947, rmsea: 0.098, srmr: 0.066)).
The CFI and SRMR satisfied the target values of .95 and .08, respectively.
While the TLI fell slightly below the .95 threshold and the RMSEA remained elevated, both showed substantial improvement.
This pattern may be partially attributable to the limited sample size ($N = 154$).

Finally, reliability was assessed using McDonald's omega ($omega$), which does not assume tau-equivalence.
The Pressured Motivation subscale showed excellent reliability ($omega = .93$), while the Autonomous Motivation subscale showed acceptable reliability ($omega = .70$).
For the subsequent moderation analyses, subscale scores were computed as row means, with Item 9 excluded from the Autonomous Motivation scale.

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

== Experimental Manipulation Check
To assess whether the experimental manipulation (threat vs. no-threat feedback on the Gender Knowledge Test) was effective, two measures were examined.

First, participants were asked at the end of the questionnaire to indicate which feedback they had received, on a scale from 1 (stereotypically feminine) to 10 (stereotypically masculine).
Descriptive statistics confirmed a clear distinction between conditions: the threat condition (#reportMeanAndSD(mean: 3.08, sd: 0.93)) reported substantially lower scores than the no-threat condition (#reportMeanAndSD(mean: 6.22, sd: 1.00)).
This indicates that participants accurately recalled the feedback they received.

Second, participants were asked to self-evaluate their gender knowledge on the same scale.
Descriptive statistics showed lower self-evaluations in the threat condition (#reportMeanAndSD(mean: 5.71, sd: 1.43)) than in the no-threat condition (#reportMeanAndSD(mean: 6.79, sd: 1.38)).
A $t$-test confirmed that participants in the threat condition rated their gender knowledge significantly lower than those in the no-threat condition (#reportTStatistic(tValue: 4.735, pValue: 0.00001, df: 154)).
Together, these results indicate that the manipulation was successful in inducing a perceived threat to masculine identity.

== Test Quality: Aggressive Cognition

#apa-figure(
  image("../images/corrplot-aggressive-cognition.png", width: 70%),
  caption: [Tetrachoric Correlation Matrix for Aggressive Word Fragment Items],
  note: [Darker shading indicates stronger positive correlations. Item descriptives are provided in #ref(<table:wfct-agg-descriptives>).],
  label: "fig:corrplot-aggressive",
)

To assess whether the aggressive word fragment task is a valid and reliable measure of aggressive cognition, internal consistency was examined (see #ref(<fig:corrplot-aggressive>) for correlations and #ref(<table:wfct-agg-descriptives>) for item descriptives).
The tetrachoric correlation matrix revealed weak and inconsistent correlations among items, including several negative correlations.
If items measured the same latent construct, positive intercorrelations would be expected; this pattern suggests that the items do not form a coherent unidimensional construct.
Moreover, Item 7 was negatively correlated with the first principal component, indicating it may measure a different construct than the remaining items.

Item-level response rates revealed substantial variability in aggressive completion rates.
Several items had very low positive rates, such as Item 5 (3.3%) and Item 1 (4.8%), while others exceeded 50%, such as Item 10 (63.8%) and Item 6 (51.3%).
Additionally, some items showed elevated missing responses, with Items 8, 10, 9, and 7 each having more than 10 missing values.
This imbalance compromises the scale's ability to discriminate between individuals.

The Kaiser-Meyer-Olkin criterion yielded an overall MSA of .16, well below the acceptable threshold of .60, indicating the data were not suitable for factor analysis.
Cronbach's alpha was $alpha = .36$, indicating poor internal consistency.
Given the lack of evidence for unidimensionality and the poor reliability, the aggressive cognition score was computed as the proportion of aggressive completions (row means across items) rather than factor scores.

== Test Quality: Anxious Cognition

#apa-figure(
  image("../images/corrplot-anxious-cognition.png", width: 70%),
  caption: [Tetrachoric Correlation Matrix for Anxious Word Fragment Items],
  note: [Darker shading indicates stronger positive correlations. Item descriptives are provided in #ref(<table:wfct-anx-descriptives>).],
  label: "fig:corrplot-anxious",
)

To assess whether the anxious word fragment task is a valid and reliable measure of anxious cognition, internal consistency was examined (see #ref(<fig:corrplot-anxious>) for correlations and #ref(<table:wfct-anx-descriptives>) for item descriptives).
Similar to the aggressive cognition items, the tetrachoric correlation matrix revealed weak and inconsistent correlations among items, including several negative correlations.
This pattern suggests that the items do not form a coherent unidimensional construct.
Furthermore, Items 2, 7, and 8 were negatively correlated with the first principal component, suggesting they may not measure the same construct as the remaining items.

Item-level response rates revealed even greater variability than the aggressive cognition scale.
Some items had very low positive rates, such as Item 2 (3.4%) and Item 8 (7.9%), while others were completed with the anxious word by the vast majority of participants, such as Item 9 (85.7%) and Item 3 (85.2%).
Notably, Items 3 and 9 also showed substantial missingness, with 46 and 49 missing responses respectively—approximately 30% of the sample.
This pattern suggests these items may have been particularly difficult or ambiguous for participants.

The Kaiser-Meyer-Olkin criterion yielded an overall MSA of .30, below the acceptable threshold of .60, indicating the data were not suitable for factor analysis.
Cronbach's alpha was $alpha = .09$, indicating unacceptable internal consistency.
As with the aggressive cognition scale, the anxious cognition score was computed as the proportion of anxious completions (row means across items) rather than factor scores.

In summary, neither the aggressive nor the anxious word fragment completion task demonstrated adequate psychometric properties in this sample.
The lack of internal consistency and the substantial item-level variability in response rates and missingness cast doubt on the validity of these measures as indicators of latent aggressive or anxious cognition.
