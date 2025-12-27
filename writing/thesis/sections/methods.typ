#import "../utils.typ": *

= Methods
== Ethical Considerations and Pre-Registration
Prior to data collection, ethical considerations were addressed regarding the use of a deceptive experimental manipulation.
Ethical approval for this study was granted by the Ethics Committee of the Department of Psychology at Humboldt University of Berlin.

For transparency, the study's aims, hypotheses, methods, and data analytic plan were pre-registered on the Open Science Framework (https://osf.io/n6py4).
Any deviations from the pre-registration are justified and reported in the relevant sections. 

== Sample and Recruitment
A priori power analysis based on effect sizes from previous studies indicated a required sample size of 209 participants (see Appendix).
The target sample size was set at 229 participants (10% higher to account for attrition).
Eligibility criteria included self-identification as male, native-level proficiency in German, and a minimum age of 18 years.
Participants were recruited via flyering in public spaces or an online study exchange portal.
In exchange for participation, 1€ was donated to a public men's rights organization.

== Procedure
The procedure was adapted from #cite(<stanaland2021man>, form: "prose") and translated into German.
The study was administered as an online questionnaire.
Participants accessed the study via a link on the study exchange portal or a QR code on the flyers.

Deception regarding the study's true purpose was crucial to the experimental design.
Participants were therefore informed that the study concerned personality, motivation, and performance ("Persönlichkeit, Motivation & Leistung") in men.
They were reminded that eligibility required identifying as male, native-level proficiency in German, and a minimum age of 18 years.
After providing informed consent, participants completed the nine randomized items of the MMB scale, presented as attitudes towards masculinity ("Einstellungen zum Thema Männlichkeit").

Next, participants were informed they would complete a test measuring knowledge in areas typically associated with men or women in society ("Geschlechtsspezifischer Wissenstest").
The items of the GKT were presented in a fixed randomized order.

Upon completion, participants received either (a) threatening feedback indicating worse performance than the average man, or (b) non-threatening feedback indicating performance comparable to the average man.
This feedback was not based on participants' actual responses but was randomly assigned by experimental condition.

Following the feedback, participants were told they would take a test measuring their speed of thought ("Test zur Denkgeschwindigkeit").
In reality, they completed the 20 items of the WFCT.
They were instructed to complete each word fragment by typing the complete word.
Items were presented in randomized order, with a seven-second time limit per item to encourage spontaneous, intuitive responses.
Participants then completed a demographic questionnaire, suspicion questions, and the manipulation check.

Upon completing all study components, participants received a full debriefing.
This included an explanation of the study's true purpose and a clarification that the feedback provided during the Gender Knowledge Test was fabricated and randomly assigned.
The rationale for the deception was explained, and participants were offered the option to withdraw their data.

== Materials
This section describes the measures and materials used in the study.
The MMB scale and GKT were translated from English to German following the Translation, Review, Adjudication, Pretesting, and Documentation (TRAPD) protocol @harkness2010translation.
Complete materials including all item wordings in both languages and documentation of the translation process are provided in the Appendix.

=== Motivation for Masculine Behavior
The MMB scale was taken from #cite(<stanaland2023masculinity>, form: "prose") Study 2.
It consists of nine items measuring participants' motivation for enacting masculine behavior.
Responses were recorded on a 7-point Likert scale ranging from 1 (_strongly disagree_) to 7 (_strongly agree_).
The scale comprises two subscales: Pressured Motivation (5 items; e.g., "In general, I'm masculine because I want others' acceptance and approval") and Autonomous Motivation (4 items; e.g., "I enjoy being masculine").
See #ref(<table:mmb-items>) for all items with German translations.

=== Gender Knowledge Test
The Gender Knowledge Test, originally developed by #cite(<rudman2004reactions>, form: "prose"), was used in a version culturally adapted for European participants by #cite(<valved2021gender>, form: "prose").
Thirty items covering stereotypically masculine (e.g., sports, combat, home repair) and feminine (e.g., cooking, childcare, fashion) knowledge domains were included.
Items were designed with moderate to high difficulty to support the credibility of the subsequent bogus feedback.
Each item presented one correct and one incorrect response option (e.g., "The paste used for soldering joints is called: gel vs. flux"; "The first company to develop hair coloring was: Clairol vs. L'Oréal").
See #ref(<table:gkt-items>) for all items with German translations.

