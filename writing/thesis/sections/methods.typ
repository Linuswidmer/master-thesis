#import "../utils.typ": *
#import "@preview/versatile-apa:7.1.1": apa-figure

= Methods
To examine responses to masculinity threats and their hypothesized moderators, the study employed a between-subjects experimental design. The primary experimental manipulation involved the administration of either a masculinity threat or a non-threatening control condition. The dependent variables consisted of aggressive and anxious cognition, while pressured and autonomous motivation for masculine behavior were examined as continuous moderators of the masculinity threat response.

== Ethical Considerations and Pre-Registration
Prior to data collection, ethical considerations were addressed, particularly regarding the use of a deceptive experimental manipulation.
Ethical approval for this study was granted by the Ethics Committee of the Department of Psychology at Humboldt-Universität zu Berlin (reference number: 2025-41).
For transparency, the study's aims and methods were pre-registered on the Open Science Framework (https://osf.io/n6py4).
Any deviations from the pre-registration are justified and reported in the relevant sections.

== Sample and Recruitement
To determine the required sample size, a series of a priori power analyses were conducted using G*Power 3.1 @cunningham2007power. First, power analyses for the main effects of masculinity threat were based on effect sizes reported by #cite(<vandello2008precarious>, form: "prose") ($d = 0.55$ & $d = 0.91$) and #cite(<stanaland2021man>, form: "prose") ($d = 0.41$). For independent samples $t$-tests (one-tailed, $alpha = .05$, power = .80), an estimated medium effect size of $d approx 0.55$ indicated a required sample size of approximately 84 participants.
Second, a power analysis was conducted for the hypothesized moderation effects. An effect size of $f = 0.17$ ($f^2 = 0.03$) was assumed for the interaction between threat and motivation, based on the findings by #cite(<stanaland2024adolescent>, form: "prose"). For a linear multiple regression including three predictors (condition, motivation, and their interaction), this analysis indicated that 208 participants were required to achieve 80% power at $alpha = .05$.
Because the moderation analysis represented the most stringent requirement, the final target sample size was based on this calculation. To account for a potential 10% exclusion rate, the target was set at 229 participants.

