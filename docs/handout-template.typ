#import "globals.typ": colors

#let dkk-handout = (title: none, author: none, date: none, body) => {
  set document(
    title: title,
    author: author,
    date: date,
  )
  set page(
    margin: (right: 12.5%),
    paper: "a4",
    header: context {
      set text(size: 6pt)
      [Dresden, ]
      document.date.display("[day].[month].[year]")
      h(1fr)
      box(baseline: .3em, image("links/TUD_Logo_RGB_kurz_blau.svg", height: 14pt))
    },
    footer: context {
      set text(size: 6pt)
      document.author.join("")
      h(1fr)
      counter(page).display(both: true, "1 von 1")
    },
  )

  set text(
    font: "Noto Sans",
    size: 10pt,
  )

  show title: set text(font: "Noto Serif", weight: "light", size: 1.25em, style: "italic", fill: colors.tud)

  show heading: set text(font: "Noto Serif", fill: colors.tud, weight: "regular")

  show heading: set block(above: 2em)

  show link: underline
  show link: set text(fill: colors.tud)

  show raw: set text(font: "Noto Sans Mono", fill: colors.tud, size: 1.1em)

  show raw.where(block: true): it => block(width: 75%, it)

  body
}

#let note-field = {
  set rect(stroke: colors.tud)
  set text(fill: colors.tud)
  rect(
    width: 100%,
    inset: 2em,
    radius: .5em,
    stroke: colors.tud + .5pt,
    {
      place(dy: -2.75em, box(inset: .5em, fill: white, text(
        tracking: .2em,
        weight: "black",
        size: 7pt,
        upper[Notizen],
      )))
      range(14)
        .map(_ => line(
          stroke: colors.tud.lighten(80%) + .5pt,
          length: 100%,
        ))
        .join(v(.5em))
    },
  )
}
