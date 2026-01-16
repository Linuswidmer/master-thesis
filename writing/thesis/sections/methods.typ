#import "../utils.typ": *
#import "@preview/versatile-apa:7.1.1": apa-figure
#import "../figures/consort-flowchart.typ": consort-flowchart

= Methods
== Ethical Considerations and Pre-Registration
Prior to data collection, ethical considerations were addressed, particularly regarding the use of a deceptive experimental manipulation.
Ethical approval for this study was granted by the Ethics Committee of the Department of Psychology at Humboldt University of Berlin (reference number: 2025-41).

For transparency, the study's aims and methods were pre-registered on the Open Science Framework (https://osf.io/n6py4).
Any deviations from the pre-registration are justified and reported in the relevant sections.

== Participants
A priori power analysis based on effect sizes from previous studies indicated a required sample size of 209 participants (see Appendix A, Sample Size Planning).
The target sample size was set at 229 participants (10% higher to account for attrition).
Eligibility criteria included self-identification as male, native-level proficiency in German, and a minimum age of 18 years.
To achieve a representative sample, participants were initially recruited via flyers in public spaces such as libraries, gyms, and cafes. Due to a limited response rate from these physical locations, 100 participants were recruited through an online study exchange portal (https://surveycircle.com) whose members are primarily young and academic.
In exchange for participation, 1€ was donated to a public organization supporting men's counselling and public interests (Bundesforum Männer e.V.).

A final sample of 196 participants was collected over a two-month period. Although this fell short of the target of 229 participants identified in the power analysis, data collection was concluded due to time constraints of the project.

Several participants were excluded based on pre-registered criteria to ensure data quality. @fig:consort-flowchart provides an overview of participant flow and exclusions, that were made due to withdrawal of consent, failing to meet eligibility criteria, failing attention checks and suspicion. 

After applying all exclusion criteria, 42 participants were removed in total. This resulted in a final analytical sample of $N = 154$ ($n_"threat" = 79$, $n_"no-threat" = 75$)..

#apa-figure(
  caption: [CONSORT Flowchart of Participant Exclusions],
  consort-flowchart,
  label: "fig:consort-flowchart",
)

