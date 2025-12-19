#import "../utils.typ": *

= Method
== Ethical Considerations and Pre-Registration
Prior to data collection, ethical considerations were addressed regarding the use of a deceptive experimental manipulation and its potential to elicit negative emotional reactions.
To mitigate any persisting effects of this deception, the debriefing procedure adhered to established ethical guidelines for research involving deception, including dehoaxing, desensitization, justification of the deception, and an option to withdraw data #citeWithPrefix(prefix: "see", keys: <sommers2013forgoing>).
Ethical approval for this study was granted by the Ethics Committee of the Department of Psychology at Humboldt University of Berlin.

For transparency, the study's aims, hypotheses, methods, and data analytic plan were pre-registered on the Open Science Framework (https://osf.io/n6py4).
Any deviations from the pre-registration are justified and reported in the relevant sections. 

== Participants
An a priori power analysis indicated a required sample size of 229 participants (see Power Analysis section).
Eligibility criteria included self-identification as male, native-level proficiency in German, and a minimum age of 18 years.
A total of 196 participants were recruited over a two-month period by distributing flyers in social spaces and through an online study exchange platform.
In exchange for participation, 1€ was donated to a men's counseling organization.

Participants were excluded based on pre-registered criteria.
First, 8 participants withdrew consent after debriefing.
Of the remaining sample, 13 participants did not meet eligibility requirements (9 reported a gender other than male, 3 were under 18 years of age, and 1 reported insufficient German proficiency).
Furthermore, 9 participants were excluded for expressing strong #todo["describe here that open text fiels were evaluated and participants that guessed the true purpose of the study were excluded"] suspicion about the study's true purpose, 11 for completing fewer than 50% real words on the WFCT, and 1 for missing all items on the MMB scale.
After applying these criteria, 42 participants were excluded in total, resulting in a final sample of $N = 154$ (no-threat condition: $n = 78$; threat condition: $n = 76$).

