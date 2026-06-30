// All translatable CV text, keyed. Each value carries an English and a Chinese
// branch via `t(en, zh)`; the layout in cv.typ stays language-agnostic.
#import "cv-style.typ": t, margin-note, side-note, LaTeX

#let ester = "https://scholar.google.com/citations?user=ZYwC_CQAAAAJ&hl=en"
#let typst-prs = "https://github.com/typst/typst/pulls?q=is%3Apr+author%3ALuxxxLucy+is%3Amerged"

#let strings = (
  title: t([Jialin Lu], [陆家林]),

  // Header contact block (labels translated, values shared).
  contact: t(
    [
      Email: #link("mailto:luxxxlucy@gmail.com")[luxxxlucy\@gmail.com] \
      Phone: (+1) 778 865 6323 or (+86) 131 5717 8983 \
      GitHub: #link("https://github.com/LuxxxLucy")[LuxxxLucy] \
      Homepage: #link("https://luxxxlucy.github.io")[luxxxlucy.github.io] \
],
    [
      邮箱: #link("mailto:luxxxlucy@gmail.com")[luxxxlucy\@gmail.com] \
      电话: (+1) 778 865 6323 或 (+86) 131 5717 8983 \
      GitHub: #link("https://github.com/LuxxxLucy")[LuxxxLucy] \
      个人主页: #link("https://luxxxlucy.github.io")[luxxxlucy.github.io] \
],
  ),

  // Education.
  edu-heading: t([Education], [教育]),
  sfu-school: t([Simon Fraser University], [Simon Fraser University]),
  sfu-degree: t(
    [M.Sc. Computer Science, supervised by #link(ester)[Martin Ester].],
    [M.Sc. Computing Science, supervised by #link(ester)[Martin Ester].],
  ),
  zju-school: t([Zhejiang University], [浙江大学]),
  zju-degree: t(
    [B.Eng: Computer Science. \ B.Eng: Industrial Design.],
    [本科:计算机科学 + 工业设计 (双学位)],
  ),

  // Current occupation.
  occ-heading: t([Current Occupation], [工作]),
  occ-when: t([2021 – now], [2021 – 至今]),
  employer: t([*Huawei Vancouver Research Center*], [*华为 温哥华研究所*]),
  role: t(
    [Senior Engineer R&D, systems-performance engineering. The main of work is shipped in the #link("https://e.huawei.com/en/solutions/enterprise-network/security")[USG series enterprise gateway] series.],
    [Senior Engineer R&D, 主要做系统性能优化. 除预研外, 主要落地产品是 #link("https://e.huawei.com/en/solutions/enterprise-network/security")[USG 系列企业网关].],
  ),
  occ-detail: t(
    [
      Selected corporate awards:
       - Outstanding Individual, 2025 (top 2 of 150+)
      - Campaign Project Hero, 2025
      - Gold Medal Team, 2024 (top 1 of 10+)
      - Future Star, 2024
      - Gold Network, seven or eight times
],
    [
      部分公司里的奖项:
      - 杰出个人, 2025 (top 2 of 150+ R&D in Vancouver)
      - 战地英雄, 2025
      - 金牌团队, 2024 (top 1 of 10+)
      - 未来之星, 2024
],
  ),

  // Blog / recent projects.
  blog-heading: t([Other], [其他]),
  blog-intro: t([], []),
  projects: t(
    [
- Outside work I keep a #link("https://luxxxlucy.github.io/#:~:text=Blogs")[personal blog] where I write up technical projects and odds and ends, including typesetting, fonts, and program synthesis.
- My #link("https://github.com/LuxxxLucy")[GitHub] is mostly personal tools and scripts; I haven't done much open source. In the pre-agent era I made #link(typst-prs)[a few contributions] to Typst, mostly decoration (highlighting) and the typesetting of math symbols.#side-note[This document is typesetted in #link("https://typst.app")[Typst]. Typst uses a strong #link("https://www.researchgate.net/publication/364622490_Fast_Typesetting_with_Incremental_Compilation")[caching scheme] for very fast incremental compilation, orders of magnitude faster than #LaTeX, and since 2024 it has been a mature typesetting tool. I highly recommend it.]
],
    [
- 工作之余我有一个#link("https://luxxxlucy.github.io/#:~:text=Blogs")[个人博客], 记录一些技术项目和乱七八糟的东西, 包括我业余很感兴趣的 typesetting, 字体, program synthesis 等.
- 我的#link("https://github.com/LuxxxLucy")[GitHub] 上大多是自用的软件和脚本, 开源贡献做得不多. 在 Pre-Agent 时代, 给 Typst 做过#link(typst-prs)[一些贡献], 主要是一些装饰(高亮)和数学符号的 typesetting 排版问题.
],
  ),

  // Research.
  research-heading: t([Research], [研究]),
  scholar: t(
    [See #link("https://scholar.google.com/citations?user=BeYo3C4AAAAJ&hl=en")[Google Scholar].],
    [见我的#link("https://scholar.google.com/citations?user=BeYo3C4AAAAJ&hl=en")[Google Scholar].],
  ),
  thesis-label: t([Master Thesis, 2020], [硕士论文, 2020]),

  // Other experience.
  other-heading: t([Other Experience], [其他经历]),
  ta1-when: t([Jan – Apr 2021], [Jan – Apr 2021]),
  ta1: t(
    [*Teaching Assistant* — CMPT419/726 Machine Learning, Simon Fraser University (Supervisor: Ke Li).],
    [*助教* — CMPT419/726 Machine Learning, Simon Fraser University (导师:Ke Li).],
  ),
  ta2-when: t([May – Aug 2020], [May – Aug 2020]),
  ta2: t(
    [*Teaching Assistant* — CMPT353 Computational Data Science, Simon Fraser University (Supervisor: Greg Baker).],
    [*助教* — CMPT353 Computational Data Science, Simon Fraser University (导师:Greg Baker).],
  ),
  ra: t(
    [*Research Assistant* — Simon Fraser University (Supervisor: #link(ester)[Martin Ester]).],
    [*研究助理* — Simon Fraser University (导师:#link(ester)[Martin Ester]).],
  ),
  ta3-when: t([Mar – Jun 2018], [Mar – Jun 2018]),
  ta3: t(
    [*Teaching Assistant* — Artificial Intelligence, Zhejiang University (Supervisor: Xi Li).],
    [*助教* — 人工智能, 浙江大学 (导师:李玺).],
  ),

  // Skills.
  skills-heading: t([Skills], [技能]),
  skill-langs: t(
    [C, Rust (occasionally).],
    [C, Rust (偶尔).],
  ),
  skill-perf: t([], []),
  skill-ml: t([], []),
)