The final sample ranged in age from 18 to 69 years (#reportMeanAndSD(mean: 30.6, sd: 10.9)).
The participants were predominantly highly educated: $80.5%$ held at least a general university entrance qualification, and $60.4%$ had completed a university degree.

== Research Design
To examine responses to masculinity threats and their hypothesized moderators, the study employed a 2-factorial between-subjects experimental design. The primary experimental factor involved the administration of either a masculinity threat or a non-threatening control condition.

Masculinity threats were induced by providing participants with fabricated negative feedback regarding their performance on a gender-associated knowledge test. In contrast, participants in the control condition received average feedback, which served as a non-threatening baseline for comparison.

To evaluate the threat response, two dependent variables were assessed: aggressive cognition and anxious cognition. These were operationalized as the proportion of target-word completions on the respective subscales of a WFCT.

Finally, the study utilized the Motivation for Masculine Behavior (MMB) scale to examine the hypothesized moderation effects. This scale was expected to differentiate between autonomous and pressured motivations, allowing for an assessment of how these distinct factors influence individual reactions to experimental threats.

== Procedure
The procedure was adapted from #cite(<stanaland2021man>, form: "prose") into an online questionnaire and translated into German.
Participants completed the study on their own electronic devices, accessing the survey via a link on the study exchange portal or a QR code provided on recruitment flyers.

Participants were informed that they would participate in a study concerning men's personality, motivation, and performance.
They were reminded that eligibility required identifying as male, native-level proficiency in German, and a minimum age of 18 years. By proceeding, participants self-confirmed their eligibility. Afterwards, they provided informed consent.

First, participants were asked to provide their personal opinions on various attitudes toward masculinity. This section consisted of nine items from the MMB scale, which were presented in a randomized order to each participant.

Next, participants were told they would complete a test measuring knowledge in areas typically associated with different genders in society. They were presented with the 30 items of the GKT in a pre-randomized fixed order. Each item required participants to select the correct answer from two provided response options.

Upon completion, participants received feedback about their test performance. This feedback was not based on participants' actual responses but was randomly assigned by experimental condition. The feedback was either (a) threatening feedback indicating worse performance than the average man, or (b) non-threatening feedback indicating performance comparable to the average man.

Following the feedback, participants were told they would take a test measuring their speed of thought.
In reality, they completed the 20 items of the WFCT.
They were instructed to complete word fragments by typing the complete word.
Items were presented in randomized order, with a seven-second time limit per item to encourage spontaneous, intuitive responses.

Participants then completed a demographic questionnaire and answered suspicion-check questions. This section also included a manipulation check to ensure the experimental feedback was perceived as intended.

Upon completing all study components, participants received a full debriefing.
This included an explanation of the study's true purpose and a clarification that the feedback on the participants test performance was fabricated and randomly assigned.
The rationale for the deception was explained, and participants were offered the option to withdraw their data.

== Materials
The MMB scale and GKT were translated from English to German following the Translation, Review, Adjudication, Pretesting, and Documentation (TRAPD) protocol @harkness2010translation.
Complete materials including all item wordings in both languages and documentation of the translation process are provided in Appendix A.

=== MMB
The MMB scale consists of nine items measuring participants' motivation for enacting masculine behavior.
Responses were recorded on a 7-point Likert scale ranging from 1 (_strongly disagree_) to 7 (_strongly agree_).
The scale comprises two subscales: Pressured Motivation (5 items; e.g., "In general, I'm masculine because I want others' acceptance and approval") and Autonomous Motivation (4 items; e.g., "I enjoy being masculine").

=== GKT
The GKT, consists of 30 items covering stereotypically masculine (e.g., sports, combat, home repair) and feminine (e.g., cooking, childcare, fashion) knowledge domains were included.
Items were designed with moderate to high difficulty to support the credibility of the subsequent bogus feedback.
Each item featured one correct and one incorrect response option (e.g., "The paste used for soldering joints is called: gel vs. flux"; "The first company to develop hair coloring was: Clairol vs. L'Oréal").

=== Masculinity Threatening and Non-Threatening Feedback
To administer the masculinity threat, participants were shown a diagram depicting a fictitious distribution of scores on the GKT.
In the threat condition, participants were told they scored –1.83, substantially below the alleged male average of +2.24.
This feedback was accompanied by a statement that their answers were "more similar to women than to men."
In the no-threat condition, participants were told they scored +2.18, close to the male average, indicating "typical" performance for male participants.
Both conditions included a visual distribution graph highlighting the participant's position relative to other men.

=== WFCT
The WFCT was used to assess aggressive and anxious cognition.
Word fragments were developed by first identifying German words semantically related to aggression ("Wut" [anger], "Ärger" [frustration]) and anxiety ("Angst" [fear], "Furcht" [fear]). Target words were identified using a word association thesaurus (https://wordassociations.net/de/).
For each target word, potential word fragments were generated by removing the first letter.
Each fragment could be completed as either a target word (aggressive or anxious) or a neutral word.
For example, "\_UT" could become "WUT" (anger; aggressive) or "HUT" (hat; neutral).
Similarly, "\_ANGEN" could become "BANGEN" (to fear; anxious) or "WANGEN" (cheeks; neutral).

=== Demographic Questionnaire, Manipulation Check and Suspicion Probe
Demographic data were collected to provide an overview of the sample's characteristics. Participants reported their age, gender, and German proficiency, followed by their highest educational and occupational qualifications.

Two manipulation check items verified that participants correctly perceived the experimental manipulation.
First, participants recalled the type of feedback they received on the GKT on a scale from 1 (_typically feminine_) to 10 (_typically masculine_).
Second, they provided a self-evaluation of their own gender knowledge on the same scale.

To assess suspicion, participants indicated whether they believed the study concerned something other than what was stated.
If they responded affirmatively, they were prompted to describe their suspicions.
Participants were also given the opportunity to share any other thoughts about the study in an open-text field.

== Data Analysis
Data analysis was performed using R version 4.5.2 @RCoreTeam. An anonymized dataset and the corresponding analysis code have been made publicly available via GitHub (https://github.com/Linuswidmer/master-thesis).

To validate the MMB scale, the item structure was assessed using both confirmatory factor analysis (CFA) and exploratory factor analysis (EFA). Model fit was evaluated according to the criteria established by @hu1999cutoff: Comparative Fit Index (CFI) $> .95$, Tucker-Lewis Index (TLI) $> .95$, Root Mean Square Error of Approximation (RMSEA) $< .06$, and Standardized Root Mean Square Residual (SRMR) $< .08$.

Hypothesis testing was conducted on the proportion of aggressive and anxious completed word fragments for each participant.
The pre-registered analysis plan specified an arcsine square root transformation to address the bounded nature of proportion data @winer1971statistical.
However, preliminary diagnostics revealed that the distribution of transformed scores was highly skewed, violating the normality assumption required for standard regression. To address this, the analyses employed a generalized linear model (GLM) with a binomial distribution and logit link function.
This approach directly models the count of target completions out of total trials, appropriately accounting for the bounded and discrete nature of the outcome without requiring transformation.

To ensure robustness, several diagnostic checks were performed.
Prior to the main analyses, Levene's tests assessed homogeneity of variance across conditions.
The distribution of residuals was evaluated using simulated residuals via the DHARMa package @DHARMa.
To identify influential observations that may distort results @aguinis2013best, a sensitivity analysis flagged cases exceeding a Cook's distance threshold of $4 / (n - k)$, removed them, and refitted the model to confirm the stability of findings.

A significance level of $alpha = .05$ was applied throughout.
To evaluate the detectability of effects, sensitivity analyses were conducted using G*Power 3 @cunningham2007power.
Sensitivity analysis determines the minimum effect size detectable with $80%$ power at $alpha = .05$, avoiding the limitations of post-hoc observed power @hoenig2001abuse.
If the observed effect is substantially smaller than the minimum detectable effect, this suggests absence of a meaningful effect rather than insufficient statistical power.