Participants ranged in age from 18 to 69 years (#reportMeanAndSD(mean: 30.6, sd: 10.9)).
The sample was predominantly highly educated: 80.5% held at least a general university entrance qualification (Abitur), and 60.4% had completed a university degree.

== Procedure
The procedure was adapted from #cite(<stanaland2021man>, form: "prose") and translated into German.
After providing informed consent, participants were informed that the study concerned personality, motivation, and performance in men.
They were also reminded that eligibility required identifying as male, native-level proficiency in German, and a minimum age of 18 years.

In the first section, participants completed the Motivation for Masculine Behavior scale.
Next, they were informed they would complete a Gender Knowledge Test, supposedly measuring knowledge in areas typically associated with men or women in society.
Upon completion, participants received either (a) threatening feedback indicating worse performance than the average man, or (b) non-threatening feedback indicating performance comparable to the average man.
This feedback was not based on participants' actual responses but was randomly assigned by experimental condition.

Following the feedback, participants completed the WFCT to assess aggressive and anxious cognition.
For each item, they were instructed to complete a partial word by typing the missing first letter.
Items were presented in randomized order, with a seven-second time limit per item to encourage spontaneous, intuitive responses.

Participants then completed a demographic questionnaire.
Afterward, they were asked whether they had any suspicions about the study's true purpose and, if so, were invited to describe them.
As a manipulation check, all participants recalled the type of feedback they had received on the Gender Knowledge Test and provided a self-evaluation of their own gender knowledge.

Upon completing all study components, participants received a full debriefing.
This included an explanation of the study's true purpose and a clarification that the feedback provided during the Gender Knowledge Test was fabricated and randomly assigned.
The rationale for the deception was explained, and participants were offered the option to withdraw their data.

== Materials
All original scales from #cite(<stanaland2021man>, form: "prose") were translated from English to German following the Translation, Review, Adjudication, Pretesting, and Documentation (TRAPD) protocol @harkness2010translation.
Complete materials including all item wordings in both languages are provided in the Appendix.

=== Motivation for Masculine Behavior
Nine items from the Motivation for Masculine Behavior scale @good2010doing were used to measure participants' motivation for enacting masculine behavior.
Responses were recorded on a 7-point Likert scale ranging from 1 (_strongly disagree_) to 7 (_strongly agree_).
The scale comprises two subscales: Pressured Motivation (5 items; e.g., "In general, I'm masculine because I want others' acceptance and approval") and Autonomous Motivation (4 items; e.g., "I enjoy being masculine").
See #ref(<table:mmb-items>) for all items with German translations.

=== Gender Knowledge Test
A culturally adapted version of the Gender Knowledge Test @rudman2004reactions was used.
Thirty items covering stereotypically masculine (e.g., sports, combat, home repair) and feminine (e.g., cooking, childcare, fashion) knowledge domains were selected for cultural relevance to European participants @valved2021gender.
Items were designed with moderate to high difficulty to support the credibility of the subsequent bogus feedback.
Each item presented one correct and one incorrect response option (e.g., "The paste used for soldering joints is called: gel vs. flux"; "The first company to develop hair coloring was: Clairol vs. L'Oréal").
See #ref(<table:gkt-items>) for all items with German translations.

=== Masculinity Threatening and Non-Threatening Feedback
To administer the masculinity threat, participants were shown a diagram depicting a fictitious distribution of scores on the Gender Knowledge Test.
In the threat condition, participants were told they scored –1.83, substantially below the purported male average of +2.24, with an accompanying statement that their answers were "more similar to women than to men."
In the no-threat condition, participants were told they scored +2.18, close to the male average, indicating "typical" performance for male participants.
Both conditions included a visual distribution graph highlighting the participant's position relative to other men.
Screenshots of both feedback conditions are provided in the Appendix.

=== Word Fragment Completion Task
The Word Fragment Completion Task (WFCT) was used to assess aggressive and anxious cognition.
Word fragments were developed by querying a German thesaurus using terms related to aggression (e.g., "Wut" [anger], "Ärger" [frustration]) and anxiety (e.g., "Angst" [fear], "Furcht" [dread]).
#todo[describe more detailed the word generation procedure and also name the website]
Twenty word fragments (ten aggressive, ten anxious) were presented in randomized order.
Each fragment could be completed as either a target word (aggressive or anxious) or a neutral word.
For example, "\_UT" could become "WUT" (anger; aggressive) or "HUT" (hat; neutral); "\_ANGEN" could become "BANGEN" (to fear; anxious) or "WANGEN" (cheeks; neutral).
See #ref(<table:wfct-aggressive>) and #ref(<table:wfct-anxious>) for all word fragments and their possible completions.

=== Manipulation Check and Suspicion Probe
To verify that participants correctly perceived the experimental manipulation, two manipulation check items were administered.
Participants recalled the type of feedback they received on the Gender Knowledge Test and provided a self-evaluation of their own gender knowledge, both on a scale from 1 (_typically feminine_) to 10 (_typically masculine_).
To assess suspicion, participants indicated whether they believed the study concerned something other than what was stated.
If they responded affirmatively, they were prompted to describe their suspicions.
Additionally, participants were given the opportunity to share any other thoughts about the study in an open-text field.
See #ref(<table:manipulation-check>) for all items with German translations.

=== Demographic Questionnaire
Participants reported their age, gender, German language proficiency, highest educational degree, and highest occupational degree.
See #ref(<table:demographics>) for all items with German translations. 

== Design
The study employed a between-subjects experimental design. Participants were randomly assigned to one of two conditions of the independent variable: threat condition (_threatening feedback_ or _non-threatening feedback_). The primary dependent variable was performance on the WFCT to measure aggressive/anxious cognition. Additionally, motivation for masculine behavior was measured and examined as a moderator variable to assess whether it influenced the relationship between threat condition aggressive/anxious cognition, as measured by  WFCT performance. 

== Power Analysis
An a priori power analysis indicated a required sample size of 229 participants (see Sample Size Planning section in the Appendix for details).

== Data Analytic Plan
All analyses will be conducted using RStudio 4.2.3 @RCoreTeam.

=== Exclusion Criteria
Participants who did not meet the eligibility criteria (i.e., self-identification as male, native-level proficiency in German, and minimum age of 18 years) will be excluded from all analyses. Additionally, participants who produce fewer than 50% valid word completions in the WFCT, indicate strong suspicion about the study’s purpose, or fail the manipulation check (i.e., incorrect recall of the feedback received) will also be excluded.

=== Factor Structure of Motivation for Masculine Behavior
A CFA will be conducted to evaluate the hypothesized two-factor structure of the Motivation for Masculine Behavior scale. The model specifies two latent constructs: (a) autonomous motivation and (b) pressured motivation. Model fit will be assessed using the Comparative Fit Index (CFI), Tucker-Lewis Index (TLI), Root Mean Square Error of Approximation (RMSEA), and Standardized Root Mean Square Residual (SRMR). Additionally, factor loadings and inter-factor correlations will be examined to assess construct validity.

=== Scoring of Aggressive and Anxious Cognition
Responses on the WFCT will be coded based on a predefined list of target words corresponding to aggressive, anxious, or neutral word completions. Responses that do not match any predefined completion will be categorized as invalid or false completions and excluded from scoring. The proportion of valid completions categorized as aggressive or anxious will be computed for each participant. These proportions will serve as the operationalization of aggressive and anxious cognition, respectively. Given that these are proportion-based variables bounded between 0 and 1, an arcsine square root transformation will be used ensure the independency of value and variance @winer1971statistical.
=== Hypothesis Testing
Prior to hypothesis testing, assumptions of normality, homogeneity of variance, and linearity will be examined.

==== Hypotheses 1a and 1b
To test whether exposure to threatening feedback (vs. non-threatening feedback) leads to increased aggressive (H1a) or anxious (H1b) cognition, one-tailed independent samples t-tests will be conducted comparing the two feedback conditions on the respective dependent variables (aggressive and anxious word completions).

==== Hypotheses 2a and 2b
To examine whether motivation for masculine behavior moderates the effect of feedback type on aggressive (H2a) and anxious (H2b) cognition, moderation analyses will be conducted. Specifically, multiple linear regression models will be estimated with feedback condition (coded as a dummy variable), autonomous and pressured motivation (mean-centered), and their respective interaction terms as predictors. Separate models will be run for aggressive and anxious cognition as outcomes. Significant interaction effects will be probed using simple slopes analysis and visualized using interaction plots.