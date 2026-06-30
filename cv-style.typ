// CV-specific styling layered on top of the intact tufte-handout template:
// language selection, the Chinese font, and entry layout helpers.
#import "tufte-handout.typ": *

// Language selected via `--input lang=zh` (default "en").
#let cv-lang = if "lang" in sys.inputs { sys.inputs.lang } else { "en" }
// Pick the branch matching the current language.
#let t(en, zh) = if cv-lang == "zh" { zh } else { en }

// LaTeX wordmark: the conventional kerned logo in Computer Modern. std.box, since
// tufte-handout shadows `box` with a bordered rect.
#let LaTeX = std.box(text(font: "New Computer Modern", style: "normal")[
  L#h(-0.32em)#text(size: 0.7em, baseline: -0.3em)[A]#h(-0.13em)T#h(-0.1em)#text(baseline: 0.22em)[E]#h(-0.06em)X])

// Larger margin notes than the template default (0.65em): scale the content up,
// keeping the template intact. Chinese Han is shrunk 0.9 by the global rule, so
// the English margin matches by applying the same 0.9.
#let base-margin-note = margin-note
#let margin-note(content) = base-margin-note(
  text(size: if cv-lang == "zh" { 1.3em } else { 1.3em * 0.9 }, content),
)

// Enlarge sidenote content like margin notes; marginalia (via the template
// side-note) supplies the auto-numbered marks.
#let base-side-note = side-note
#let side-note(content) = base-side-note(
  text(size: if cv-lang == "zh" { 1.3em } else { 1.3em * 0.9 }, content),
)

// Indent a sub-detail under its bold anchor: horizontal only, hugging the line above.
#let indent(body) = block(inset: (left: 1em), above: 0.8em, below: 1em, body)

// Education entry: institution in a larger face, indented degree below, with
// separation after so entries group visually. The institution cancels the global
// 0.9 Han shrink so a Chinese school matches the Latin ones at 1.2em.
#let edu-entry(school, degree) = {
  {
    show regex("\p{Han}"): set text(size: 1em)
    text(size: 1.2em)[#school]
  }
  indent(degree)
  v(0.5em)
}

// Document wrapper applied via `#show: cv-style`. For Chinese, every Han glyph
// renders in Jinhua with fallback off (so bold/light faux-bolds Jinhua instead of
// grabbing a system Heiti, since Jinhua ships Regular only) and scaled to 0.9 to
// match the Latin body. Latin and symbols keep the template's fonts.
// In zh mode the body is Chinese with English inline (terms, names, links). Latin
// runs render smaller so Chinese reads as the primary text. A run must start at a
// letter/digit, so ASCII punctuation inside a Chinese sentence (always preceded by
// a Han glyph) never starts a match and keeps Chinese size. Tune via zh-latin-scale.
#let zh-latin-scale = 0.85

#let cv-style(doc) = {
  set text(font: "EB Garamond")
  set text(lang: "zh") if cv-lang == "zh"
  show regex("\p{Han}"): set text(font: "Jinhua Serif C", fallback: false, size: 0.9em)
  show regex("[A-Za-z0-9][A-Za-z0-9 ./,:;+&()@_-]*"): set text(size: zh-latin-scale * 1em) if cv-lang == "zh"
  doc
}
