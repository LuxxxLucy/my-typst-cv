#import "tufte-handout.typ": *
#import "cv-style.typ": *
#import "cv-content.typ": strings

#show: cv-style
#show: template.with(
  title: strings.title,
  height: auto,
)

#margin-note[
  // Cancel the global 0.9 Han shrink so Chinese labels match the Latin lines here.
  #show regex("\p{Han}"): set text(size: 1em)
  #set text(style: "italic", size: 0.8em)
  #strings.contact
]

= #strings.edu-heading

#margin-note[2021]
#edu-entry(strings.sfu-school, strings.sfu-degree)

#margin-note[2018]
#edu-entry(strings.zju-school, strings.zju-degree)

= #strings.occ-heading

#margin-note[#strings.occ-when]
#strings.employer
#indent(strings.role)

#indent(strings.occ-detail)

= #strings.blog-heading

#strings.blog-intro

#strings.projects

= #strings.skills-heading

#strings.skill-langs
#strings.skill-perf
#strings.skill-ml

= #strings.research-heading
#[
#v(-1em)
#margin-note[#strings.scholar]
]

#margin-note[KDD 2021]
#link("https://doi.org/10.1145/3447548.3467212")[*Interpretable Drug Response Prediction using a Knowledge-Based Neural Network.*]
Oliver Snow, Hossein Sharifi Noghabi, Jialin Lu, et al.

#margin-note[#strings.thesis-label]
#link("https://luxxxlucy.github.io/projects/2020_neural_dnf/neural_dnf.pdf")[*Neural Disjunctive Normal Form.*]
Jialin Lu.

#margin-note[NeurIPS Neuro↔AI Workshop, 2019]
#link("https://openreview.net/pdf?id=HJlVEQt8Lr")[*Revisit Recurrent Attention Model from an Active Sampling Perspective.*]
Jialin Lu.

#margin-note[NeurIPS HCML Workshop, 2019]
#link("https://arxiv.org/abs/1910.12207")[*An Active Approach for Model Interpretation.*]
Jialin Lu, Martin Ester.

#margin-note[NeurIPS Neuro↔AI Workshop, 2019]
#link("https://openreview.net/pdf?id=HJghQ7YU8H")[*Checking Functional Modularity in DNN By Biclustering Task-specific Hidden Neurons.*]
Jialin Lu, Martin Ester.

= #strings.other-heading

#margin-note[#strings.ta1-when]
#strings.ta1

#margin-note[#strings.ta2-when]
#strings.ta2

// #margin-note[2019 – 2021]
// #strings.ra

#margin-note[#strings.ta3-when]
#strings.ta3

#v(5em)