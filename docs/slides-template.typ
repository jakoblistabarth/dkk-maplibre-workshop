#import "globals.typ": colors
#import "@preview/zebra:0.1.0": qrcode

#let dkk-slides = (title: none, author: none, date: none, body) => {
  set document(
    title: title,
    author: author,
    date: date,
  )
  set page(
    paper: "presentation-16-9",
    margin: (x: 5%, y: 15%),
    header-ascent: 60%,
    header: context {
      set text(size: 6pt)
      [Dresden, ]
      document.date.display("[day].[month].[year]")
      h(1fr)
      box(baseline: .3em, image("links/TUD_Logo_RGB_kurz_blau.svg", height: 14pt))
    },
    footer-descent: 60%,
    footer: context {
      set text(size: 6pt)
      document.author.join("")
    },
  )

  set text(
    font: "Noto Sans",
    size: 20pt,
  )

  show title: set text(font: "Noto Serif", weight: "light", size: 1.25em, style: "italic", fill: colors.tud)

  show heading: set text(font: "Noto Serif", fill: colors.tud, weight: "regular")

  show heading: set block(below: 1.5em)

  show link: underline
  show link: set text(fill: colors.tud)

  show raw: set text(font: "Noto Sans Mono", fill: colors.tud, size: 1.2em)

  body
}
