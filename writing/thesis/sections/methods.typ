#import "../utils.typ": *
#import "@preview/versatile-apa:7.1.1": apa-figure

= Methods
To examine responses to masculinity threats and their hypothesized moderators, the study employed a 2-factorial between-subjects experimental design. The primary experimental factor involved the administration of either a masculinity threat or a non-threatening control condition.
Subject of measurement was the participants aggressive and anxious cognition.
Pressured and Autonomous Motivation for masculine behaviour were examined as a moderators of the masculinity threat response.

== Ethical Considerations and Pre-Registration
Prior to data collection, ethical considerations were addressed, particularly regarding the use of a deceptive experimental manipulation.
Ethical approval for this study was granted by the Ethics Committee of the Department of Psychology at Humboldt University of Berlin (reference number: 2025-41).
For transparency, the study's aims and methods were pre-registered on the Open Science Framework (https://osf.io/n6py4).
Any deviations from the pre-registration are justified and reported in the relevant sections.

== Sample and Recruitement
To determine the required sample size, a series of a priori power analyses were conducted using G*Power 3.1 @cunningham2007power. First, power analyses for the main effects of masculinity threat were based on effect sizes reported by #cite(<vandello2008precarious>, form: "prose") ($d = 0.55$ & $d = 0.91$) and #cite(<stanaland2021man>, form: "prose") ($d = 0.41$). For independent samples $t$-tests (one-tailed, $alpha = .05$, power = .80), an estimated medium effect size of $d approx 0.55$ indicated a required sample size of approximately 84 participants.
Second, a power analysis was conducted for the hypothesized moderation effects. An effect size of $f = 0.17$ was assumed for the interaction between threat and motivation, based on the findings by #cite(<stanaland2024adolescent>, form: "prose"). For a linear multiple regression including three predictors (condition, motivation, and their interaction), this analysis indicated that 208 participants were required to achieve 80% power at $alpha = .05$.
Because the moderation analysis represented the most stringent requirement, the final target sample size was based on this calculation. To account for a potential 10% exclusion rate, the target was set at 229 participants.