To achieve a representative sample, participants were initially recruited via flyers in public spaces such as libraries, gyms, and cafes. Due to a limited response rate from these physical locations, 100 participants were recruited through an online study exchange portal (https://surveycircle.com) whose members are primarily young and academic.
In exchange for participation, 1€ was donated to a public organization supporting men's counselling and public interests (_Bundesforum Männer e.V._).

== Procedure
The procedure was adapted from #cite(<stanaland2021man>, form: "prose") into an online questionnaire and translated into German.
Participants completed the session on their own electronic devices, accessing the survey via a link on the study exchange portal or a QR code provided on recruitment flyers. Upon accessing the survey, participants were informed that the study concerned men's personality, motivation, and performance. Eligibility requirements—identifying as male, possessing native-level proficiency in German, and being at least 18 years of age—were clearly stated, and participants self-confirmed their eligibility and provided informed consent before proceeding.

The session began with the assessment of trait motivations using the MMB scale, where the nine items were presented in a randomized order to prevent sequence effects. Following this, participants completed the Gender Knowledge Test. This test was described as a validated measure of gender-relevant knowledge, designed to provide credible feedback on the participants' masculinity and to facilitate the experimental manipulation. The test items were presented in a fixed, pre-randomized sequence. Upon completion, a brief loading screen was displayed to simulate the real-time calculation of results, thereby increasing the credibility of the subsequent feedback.
Participants then received fabricated results that constituted either the masculinity threat or the control condition. To assess the immediate impact of this feedback on cognitive activation, participants completed the Word Fragment Completion Task to measure the accessibility of aggressive and anxious concepts. In the final stage of the session, participants provided demographic information and responded to manipulation check items.
Upon completion, a comprehensive debriefing was provided, explaining the study’s true purpose and clarifying that the feedback regarding test performance was fabricated and randomly assigned. The rationale for the use of deception was explicitly detailed, and participants were offered the final option to withdraw their data from the study.

== Measures
All translations followed the Translation, Review, Adjudication, Pretesting, and Documentation protocol @harkness2010translation.
Complete materials including all item wordings in German and English, documentation of the translation process and additional statistics are provided in Appendix A.

=== Motivation for Masculine Behavior Scale
The MMB scale was adapted from #cite(<stanaland2021man>, form: "prose") and translated into German. The scale originally consisted of nine items designed to measure participants' underlying motivations for enacting masculine behavior. Responses were recorded on a 7-point Likert scale ranging from 1 (_strongly disagree_) to 7 (_strongly agree_). To minimize participant suspicion regarding the scale’s purpose, the items were presented under the heading "Attitudes Toward Masculinity".

The scale is theorized to comprise two subscales: Pressured Motivation (Items 1–5), reflecting extrinsic social pressure, and Autonomous Motivation (Items 6–9), reflecting intrinsic enjoyment and personal importance.
To validate this, the item structure was first assessed via Confirmatory Factor Analysis (CFA).
Model fit was evaluated against the criteria established by #cite(<hu1999cutoff>, form: "prose"): CFI and TLI $> .95$, RMSEA $< .06$, and SRMR $< .08$. 
The initial CFA for the hypothesized two-factor model demonstrated poor fit ($#reportModelFitIndices(cfi: 0.851, tli: 0.801, rmsea: 0.179, srmr: 0.248)$).
Diagnostic inspection of the polychoric correlation matrix (#ref(<fig:corrplot-mmb>)) and a subsequent Exploratory Factor Analysis with correlated factors (#ref(<table:efa-mmb>)) identified the sources of this poor fit. 
While Items 1–5 showed strong coherence on the Pressured Motivation factor, the Autonomous Motivation factor was less distinct. Notably, Item 9 ("It is important to me not to be feminine") exhibited significant cross-loadings on both factors.

#apa-figure(
  image("../images/corrplot-mmb.png"),
  caption: [Polychoric Correlation Matrix for Motivation for Masculine Behavior Scale],
  note: [MMB = Motivation for Masculine Behavior. Rectangles indicate the hypothesized factor structure: Items 1–5 = Pressured Motivation subscale; Items 6–9 = Autonomous Motivation subscale. Larger circles indicate stronger positive correlations.],
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
  caption: [Factor Loadings on the Motivation for Masculine Behavior Scale],
  note: [
    English item versions of Motivation for Masculine Behavior Scale.
    Factor loadings below .30 are suppressed for clarity. Extraction method: Maximum Likelihood with oblimin rotation.
  ],
  label: "table:efa-mmb",
)

Based on these results, Item 9 was removed. Furthermore, modification indices suggested a residual covariance between Items 7 and 8. 
This adjustment is conceptually grounded, as both items express positive affect toward masculine identity ("enjoy," "happy") rather than distinct motivational drivers.
A final CFA on the refined 8-item scale incorporating this correlated residual yielded a substantially improved fit ($#reportModelFitIndices(cfi: 0.966, tli: 0.947, rmsea: 0.098, srmr: 0.066)$).
While the TLI and RMSEA remained slightly outside ideal thresholds, the CFI and SRMR satisfied target values.
No further modifications were pursued to avoid overfitting and maintain theoretical integrity.
Subscale scores were computed as means using the refined structure: Pressured Motivation (Items 1–5) and Autonomous Motivation (Items 6–8). 
The two subscales showed a moderate positive correlation ($r = .39$). 
Reliability was assessed using McDonald's omega ($omega$), indicating excellent reliability for the Pressured Motivation subscale ($omega = .93$) and acceptable reliability for the Autonomous Motivation subscale ($omega = .70$).

=== Masculinity Threat Induction
The masculinity threat was administered by requiring participants to complete a test supposedly measuring their knowledge of gender-specific topics and subsequently providing them with feedback regarding their performance. The task utilized a culturally adapted version of the Gender Knowledge Test, originally developed by #cite(<rudman2004reactions>, form: "prose") and updated for European participants by #cite(<valved2021gender>, form: "prose").
This test consisted of thirty forced-choice items balanced across stereotypically masculine domains, such as sports and home repair, and feminine domains, such as childcare and fashion. To ensure the credibility of the subsequent bogus feedback, the items were designed with moderate to high difficulty so that participants could not easily estimate their own performance.
Each item featured a forced-choice format with one correct and one incorrect response option (e.g., "The paste used for soldering joints is called: gel vs. flux"; "The first company to develop hair coloring was: Clairol vs. L'Oréal").

Following the test, participants were shown a diagram depicting a fictitious distribution of scores to anchor the manipulation. The scale ranged from a maximum feminine score of -4 to a maximum masculine score of +4. In the threat condition, participants were informed they had scored -1.83, a value positioned substantially below the alleged male average of +2.24. To reinforce the psychological impact of the threat, this score was accompanied by an explicit statement that their responses were more similar to women than to men. Conversely, participants in the control condition were told they scored +2.18, placing them close to the male average and indicating a typical performance for male participants. In both conditions, the visual distribution graph served to anchor the feedback by highlighting the participant's position relative to the alleged male norm.

=== Word Fragment Completion Task
The Word Fragment Completion Task was first developed by #cite(<vandello2008precarious>, form: "prose") to implicitly assess aggressive cognition. 
For the current study, a German version was developed consisting of ten aggressive and ten anxious word fragments. 
These fragments were created by identifying German target words semantically related to aggression (e.g., "Wut" [anger]) and anxiety (e.g., "Bangen" [to fear]) using a word association thesaurus (https://wordassociations.net/de/). 
Potential fragments were generated by removing the first letter of each target word, ensuring each could be completed as either the target word or a neutral alternative (e.g., "\_UT" becoming "WUT" [anger] or "HUT" [hat]). 
To mask the task’s true purpose, it was presented as a measure of "speed of thought." 
Word fragments were displayed individually with a seven-second time limit to encourage spontaneous, intuitive responses.

Following data collection, the psychometric properties of the Word Fragment Completion Task were evaluated to assess the reliability of these newly developed items. 
Diagnostic analyses revealed substantial deficits in the task's measurement quality. 
The tetrachoric correlation matrices for both the aggressive (#ref(<fig:corrplot-aggressive>)) and anxious (#ref(<fig:corrplot-anxious>)) subscales showed weak, inconsistent, and occasionally negative correlations among items. 
For the aggressive items, positive completion rates varied substantially (3.3% to 63.8%; see @table:wfct-agg-descriptives), and the Kaiser-Meyer-Olkin (KMO) criterion yielded a Measure of Sampling Adequacy (MSA) of .16—well below the acceptable .60 threshold. 
Internal consistency was similarly poor ($alpha = .36$). 
The anxious items exhibited even greater instability; positive completion rates ranged from 3.4% to 85.7% (@table:wfct-anx-descriptives), and the subscale reached an MSA of only .30 with an unacceptable Cronbach’s alpha ($alpha = .09$).

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

=== Demographics, Manipulation Checks and Suspicion Probe
Demographic data were collected to provide an overview of the sample's characteristics.
Participants reported their age, gender, and German proficiency, followed by their highest educational and occupational qualifications.
The effectiveness of the experimental manipulation was verified using two check items.
First, participants recalled the type of feedback they received on the Gender Knowledge Test on a scale from 1 (_typically feminine_) to 10 (_typically masculine_). 
Results confirmed that participants correctly interpreted the masculinity feedback, as participants in the threat condition reported lower scores (#reportMeanAndSD(mean: 3.08, sd: 0.93)) than those in the control condition (#reportMeanAndSD(mean: 6.22, sd: 1.00)).
Second, they provided a self-evaluation of their own gender knowledge on the same scale. 
Consistent with the intended effect, the masculinity feedback was perceived as credible.
Participants in the threat condition reported lower scores (#reportMeanAndSD(mean: 5.71, sd: 1.43)) than those in the control condition (#reportMeanAndSD(mean: 6.79, sd: 1.38)). 
An independent samples $t$-test confirmed this difference was significant, #reportTStatistic(tValue: 4.735, pValue: 0.00001, df: 154).

To assess suspicion, participants indicated whether they believed the study concerned something other than what was stated.
If they responded affirmatively, they were prompted to describe their suspicions.
Finally, an open-text field allowed participants to share additional thoughts.
Nine participants correctly identified the experimental manipulation of the feedback and were flagged for exclusion during the data cleaning process.