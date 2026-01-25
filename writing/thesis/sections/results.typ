#import "../utils.typ": *
#import "../figures/consort-flowchart.typ": consort-flowchart


= Results

== Participants
A final sample of 196 participants was collected over a two-month period. 
Although this fell short of the target of 229 participants, data collection was concluded due to time constraints of the project.
Several participants were excluded based on pre-registered criteria to ensure data quality. @fig:consort-flowchart provides an overview of participant flow and exclusions, that were made due to withdrawal of consent, failing to meet eligibility criteria, failing attention checks and suspicion. 
After applying all exclusion criteria, 42 participants were removed in total. This resulted in a final analytical sample of $N = 154$ ($n_"threat" = 79$, $n_"no-threat" = 75$).

#apa-figure(
  caption: [CONSORT Flowchart of Participant Exclusions],
  consort-flowchart,
  label: "fig:consort-flowchart",
  note: [MMB = Motivation for Masculine Behaviour; WFCT = Word Fragment Completion Task]
)

Based on this sample size, the study achieved a power of $1 - beta = .96$ to detect the expected medium effect ($d = 0.55$) of the masculinity threat. However, for the hypothesized moderation, assuming a small effect size ($f = 0.17$), the power was considerably lower at $1 - beta = .56$.

The final sample ranged in age from 18 to 69 years (#reportMeanAndSD(mean: 30.6, sd: 10.9)).
The participants were predominantly highly educated: $80.5%$ held at least a general university entrance qualification, and $60.4%$ had completed a university degree.

== Statistical Analysis

Data analysis was performed using R version 4.5.2 @RCoreTeam. An anonymized dataset and the corresponding analysis code have been made publicly available via GitHub (https://github.com/Linuswidmer/master-thesis).

Hypothesis testing was conducted on the proportion of aggressive and anxious completed word fragments for each participant.
The pre-registered analysis plan specified an arcsine square root transformation to address the bounded nature of proportion data @winer1971statistical.
However, preliminary diagnostics revealed that the distribution of transformed scores was highly skewed, violating the normality assumption required for standard regression. To address this, the analyses employed a generalized linear model (GLM) with a binomial distribution and logit link function.
This approach directly models the count of target completions out of total trials, appropriately accounting for the bounded and discrete nature of the outcome without requiring transformation.

To ensure robustness, several diagnostic checks were performed.
Across all models, homogeneity of variance (Levene’s test) and residual distribution using DHARMa @DHARMa were verified, with no significant violations detected
To identify influential observations that could distort the results @aguinis2013best, a sensitivity analysis was conducted using a Cook’s distance threshold of $4 / (n - k)$, where $n$ represents the sample size and $k$ the number of predictors. These cases were removed and the models refitted to ensure the stability and robustness of the primary findings.
In all cases, refitting the models without these observations did not alter the significance of the results; therefore, only the results for the full analytical sample are reported.

// A significance level of $alpha = .05$ was applied throughout.
// To evaluate the detectability of effects, sensitivity analyses were conducted using G*Power 3 @cunningham2007power.
// Sensitivity analysis determines the minimum effect size detectable with $80%$ power at $alpha = .05$, avoiding the limitations of post-hoc observed power @hoenig2001abuse.
// If the observed effect is substantially smaller than the minimum detectable effect, this suggests absence of a meaningful effect rather than insufficient statistical power.

// == Masculinity Threat Effects

// #apa-figure(
//   caption: [Aggressive and Anxious Word Completion Scores by Threat Condition],
//   image("../images/aggressive-anxious-cognition-by-threat-boxplot.png",  width: 70%),
//   label: "fig:agg-anx-cog-boxplot",
//   note: [Boxplots display the distribution of aggressive and anxious word completion scores (%) by experimental condition. The horizontal line represents the median, boxes represent the interquartile range (25% - 75%), and whiskers extend to 1.5 times the interquartile range.]
// )


=== Hypothesis 1a: Masculinity Threat and Aggressive Cognition
Hypothesis 1a predicted higher aggressive cognition in the threat condition compared to the no-threat condition.
Contrary to this prediction, there was no significant difference of aggressive word completion scores in the threat condition (#reportMeanAndSD(mean: 19.5, sd: 12.3)) and the no-threat condition (#reportMeanAndSD(mean: 22.8, sd: 12.3)\; see @fig:agg-cog-boxplot).

#apa-figure(
  caption: [Aggressive Word Completion Scores by Threat Condition],
  image("../images/aggressive-cognition-by-threat-boxplot.png",  width: 70%),
  label: "fig:agg-cog-boxplot",
  note: [Boxplots display the distribution of aggressive word completion scores (%) by experimental condition. The horizontal line represents the median, boxes represent the interquartile range (25% - 75%), and whiskers extend to 1.5 times the interquartile range.]
)

A binomial GLM with threat condition as the predictor and aggressive word completions as the dependent variable revealed no statistically significant effect of condition (#reportZStatistic(zValue: -1.592, pValue: 0.111)).
Given the directional hypothesis (predicted $beta > 0$) and the observed effect in the opposite direction, the one-tailed $p$-value was $p = .944$.

// A sensitivity analysis was performed by identifying and excluding five influential observations.
// The GLM refitted on the reduced sample continued to show no significant effect (#reportZStatistic(zValue: -1.479, pValue: 0.139); one-tailed $p = .93$).

// A sensitivity power analysis (see #ref(<fig:sensitivity-h1>)) indicated that the study had 80% power to detect effects of $d >= 0.40$ at $alpha = .05$.
// The observed effect ($d = -0.27$) was in the opposite direction and smaller in magnitude than this threshold, suggesting the absence of the hypothesized effect rather than insufficient statistical power.

=== Hypothesis 1b: Masculinity Threat and Anxious Cognition
Hypothesis 1b predicted higher anxious cognition in the threat condition compared to the no-threat condition.
Anxious word completion scores were virtually identical across conditions: threat condition (#reportMeanAndSD(mean: 28, sd: 12.8)) and no-threat condition (#reportMeanAndSD(mean: 27.6, sd: 14.5)\; see @fig:anx-cog-boxplot).

#apa-figure(
  caption: [Anxious Word Completion Scores by Threat Condition],
  image("../images/anxious-cognition-by-threat-boxplot.png",  width: 70%),
  label: "fig:anx-cog-boxplot",
  note: [Boxplots display the distribution of anxious word completion scores (%) by experimental condition. The horizontal line represents the median, boxes represent the interquartile range (25% - 75%), and whiskers extend to 1.5 times the interquartile range.]
)

A binomial GLM with threat condition as the predictor and anxious word completions as the dependent variable revealed no statistically significant effect of condition (#reportZStatistic(zValue: 0.177, pValue: 0.859)).
Given the directional hypothesis (predicted $beta > 0$), the one-tailed $p$-value was $p = .430$.

// A sensitivity analysis was performed by identifying and excluding five influential observations.
// The GLM refitted on the reduced sample continued to show no significant effect (#reportZStatistic(zValue: 1.04, pValue: 0.30); one-tailed $p = .15$).

// A sensitivity power analysis (see #ref(<fig:sensitivity-h1>)) indicated that the study had 80% power to detect effects of $d >= 0.40$ at $alpha = .05$.
// The observed effect ($d = 0.03$) was substantially smaller than this threshold, suggesting the absence of a meaningful effect rather than insufficient statistical power.

// == Moderation of Masculinity Threat Effects

// #apa-figure(
//   grid(
//   columns: (auto, auto),
//   grid.cell(
//   image("../images/aggressive-cognition-pressured-motivation-line-chart.png"),
//   ),grid.cell(
//   image("../images/anxious-cognition-autonomous-motivation-line-chart.png"),
//   )
// ),
//   caption: [Moderation of Word Completion Scores by Motivation for Masculine Behavior],
//   label: "fig:moderation-masculinity-threat",
//   note: [Left panel: Aggressive word completion scores (%) by threat condition and pressured motivation. Right panel: Anxious word completion scores (%) by threat condition and autonomous motivation.]
// )

=== Hypothesis 2a: Pressured Motivation and Aggressive Cognition
Hypothesis 2a predicted that the effect of masculinity threat on aggressive cognition would be moderated by pressured motivation to conform to masculinity norms.
Specifically, men with higher pressured motivation were expected to show a stronger increase in aggressive cognition following threat compared to men with lower pressured motivation.
Aggressive cognition scores as a function of pressured motivation and experimental condition are shown in @fig:moderation-agg-masculinity-threat.

#apa-figure(
  image("../images/aggressive-cognition-pressured-motivation-line-chart.png", width: 70%),
  caption: [Moderation of Aggressive Word Completion Scores by Pressured Motivation],
  label: "fig:moderation-agg-masculinity-threat",
  note: [Aggressive word completion scores (%) by threat condition and pressured motivation]
)

A binomial GLM with aggressive word completions as the dependent variable and threat condition, pressured motivation, and their interaction as predictors was conducted to test this moderation hypothesis.
The model revealed no statistically significant main effect of threat condition (#reportZStatistic(zValue: -1.474, pValue: 0.141)), no significant main effect of pressured motivation (#reportZStatistic(zValue: 0.837, pValue: 0.403)), and no significant interaction effect (#reportZStatistic(zValue: 0.922, pValue: 0.357)).
Given the directional hypothesis (predicted $beta > 0$ for the interaction), the one-tailed $p$-value was $p = .178$, leading to a failure to reject the null hypothesis.

// A sensitivity analysis was performed by identifying and excluding four influential observations.
// The GLM refitted on the reduced sample continued to show no significant interaction effect (#reportZStatistic(zValue: 1.453, pValue: 0.146); one-tailed $p = .073$), though the effect approached marginal significance.

// A sensitivity power analysis (see #ref(<fig:sensitivity-h2>)) indicated that the study had 80% power to detect interaction effects of $f^2 >= 0.052$ at $alpha = .05$.
// This corresponds to a small-to-medium effect size according to #cite(<cohen2013statistical>, form: "prose") conventions.

=== Hypothesis 2b: Autonomous Motivation and Anxious Cognition
Hypothesis 2b predicted that the effect of masculinity threat on anxious cognition would be moderated by autonomous motivation to conform to masculinity norms.
Specifically, men with higher autonomous motivation were expected to show a stronger increase in anxious cognition following threat compared to men with lower autonomous motivation.
Anxiuious cognition scores as a function of Autonomous Motivation and experimental condition are shown in @fig:moderation-anx-masculinity-threat.

#apa-figure(
  image("../images/anxious-cognition-autonomous-motivation-line-chart.png", width: 70%),
  caption: [Moderation of Anxious Word Completion Scores by Anutonomous Motivation],
  label: "fig:moderation-anx-masculinity-threat",
  note: [Anxious word completion scores (%) by threat condition and autonomous motivation.]
)

A binomial GLM with anxious word completions as the dependent variable and threat condition, autonomous motivation, and their interaction as predictors was conducted to test this moderation hypothesis.
The model revealed no statistically significant main effect of threat condition (#reportZStatistic(zValue: -0.02, pValue: 0.988)), no significant main effect of autonomous motivation (#reportZStatistic(zValue: -0.18, pValue: 0.855)), and no significant interaction effect (#reportZStatistic(zValue: 0.07, pValue: 0.946)).
Given the directional hypothesis (predicted $beta > 0$ for the interaction), the one-tailed $p$-value was $p = .473$, leading to a failure to reject the null hypothesis.

// A sensitivity analysis was performed by identifying and excluding influential observations.
// The GLM refitted on the reduced sample continued to show no significant interaction effect (#reportZStatistic(zValue: 0.41, pValue: 0.678); one-tailed $p = .339$).

// A sensitivity power analysis (see #ref(<fig:sensitivity-h2>)) indicated that the study had 80% power to detect interaction effects of $f^2 >= 0.052$ at $alpha = .05$.
// This corresponds to a small-to-medium effect size according to #cite(<cohen2013statistical>, form: "prose") conventions.