To achieve a representative sample, participants were initially recruited via flyers in public spaces such as libraries, gyms, and cafes. Due to a limited response rate from these physical locations, 100 participants were recruited through an online study exchange portal (https://surveycircle.com) whose members are primarily young and academic.
In exchange for participation, 1€ was donated to a public organization supporting men's counselling and public interests (Bundesforum Männer e.V.).

== Procedure
The procedure was adapted from #cite(<stanaland2021man>, form: "prose") into an online questionnaire and translated into German.
Participants completed the study on their own electronic devices, accessing the survey via a link on the study exchange portal or a QR code provided on recruitment flyers.

Participants were informed that they would participate in a study concerning men's personality, motivation, and performance.
They were reminded that eligibility required identifying as male, native-level proficiency in German, and a minimum age of 18 years. By proceeding, participants self-confirmed their eligibility. Afterwards, they provided informed consent.
First, participants completed the MMB scale, with the nine items presented in a randomized order. This was followed by the GKT, where items were presented in a fixed, pre-randomized sequence. After completion of the GKT, participants received their experimental feedback.
To assess the impact of this feedback, participants then completed the WFCT to measure aggressive and anxious cognition. In the final stage of the session, participants provided demographic information and responded to the manipulation check items. 
Upon completing all study components, participants received a full debriefing.
This included an explanation of the study's true purpose and a clarification that the feedback on the participants test performance was fabricated and randomly assigned.
The rationale for the deception was explained, and participants were offered the option to withdraw their data.

== Materials
All translations followed the Translation, Review, Adjudication, Pretesting, and Documentation protocol @harkness2010translation.
Complete materials including all item wordings in both languages and documentation of the translation process are provided in Appendix A.

=== MMB
The MMB scale was adapted from #cite(<stanaland2023masculinity>, form: "prose") and translated into German. The scale originally consisted of nine items designed to measure participants' underlying motivations for enacting masculine behavior. Responses were recorded on a 7-point Likert scale ranging from 1 (_strongly disagree_) to 7 (_strongly agree_). To minimize participant suspicion regarding the scale’s purpose, the items were presented under the heading "Attitudes Toward Masculinity".

The scale is theorized to comprise two subscales: Pressured Motivation (Items 1–5), reflecting extrinsic social pressure, and Autonomous Motivation (Items 6–9), reflecting intrinsic enjoyment and personal importance.
To validate this structure, the item structure was first assessed via Confirmatory Factor Analysis.
Model fit was evaluated against the criteria established by #cite(<hu1999cutoff>, form: "prose"): CFI and TLI $> .95$, RMSEA $< .06$, and SRMR $< .08$. 
The initial CFA for the hypothesized two-factor model demonstrated poor fit (#reportModelFitIndices(cfi: 0.851, tli: 0.801, rmsea: 0.179, srmr: 0.248)).
Diagnostic inspection of the polychoric correlation matrix (#ref(<fig:corrplot-mmb>)) and a subsequent Exploratory Factor Analysis with correlated factors (#ref(<table:efa-mmb>)) identified the sources of this poor fit. 
While Items 1–5 showed strong coherence on the Pressured Motivation factor, the Autonomous Motivation factor was less distinct. Notably, Item 9 ("It is important to me not to be feminine") exhibited significant cross-loadings on both factors.

#apa-figure(
  image("../images/corrplot-mmb.png"),
  caption: [Polychoric Correlation Matrix for MMB items],
  note: [Polychoric correlations of Motivation for Masculine Behaviour (MMB) items. Rectangles indicate the hypothesized factor structure: Items 1–5 = Pressured Motivation subscale; Items 6–9 = Autonomous Motivation subscale. Larger circles indicate stronger positive correlations.],
  label: "fig:corrplot-mmb",
)

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
  caption: [EFA Factor Loadings for the MMB Scale],
  note: [
    English item versions of MMB Scale.
    Factor loadings below .30 are suppressed for clarity. Extraction method: Maximum Likelihood with oblimin rotation.
  ],
  label: "table:efa-mmb",
)

Based on these results, Item 9 was removed. Furthermore, modification indices suggested a residual covariance between Items 7 and 8. 
This adjustment is conceptually grounded, as both items express positive affect toward masculine identity ("enjoy," "happy") rather than distinct motivational drivers.
A final CFA on the refined 8-item scale incorporating this correlated residual yielded a substantially improved fit (#reportModelFitIndices(cfi: 0.966, tli: 0.947, rmsea: 0.098, srmr: 0.066)).
While the TLI and RMSEA remained slightly outside ideal thresholds, the CFI and SRMR satisfied target values.
No further modifications were pursued to avoid overfitting and maintain theoretical integrity.
Subscale scores were computed as means using the refined structure: Pressured Motivation (Items 1–5) and Autonomous Motivation (Items 6–8). 
The two subscales showed a moderate positive correlation ($r = .39$). 
Reliability was assessed using McDonald's omega ($omega$), indicating excellent reliability for the Pressured Motivation subscale ($omega = .93$) and acceptable reliability for the Autonomous Motivation subscale ($omega = .70$).

=== GKT
The GKT, originally developed by #cite(<rudman2004reactions>, form: "prose"), was used in a version culturally adapted for European participants by #cite(<valved2021gender>, form: "prose").
Thirty items covering stereotypically masculine (e.g., sports, combat, home repair) and feminine (e.g., cooking, childcare, fashion) knowledge domains were included.
Items were designed with moderate to high difficulty to support the credibility of the subsequent bogus feedback.
Each item featured one correct and one incorrect response option (e.g., "The paste used for soldering joints is called: gel vs. flux"; "The first company to develop hair coloring was: Clairol vs. L'Oréal").

=== Masculinity Threatening and Non-Threatening Feedback
To administer the masculinity threat, participants were shown a diagram depicting a fictitious distribution of scores on the GKT.
The scale ranged from -4 (maximum feminine score) to +4 (maximum masculine score).
In the threat condition, participants were told they scored –1.83, substantially below the alleged male average of +2.24.
This feedback was accompanied by a statement that their answers were "more similar to women than to men."
In the no-threat condition, participants were told they scored +2.18, close to the male average, indicating "typical" performance for male participants.
Both conditions included a visual distribution graph highlighting the participant's position relative to other men.

=== WFCT
The WFCT was first developed by #cite(<vandello2008precarious>, form: "prose") to implicitly assess aggressive and anxious cognition. 
For the current study, a German version was developed consisting of ten aggressive and ten anxious word fragments. 
These fragments were created by identifying German target words semantically related to aggression (e.g., "Wut" [anger]) and anxiety (e.g., "Bangen" [to fear]) using a word association thesaurus (https://wordassociations.net/de/). 
Potential fragments were generated by removing the first letter of each target word, ensuring each could be completed as either the target word or a neutral alternative (e.g., "\_UT" becoming "WUT" [anger] or "HUT" [hat]). 
To mask the task’s true purpose, it was presented as a measure of "speed of thought." 
Word fragments were displayed individually with a seven-second time limit to encourage spontaneous, intuitive responses.

Following data collection, the psychometric properties of the WFCT were evaluated to assess the reliability of these newly developed items. 
Diagnostic analyses revealed significant limitations in the task's measurement quality. 
The tetrachoric correlation matrices for both the aggressive (#ref(<fig:corrplot-aggressive>)) and anxious (#ref(<fig:corrplot-anxious>)) subscales showed weak, inconsistent, and occasionally negative correlations among items. 
For the aggressive items, completion rates varied substantially (3.3% to 63.8%), and the Kaiser-Meyer-Olkin (KMO) criterion yielded a Measure of Sampling Adequacy (MSA) of .16—well below the acceptable .60 threshold. 
Internal consistency was similarly poor ($alpha = .36$). 
The anxious items exhibited even greater instability; completion rates ranged from 3.4% to 85.7%, and the subscale reached an MSA of only .30 with an unacceptable Cronbach’s alpha ($alpha = .09$).

#apa-figure(
  image("../images/corrplot-aggressive-cognition.png"),
  caption: [Tetrachoric Correlation Matrix for Aggressive Word Fragment Items],
  note: [Darker shading indicates stronger positive correlations. Item descriptives are provided in #ref(<table:wfct-agg-descriptives>).],
  label: "fig:corrplot-aggressive",
)

#apa-figure(
  image("../images/corrplot-anxious-cognition.png"),
  caption: [Tetrachoric Correlation Matrix for Anxious Word Fragment Items],
  note: [Darker shading indicates stronger positive correlations. Item descriptives are provided in #ref(<table:wfct-anx-descriptives>).],
  label: "fig:corrplot-anxious",
)

=== Demographic Questionnaire, Manipulation Check and Suspicion Probe
Demographic data were collected to provide an overview of the sample's characteristics. Participants reported their age, gender, and German proficiency, followed by their highest educational and occupational qualifications.

Two manipulation check items verified that participants correctly perceived the experimental manipulation.
First, participants recalled the type of feedback they received on the GKT on a scale from 1 (_typically feminine_) to 10 (_typically masculine_). 
Results confirmed that participants correctly interpreted the masculinity feedback, as participants in the threat condition reported lower scores (#reportMeanAndSD(mean: 3.08, sd: 0.93)) than those in the no-threat condition (#reportMeanAndSD(mean: 6.22, sd: 1.00)).
Second, they provided a self-evaluation of their own gender knowledge on the same scale. 
Also here, results confirmed that the masculinity feedback was perceived as credible, since  participants in the threat condition reported lower scores (#reportMeanAndSD(mean: 5.71, sd: 1.43)) than those in the no-threat condition (#reportMeanAndSD(mean: 6.79, sd: 1.38)). 
An independent samples $t$-test confirmed this difference was significant, (#reportTStatistic(tValue: 4.735, pValue: 0.00001, df: 154)).

To assess suspicion, participants indicated whether they believed the study concerned something other than what was stated.
If they responded affirmatively, they were prompted to describe their suspicions.
Participants were also given the opportunity to share any other thoughts about the study in an open-text field.
Nine participants correctly identified the experimental manipulation of the feedback.