#import "../utils.typ": *

= Results


== Participants
A final sample of 196 participants was collected over the course of two months. This missed the goal of 229 participants from power analysis.

Participants were excluded based on pre-registered criteria.
First, 8 participants withdrew consent after debriefing.
Of the remaining sample, 13 participants did not meet eligibility requirements (9 reported a gender other than male, 3 were under 18 years of age, and 1 reported insufficient German proficiency).
Furthermore, 9 participants were excluded for expressing strong suspicion about the study's true purpose (open-text responses were independently coded, and participants who correctly identified the masculinity threat manipulation were excluded), 11 for completing fewer than 50% real words on the WFCT, and 1 for missing all items on the MMB scale.
After applying these criteria, 42 participants were excluded in total, resulting in a final sample of $N = 154$ ($n_"threat" = 79$, $n_"no-threat" = 75$).

Participants ranged in age from 18 to 69 years (#reportMeanAndSD(mean: 30.6, sd: 10.9)).
The sample was predominantly highly educated: 80.5% held at least a general university entrance qualification (Abitur), and 60.4% had completed a university degree.


== Motivation For Masculine Behaviour Validation

#apa-figure(
  image("../images/corrplot-mmb.png", width: 70%),
  caption: [Polychoric Correlation Matrix for MMB Items],
  note: [Items 1–5 = Pressured Motivation subscale; Items 6–9 = Autonomous Motivation subscale. Rectangles indicate the hypothesized factor structure. Darker shading indicates stronger positive correlations.],
  label: "fig:corrplot-mmb",
)

