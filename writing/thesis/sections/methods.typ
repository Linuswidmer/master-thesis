#import "../utils.typ": *

= Method
#todo[Include section "Ethical consderations and preregistration"]

== Participants
A priori power analysis indicated a required sample size of 229 participants (see Power Analysis section). Eligibility criteria included self-identification as male, native-level proficiency in German, and a minimum age of 18 years.

Participants will be excluded based on the following predefined criteria: (a) producing fewer than 50% real words on the WFCT, indicating insufficient engagement or misunderstanding of the task; (b) expressing strong suspicion regarding the study's true purpose, particularly if they identify the feedback manipulation as fabricated; and (c) failing the manipulation check by incorrectly recalling the feedback received on the Gender Knowledge Test (i.e., below average, average, or above average).

Participants will be recruited through the university, the author’s social environment, and social media platforms. In exchange for participation, individuals may choose between receiving course credit or entering a prize lottery.

Ethical approval for this study will be sought from the Ethics Committee of the Department of Psychology at Humboldt University of Berlin.

== Procedure
The procedure was adapted from #cite(<stanaland2021man>, form: "prose") and translated into German. After providing informed consent, participants were informed that the study concerned personality, motivation and common knowledge ("Persönlichkeit, Motivation & Allgemeinwissen")in men. They were also reminded that eligibility required identifying as male, native-level proficiency in German, and a minimum age of 18 years.

In the first section, participants completed the Motivation for Masculine Behavior scale. Next, they were informed they would complete a Gender-Identity-Self Inventory ("Geschlechtsidentität-Fragebogen") presumably measuring knowledge in areas that are typically associated with men or women in society-. In reality they completed the Gender Knowledge Test. Upon completion, participants received either (a) threatening feedback indicating a worse performance than the average person from their gender (b) non-threatening feedback indicating that they scored like the average person from their gender. This feedback was not based on participants’ actual responses but was determined by experimental condition.

Following the feedback, participants completed the WFCT. For each item, they were instructed to complete a partial word by typing the missing letters. Items were presented in randomized order, with a five-second time limit per item to encourage spontaneous, intuitive responses.

Participants then completed a demographic questionnaire. Afterward, they were asked whether they had any suspicions about the study’s true purpose and, if so, were invited to describe them. All participants were also asked to recall the type of feedback they had received on the Gender Knowledge Test, which served as a manipulation check.

Upon completing all study components, participants received a full debriefing. This included an explanation of the study’s true purpose and a clarification that the feedback provided during the Gender Knowledge Test was fabricated and randomly assigned. The rationale for the deception was explained, and participants were offered the option to withdraw their data, in accordance with APA ethical standards (APA, 2017, Section 8.07c).

Finally, participants selected their preferred form of compensation.

== Materials
All scales will be translated from English to German. The translation process will follow the Translation, Review, Adjudication, Pretesting, and Documentation (TRAPD) protocol @harkness2010translation. For a preliminary version of the materials see Appendix A.

=== Motivation for Masculine Behavior 
Nine items from the Gender Motivation Scale @good2010doing will be used to measure participants' motivation for enacting masculine behavior. Responses will be recorded on a 7-point Likert scale ranging from 1 (_strongly disagree_) to 7 (_strongly agree_). Example items include: “Im Allgemeinen verhalte ich mich männlich, weil ich die Akzeptanz und Anerkennung anderer möchte.” and “Ich bin gerne männlich”.

=== Gender Knowledge Test
A culturally adapted version of the Gender Knowledge Test @rudman2004reactions will be used. Thirty items, covering stereotypically masculine (e.g., sports, combat, home repair) and feminine (e.g., cooking, childcare, fashion) domains, were selected for cultural relevance to European participants @valved2021gender. Items have moderate to high difficulty to support the credibility of subsequent bogus feedback. Each item has one correct and one incorrect response option. Example items include: “Die Paste, die man zum Löten verwendet, heißt (Gel vs. Flussmittel)” and “Die erste Firma, die Haarfärbemittel entwickelte, war (Clairol vs. L’Oréal)”.
	
=== Masculinity Threatening and Non-Threatening Feedback
To administer a masculinity threat, participants were shown a diagram depicting a fictitious distribution of scores on the Gender Knowledge Test. In the non-threat condition, the participant’s score is close to the male average. In the threat condition, the participant is shown to have scored much lower than the average man.
	
=== Word Fragment Completion Task
The WFCT was used to assess aggressive and anxious cognition. Word fragments were developed by querying an online thesaurus using German terms related to aggression (“Wut,” “Ärger”) and anxiety (“Angst,” “Furcht”). Sixteen word fragments (eight aggressive, eight anxious) were presented in random order. Each could be completed in either an aggressive/anxious or neutral way (e.g., “\_UT” could become “HUT” [neutral] or “WUT” [aggressive]; “\_ANGEN” could become “WANGEN” [neutral] or “BANGEN” [anxious]).

=== Control of Experimental Manipulation
Participants were asked whether they had any suspicions about the study’s true purpose. If they answered affirmatively, they were prompted to describe their suspicions. All participants were then asked to recall the type of feedback they received on the Gender Knowledge Test (_below average_, _about average_, or _above average_). This served as a manipulation check.
=== Demographic Section
Participants reported their gender, age, level of education, and fluency in German. 

== Design
The study employed a between-subjects experimental design. Participants were randomly assigned to one of two conditions of the independent variable: threat condition (_threatening feedback_ or _non-threatening feedback_). The primary dependent variable was performance on the WFCT to measure aggressive/anxious cognition. Additionally, motivation for masculine behavior was measured and examined as a moderator variable to assess whether it influenced the relationship between threat condition aggressive/anxious cognition, as measured by  WFCT performance. 

== Power Analysis
To determine the appropriate sample size, four a priori power analyses were conducted using G*Power 3.1 @faul2007g. Additionally, the statistical complexity of the measurement model for the Motivation for Masculine Behavior was explored. Effect sizes and G*Power analyses can be found in Appendix B.

=== Masculinity threat effects
Previous studies have reported medium-sized effects of masculinity threat on aggressive cognition ($d$ = 0.56) and anxious cognition ($d$ = 0.55), both measured via the WFCT. Based on these estimates, a priori power analyses were conducted using one-tailed independent samples t-tests ($alpha$ = .05, power = .80). The analyses indicated required sample sizes of 82 participants for detecting effects on aggressive cognition and 84 participants for anxious cognition.

=== Moderation by motivation
For the moderation of pressured motivation on aggressive cognition, a small effect size was assumed ($f$ = 0.17), consistent with prior findings on motivational moderators. Due to the absence of previous studies on the moderation of autonomous motivation on anxious cognition, the same conservative small effect size ($f$ = 0.17) was used. Based on a linear multiple regression model including three predictors (threat condition, autonomous or pressured motivation, and their two-way interaction), G*Power indicated a required sample size of 208 participants ($alpha$ = .05, power = .80).

=== Factorial Structure of Motivation for Masculine Behavior

To evaluate the hypothesized two-factor structure of the Motivation for Masculine Behavior scale via Confirmatory Factor Analysis (CFA), sample size requirements were determined based on common recommendations for CFA model stability. Following conservative guidelines, a minimum of 200 participants to ensure stable estimation and generalizability of the factor structure, particularly when factors are correlated and loadings are moderate @hoogland1998robustness.

=== Final Target Sample Size
Based on the largest required sample size (moderation analysis; 208 participants) and accounting for an estimated 10% exclusion rate, the final target sample size was set at 229 participants.

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