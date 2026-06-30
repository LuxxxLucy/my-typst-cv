// This is Jialin's handout template
// which starts as a tweak of the tufte handout of https://github.com/jwhear/tufte-handout
// The main point is tufte's handout layout which split the paper into two column:
// one for main text and one for the margin note. (see grid->columns in `let template` definition below)
//
// Layout:
// +-------------------------------------+
// |                    |                |
// |                    |                |
// |                    |                |
// |  Main content      |  Margin notes  |
// |  (~65% width)      |  (~35% width)  |
// |                    |                |
// |                    |                |
// |                    |                |
// +-------------------------------------+

// marginalia is the margin backend: it owns the page margins and floats notes into
// the outer margin with collision avoidance (replaces the old grid + place(right)).
#import "@preview/marginalia:0.3.1" as marginalia: note, wideblock

// Spacer so that main content and notes don't rub up against each other
#let main-margin-space-gap = 0.7in

// Size of the right "margin" (note area)
#let margin-size = 35%
// Size of the left "main" (content area)
#let main-size = 65%
// we use margin-note-size to bleed out the column for margin.

// Shared margin typography (size/font/leading) for both note kinds.
#let _note-text-style = (size: 0.65em, font: "Gill Sans", style: "italic")
#let _note-par-style = (leading: 0.5em)

// Sidenote number marks (style from dual-typst): a small superscript at the
// reference point, a slightly larger one before the note in the margin.
#let _sn-num(size, nums) = super(typographic: false, baseline: -0.5em, size: size, numbering("1", ..nums))
#let _sn-margin-mark = (..i) => [#_sn-num(0.85em, i.pos())#h(0.4em)]
#let _sn-anchor-mark = (..i) => _sn-num(0.7em, i.pos())

// Unnumbered margin note: content floated into the outer margin by marginalia.
#let margin-note(content) = note(counter: none, text-style: _note-text-style, par-style: _note-par-style)[#content]

// Numbered side note: marginalia auto-numbers, placing the anchor mark at the call
// site and the matching mark before the note in the margin. `dy` nudges vertically.
#let side-note(content, dy: 0pt) = note(
    dy: dy,
    numbering: _sn-margin-mark,
    anchor-numbering: _sn-anchor-mark,
    text-style: _note-text-style,
    par-style: _note-par-style,
)[#content]

// only enabled when "debug" is used as argument
// such as "typst comiple <...> --input debug=on"
// otherwise the content in the debug note will not be displayed
#let debug-note(content) = {
    if sys.inputs.keys().contains("debug") {
        block(width: 100%, {
            set text(size: 0.75em, style: "italic", fill: rgb(0,0,255))
            set align(left)
            v(-0.4em)
            h(3em)
            content
        })
    }
}


// Inserts a mian note containing `content` (in the left column, main content column)
// `dy` can be used to adjust the note content vertically
#let main-note(content) = {
    pad(left: 0.5em,
        block(width: 100%, {
            set text(size: 0.75em, font: "Gill Sans", style: "italic")
            set align(left)
            content
        })
    )
    v(0.5em)
}

// Renders `content` with the module's text styling.
//  This is useful for content that is outside of the `template` container but which should be visually consistent.
#let apply-text-styles(content) = {
    show heading.where(level: 1): it => text(
        weight: "extralight",
        size: 1.2em,
        style: "italic",
        {
            v(0.35em)
            h(-0.1em)
            it.body
            v(-0.3em)
        }
    )
    show heading.where(level: 2): it => text(
        weight: "extralight",
        size: 1em,
        style: "italic",
        {
            v(0.4em)
            it.body
            v(0.1em)
        }
    )

    // Lists
    set enum(
      indent: 1em,
      body-indent: 1em,
    )
    show enum: set par(justify: true)
    set list(
      indent: 1em,
      body-indent: 1em,
    )
    show list: set par(justify: true)
    content
}

#let show_header(title, name: none, date: none, email: none) = {
    block(width: 100%)[
        #h(-0.1em)
        #text(weight: "regular", 1.8em)[#title]
        #if name != none {
            v(0.3em)
            text(0.7em, font: "Gill Sans")[#name]
        }
        #if email != none {
            text(0.7em, font: "Gill Sans")[#h(1.2em) #email]
        }
        #if date != none {
            text(0.7em, font: "Gill Sans")[#h(1.2em) #date]
        }
        #v(2em)
    ]
}

// Call to wrap `doc` in the handout layout
//  `title` will be rendered in the page header
//  `wrapper` should be either `none` or a function that takes `doc` and returns
//    content.  This can be used to inject custom styles.
//
#let template(
    title: none,
    name: none,
    email: none,
    date: none,
    height: 11in,
    wrapper: apply-text-styles,
    doc,
) = {
    // `height: auto` makes one continuous tall page; the running header is
    // dropped there since it would have nothing to repeat across.
    set page(
        header: if title != none and height != auto {
            set text(size: 5pt, weight: "bold", tracking: 1.25pt, font: ("Berkeley Mono"))
            h(1fr)
            upper(title)
            v(2.5em)
        },
        width: 8.5in,
        height: height
    )

    // marginalia owns the margins; derive them from the old grid constants so the
    // body and note column keep the previous widths (x: 8% page margin, 35% note
    // column, 0.7in gap).
    let page-margin = 8.5in * 8%
    let note-col = (8.5in - 2 * page-margin - main-margin-space-gap) * margin-size
    show: marginalia.setup.with(
        inner: (far: page-margin, width: 0pt, sep: 0pt),
        outer: (far: page-margin, width: note-col, sep: main-margin-space-gap),
        top: 2cm,
        bottom: 2cm,
        book: false,
    )

    set text(size: 8pt)
    show link: underline
    set math.equation(numbering: "(1)")

    // Show header if provided
    show_header(title, name: name, email: email, date: date)
    wrapper(doc)
}

#let citet(..citation) = {
  cite(..citation, form: "prose")
}
#let citep(..citation) = {
  cite(..citation, form: "normal")
}

#let box(contents) = {
  rect(
    fill: rgb(242,242,242), 
    stroke: 0.5pt,
    width: 100%,
    align(center)[#contents]
  )
}

// Style for figure captions
#let figure-caption(content) = {
  set text(size: 0.7em, style: "italic")
  align(center)[#content]
}

// helper:
// no numbering block equation
#let nonumeq(eq) = math.equation(block: true, numbering: none, eq)
// numbering block equation.
#let numeq(eq) = math.equation(block: true, numbering: none, eq)