=== Masculinity Threatening and Non-Threatening Feedback
To administer the masculinity threat, participants were shown a diagram depicting a fictitious distribution of scores on the GKT.
In the threat condition, participants were told they scored –1.83, substantially below the purported male average of +2.24.
This feedback was accompanied by a statement that their answers were "more similar to women than to men."
In the no-threat condition, participants were told they scored +2.18, close to the male average, indicating "typical" performance for male participants.
Both conditions included a visual distribution graph highlighting the participant's position relative to other men (see Appendix for screenshots).

=== Word Fragment Completion Task
The Word Fragment Completion Task (WFCT) was used to assess aggressive and anxious cognition.
Word fragments were developed by first identifying German words semantically related to aggression ("Wut" [anger], "Ärger" [frustration]) and anxiety ("Angst" [fear], "Furcht" [fear]) using the Word Associations Network (https://wordassociations.net/de/).
For each target word, potential word fragments were generated by removing the first letter.
Each fragment could be completed as either a target word (aggressive or anxious) or a neutral word.
For example, "\_UT" could become "WUT" (anger; aggressive) or "HUT" (hat; neutral).
Similarly, "\_ANGEN" could become "BANGEN" (to fear; anxious) or "WANGEN" (cheeks; neutral).
See #ref(<table:wfct-aggressive>) and #ref(<table:wfct-anxious>) for all word fragments and their possible completions.

=== Manipulation Check and Suspicion Probe
Two manipulation check items verified that participants correctly perceived the experimental manipulation.
First, participants recalled the type of feedback they received on the GKT on a scale from 1 (_typically feminine_) to 10 (_typically masculine_).
Second, they provided a self-evaluation of their own gender knowledge on the same scale.
To assess suspicion, participants indicated whether they believed the study concerned something other than what was stated.
If they responded affirmatively, they were prompted to describe their suspicions.
Participants were also given the opportunity to share any other thoughts about the study in an open-text field.
See #ref(<table:manipulation-check>) for all items with German translations.

=== Demographic Questionnaire
Participants reported their age, gender, German language proficiency, highest educational degree, and highest occupational degree.
See #ref(<table:demographics>) for all items with translations.

== Research Design
The study employed a between-subjects experimental design with random assignment to one of two conditions: masculinity threat (threatening feedback) or no threat (non-threatening feedback).
Two dependent variables were assessed: aggressive cognition and anxious cognition, each operationalized as the proportion of target word completions on the respective WFCT subscales.
MMB was measured prior to the experimental manipulation and examined as a moderator.
Specifically, pressured motivation was hypothesized to moderate the effect of threat on aggressive cognition, whereas autonomous motivation was hypothesized to moderate the effect of threat on anxious cognition.

== Data Analysis
All analyses were conducted using R version 4.5.2 @RCoreTeam.

To validate the MMB scale, confirmatory factor analysis (CFA) and exploratory factor analysis (EFA) were used to assess item structure. Model fit was evaluated against the following criteria: comparative fit index (CFI) > .95, Tucker-Lewis Index (TLI) > .95, root mean square error of approximation (RMSEA) < .06, and standardized root mean square residual (SRMR) < .08.

Hypothesis testing was conducted on aggressive and anxious word fragment completion scores for each participant.
The pre-registered analysis plan specified an arcsine square root transformation to address the bounded nature of proportion data @winer1971statistical.
However, preliminary diagnostics revealed violations of the homoscedasticity assumption on transformed scores.
To address this, the analyses employed a generalized linear model (GLM) with a binomial family and logit link function.
This approach directly models the count of target completions out of total trials, appropriately accounting for the bounded and discrete nature of the outcome without requiring transformation.

To ensure robustness, several diagnostic checks were performed.
Prior to the main analyses, Levene's tests assessed homogeneity of variance across conditions.
Model diagnostics were evaluated using simulated residuals via the DHARMa package @DHARMa.
Influential observations may distort the validity of results @aguinis2013best.
To address this, a sensitivity analysis identified cases exceeding a Cook's distance threshold of $4 / (n - k)$, removed them, and refitted the model to confirm the stability of findings.

A significance level of $alpha = .05$ was applied throughout.
To evaluate the detectability of effects, sensitivity analyses were conducted using G*Power 3 @cunningham2007power.
Sensitivity analysis determines the minimum effect size detectable with 80% power at $alpha = .05$, avoiding the limitations of post-hoc observed power @hoenig2001abuse.
If the observed effect is substantially smaller than the minimum detectable effect, this suggests absence of a meaningful effect rather than insufficient statistical power.