Prior to the moderation analysis, the validity and reliability of the MMB scale were assessed (see #ref(<fig:corrplot-mmb>) for correlations and #ref(<table:mmb-descriptives>) for item descriptives).
The Kaiser-Meyer-Olkin criterion yielded an overall Measure of Sampling Adequacy (MSA) of .85, indicating the data were suitable for factor analysis.
The hypothesized two-factor model by #cite(<stanaland2021man>, form: "prose") specified uncorrelated latent factors for Pressured Motivation (Items 1–5) and Autonomous Motivation (Items 6–9).
A CFA was conducted to validate this structure; however, the fit indices did not satisfy the predefined criteria (#reportModelFitIndices(cfi: 0.851, tli: 0.801, rmsea: 0.179, srmr: 0.248)).

To better understand the data structure, an EFA with oblimin rotation was conducted.
A parallel analysis and scree plot supported a two-factor solution.
The resulting factor loadings (#ref(<table:efa-mmb>)) showed strong coherence for Items 1–5 on the first factor (Pressured Motivation) and moderate coherence for Items 6–9 on the second factor (Autonomous Motivation).
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
      [Pressured Motivation],
      [Autonomous Motivation],
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
    Factor loadings below .30 are suppressed for clarity. Extraction method: Maximum Likelihood with oblimin rotation.
  ],
  label: "table:efa-mmb",
)

Based on the EFA results, Item 9 was removed due to its cross-loading.
Examination of modification indices further suggested a residual covariance between Items 7 and 8.
This modification is conceptually supported, as both items express positive affect toward masculine identity ("enjoy," "happy").
A final CFA on the 8-item scale yielded an almost acceptable fit (#reportModelFitIndices(cfi: 0.966, tli: 0.947, rmsea: 0.098, srmr: 0.066)).
The CFI and SRMR satisfied the target values of .95 and .08, respectively.
While the TLI fell slightly below the .95 threshold and the RMSEA remained elevated, both showed substantial improvement.
This pattern may be partially attributable to the limited sample size ($N = 154$).
No further modifications were made, as additional changes could not be theoretically justified and would risk overfitting the model to the data.

Finally, reliability was assessed using McDonald's omega ($omega$), which does not assume tau-equivalence.
The Pressured Motivation subscale showed excellent reliability ($omega = .93$), while the Autonomous Motivation subscale showed acceptable reliability ($omega = .70$).

The two subscales showed a moderate positive correlation ($r = .39$).
For the subsequent moderation analyses, subscale scores were computed as row means, with Item 9 excluded from the Autonomous Motivation scale.
#apa-figure(
  caption: [Aggressive and Anxious Word Completion Scores by Threat Condition],
  image("../images/aggressive-anxious-cognition-by-threat-boxplot.png"),
  label: "fig:agg-anx-cog-boxplot",
  note: [Boxplots display the distribution of aggressive and anxious word completion scores (%) by experimental condition. The horizontal line represents the median, boxes represent the interquartile range, and whiskers extend to 1.5 times the interquartile range.]
)

== Masculinity Threat Effects
#ref(<fig:agg-anx-cog-boxplot>) displays the distribution of aggressive and anxious word completion scores by threat condition.

=== Masculinity Threat on Aggressive Cognition (Hypothesis 1a)
Hypothesis 1a predicted higher aggressive cognition in the threat condition compared to the no-threat condition.
Contrary to this prediction, aggressive word completion scores were lower in the threat condition (#reportMeanAndSD(mean: 19.5, sd: 12.3)) than in the no-threat condition (#reportMeanAndSD(mean: 22.8, sd: 12.3)).

Assumption checks were satisfactory: Levene's test indicated homogeneous variances, and DHARMa residual diagnostics revealed no significant deviations from the expected distribution.
A binomial GLM revealed no statistically significant difference between conditions (#reportZStatistic(zValue: -1.592, pValue: 0.111)).
Given the directional hypothesis (predicted $beta > 0$) and the observed effect in the opposite direction, the one-tailed $p$-value was $p = .944$.

A sensitivity analysis was performed by identifying and excluding five influential observations.
The GLM refitted on the reduced sample continued to show no significant effect (#reportZStatistic(zValue: -1.479, pValue: 0.139); one-tailed $p = .93$).

A sensitivity power analysis (see #ref(<fig:sensitivity-h1>)) indicated that, given the sample size ($n_"threat" = 79$, $n_"no-threat" = 75$), the study had 80% power to detect effects of $d >= 0.40$ at $alpha = .05$.
The observed effect ($d = -0.27$) was in the opposite direction and smaller in magnitude than this threshold, suggesting the absence of the hypothesized effect rather than insufficient statistical power.

=== Masculinity Threat on Anxious Cognition (Hypothesis 1b)
Hypothesis 1b predicted higher anxious cognition in the threat condition compared to the no-threat condition.
Anxious word completion scores were virtually identical across conditions: threat condition (#reportMeanAndSD(mean: 28, sd: 12.8)) and no-threat condition (#reportMeanAndSD(mean: 27.6, sd: 14.5)).

Assumption checks were satisfactory: Levene's test indicated homogeneous variances, and DHARMa residual diagnostics revealed no significant deviations from the expected distribution.
A binomial GLM revealed no statistically significant difference between conditions (#reportZStatistic(zValue: 0.177, pValue: 0.859)).
Given the directional hypothesis (predicted $beta > 0$), the one-tailed $p$-value was $p = .430$.

A sensitivity analysis was performed by identifying and excluding five influential observations.
The GLM refitted on the reduced sample continued to show no significant effect (#reportZStatistic(zValue: 1.04, pValue: 0.30); one-tailed $p = .15$).

A sensitivity power analysis (see #ref(<fig:sensitivity-h1>)) indicated that the study had 80% power to detect effects of $d >= 0.40$ at $alpha = .05$.
The observed effect ($d = 0.03$) was substantially smaller than this threshold, suggesting the absence of a meaningful effect rather than insufficient statistical power.

== Moderation of Masculinity Threat Effects

Having found no main effects of threat condition on either aggressive or anxious cognition, the moderation hypotheses were tested to examine whether individual differences in motivation for masculine behavior influenced threat responses.

#apa-figure(
  grid(
  columns: (auto, auto),
  grid.cell(
  image("../images/aggressive-cognition-pressured-motivation-line-chart.png"),
  ),grid.cell(
  image("../images/anxious-cognition-autonomous-motivation-line-chart.png"),
  )
),
  caption: [Moderation of Word Completion Scores by Motivation for Masculine Behavior],
  label: "fig:moderation-masculinity-threat",
  note: [Left panel: Aggressive word completion scores (%) by threat condition and pressured motivation. Right panel: Anxious word completion scores (%) by threat condition and autonomous motivation.]
)

=== Pressured Motivation on Aggressive Cognition (Hypothesis 2a)
Hypothesis 2a predicted that the effect of masculinity threat on aggressive cognition would be moderated by pressured motivation to conform to masculinity norms.
Specifically, men with higher pressured motivation were expected to show a stronger increase in aggressive cognition following threat compared to men with lower pressured motivation.
As illustrated in #ref(<fig:moderation-masculinity-threat>), descriptive patterns showed a steeper positive slope between pressured motivation scores and aggressive word completion scores in the threat condition compared to the no-threat condition, consistent with the predicted interaction.

Assumption checks were satisfactory: Levene's test indicated homogeneous variances, and DHARMa residual diagnostics revealed no significant deviations from the expected distribution.
A binomial GLM with threat condition, pressured motivation, and their interaction as predictors was conducted to test this moderation hypothesis.
The model revealed no statistically significant main effect of threat condition (#reportZStatistic(zValue: -1.474, pValue: 0.141)), no significant main effect of pressured motivation (#reportZStatistic(zValue: 0.837, pValue: 0.403)), and no significant interaction effect (#reportZStatistic(zValue: 0.922, pValue: 0.357)).
Given the directional hypothesis (predicted $beta > 0$ for the interaction), the one-tailed $p$-value was $p = .178$, leading to a failure to reject the null hypothesis.

A sensitivity analysis was performed by identifying and excluding four influential observations.
The GLM refitted on the reduced sample continued to show no significant interaction effect (#reportZStatistic(zValue: 1.453, pValue: 0.146); one-tailed $p = .073$), though the effect approached marginal significance.

A sensitivity power analysis (see #ref(<fig:sensitivity-h2>)) indicated that, with $N = 154$ and 3 predictors (threat condition, pressured motivation, and their interaction), the study had 80% power to detect interaction effects of $f^2 >= 0.052$ at $alpha = .05$.
This corresponds to a small-to-medium effect size according to #cite(<cohen2013statistical>, form: "prose") conventions.

=== Autonomous Motivation on Anxious Cognition (Hypothesis 2b)
Hypothesis 2b predicted that the effect of masculinity threat on anxious cognition would be moderated by autonomous motivation to conform to masculinity norms.
Specifically, men with higher autonomous motivation were expected to show a stronger increase in anxious cognition following threat compared to men with lower autonomous motivation.
As illustrated in #ref(<fig:moderation-masculinity-threat>), descriptive patterns did not support this prediction: anxious word completion scores showed no meaningful change with increasing autonomous motivation scores in either condition.

Assumption checks were satisfactory: Levene's test indicated homogeneous variances, and DHARMa residual diagnostics revealed no significant deviations from the expected distribution.
A binomial GLM with threat condition, autonomous motivation, and their interaction as predictors was conducted to test this moderation hypothesis.
The model revealed no statistically significant main effect of threat condition (#reportZStatistic(zValue: -0.02, pValue: 0.988)), no significant main effect of autonomous motivation (#reportZStatistic(zValue: -0.18, pValue: 0.855)), and no significant interaction effect (#reportZStatistic(zValue: 0.07, pValue: 0.946)).
Given the directional hypothesis (predicted $beta > 0$ for the interaction), the one-tailed $p$-value was $p = .473$, leading to a failure to reject the null hypothesis.

A sensitivity analysis was performed by identifying and excluding influential observations.
The GLM refitted on the reduced sample continued to show no significant interaction effect (#reportZStatistic(zValue: 0.41, pValue: 0.678); one-tailed $p = .339$).

A sensitivity power analysis (see #ref(<fig:sensitivity-h2>)) indicated that the study had 80% power to detect interaction effects of $f^2 >= 0.052$ at $alpha = .05$.
This corresponds to a small-to-medium effect size according to #cite(<cohen2013statistical>, form: "prose") conventions.

== Experimental Manipulation Check

Given the null findings across all four hypotheses, it is essential to verify that the experimental manipulation successfully induced a perceived threat to masculine identity.
To assess whether the manipulation was effective, two measures were examined.

First, participants were asked at the end of the questionnaire to indicate which feedback they had received, on a scale from 1 (stereotypically feminine) to 10 (stereotypically masculine).
Descriptive statistics confirmed a clear distinction between conditions: the threat condition (#reportMeanAndSD(mean: 3.08, sd: 0.93)) reported substantially lower scores than the no-threat condition (#reportMeanAndSD(mean: 6.22, sd: 1.00)).

Second, participants were asked to self-evaluate their gender knowledge on the same scale.
Descriptive statistics showed lower self-evaluations in the threat condition (#reportMeanAndSD(mean: 5.71, sd: 1.43)) than in the no-threat condition (#reportMeanAndSD(mean: 6.79, sd: 1.38)).
A $t$-test confirmed that participants in the threat condition rated their gender knowledge significantly lower than those in the no-threat condition (#reportTStatistic(tValue: 4.735, pValue: 0.00001, df: 154)).

// == Measurement Quality: Word Fragment Completion Task

// To assess potential problems with the dependent measures, the psychometric properties of the WFCT were assessef (see Appendix for detailed item-level analyses).

// === Aggressive Word Fragment Items

// #apa-figure(
//   image("../images/corrplot-aggressive-cognition.png", width: 70%),
//   caption: [Tetrachoric Correlation Matrix for Aggressive Word Fragment Items],
//   note: [Darker shading indicates stronger positive correlations. Item descriptives are provided in #ref(<table:wfct-agg-descriptives>).],
//   label: "fig:corrplot-aggressive",
// )

// The tetrachoric correlation matrix revealed weak and inconsistent correlations among items, including several negative correlations (see #ref(<fig:corrplot-aggressive>) and #ref(<table:wfct-agg-descriptives>)).
// Item completion rates varied substantially, ranging from 3.3% to 63.8%.
// The Kaiser-Meyer-Olkin criterion yielded an MSA of .16, well below the .60 threshold.
// Cronbach's alpha was $alpha = .36$, indicating poor internal consistency.

// === Anxious Word Fragment Items

// #apa-figure(
//   image("../images/corrplot-anxious-cognition.png", width: 70%),
//   caption: [Tetrachoric Correlation Matrix for Anxious Word Fragment Items],
//   note: [Darker shading indicates stronger positive correlations. Item descriptives are provided in #ref(<table:wfct-anx-descriptives>).],
//   label: "fig:corrplot-anxious",
// )

// The anxious items showed similar limitations (see #ref(<fig:corrplot-anxious>) and #ref(<table:wfct-anx-descriptives>)).
// Item completion rates ranged from 3.4% to 85.7%, with Items 3 and 9 showing approximately 30% missingness.
// The Kaiser-Meyer-Olkin criterion yielded an MSA of .30, below the .60 threshold.
// Cronbach's alpha was $alpha = .09$, indicating unacceptable internal consistency.
