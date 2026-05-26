#import "@preview/touying:0.7.3": *
#import themes.simple: *
#import "globals.typ": colors

#let dkk-slides = (title: none, author: none, date: none, body) => {
  // Custom styling function for section slides
  let custom-section-slide(level: 1, body) = {
    touying-slide-wrapper(self => {
      // 1. Modify the page background just for section slides
      let self = utils.merge-dicts(self, config-page(fill: colors.tud))

      // 2. Format the heading text and content
      let slide-body = {
        set align(center + horizon)
        set text(fill: white, font: "Noto Serif", size: 3.5em)
        show text: it => emph(it)
        utils.display-current-heading(level: level)

        body
      }

      touying-slide(self: self, slide-body)
    })
  }

  show: simple-theme.with(
    primary: colors.tud,
    footer-left: image("links/TUD_Logo_RGB_kurz_blau.svg", height: 1em),
    config-page(
      margin: (x: 5%, y: 15%),
      header-ascent: 50%,
      footer-descent: 50%,
    ),
    config-info(
      title: title,
      author: author,
      date: date,
    ),
    config-common(
      new-section-slide-fn: custom-section-slide,
    ),
  )

  set text(
    font: "Noto Sans",
    size: 20pt,
    lang: "de",
  )

  show title: set text(font: "Noto Serif", weight: "light", size: 1.25em, style: "italic", fill: colors.tud)

  show heading: set text(font: "Noto Serif", fill: colors.tud, weight: "regular")

  show heading: set block(below: 1.5em)

  show link: set text(fill: colors.tud)

  show raw: set text(font: "Noto Sans Mono", fill: colors.tud, size: 1.2em)

  show link: it => {
    if type(it.dest) == str and it.dest.starts-with("https://") {
      // Apply styling here
      underline(it)
    } else {
      // Leave internal links or other protocols untouched
      it
    }
  }

  show outline.entry.where(level: 1): it => {
    link(
      it.element.location(),
      it.indented(it.prefix(), it.body()),
    )
  }

  title-slide({
    v(1fr)
    std.title()
    v(1fr)
    context {
      set text(size: .75em)
      document.author.join(",")
      linebreak()
      document.date.display("[day].[month].[year]")
      linebreak()
      [\74. DKK, Dresden]
    }
  })

  body
}

#let hint = it => rect(
  fill: colors.tud.lighten(95%),
  radius: .5em,
  inset: 1em,
  {
    strong("Hinweis ")
    it
  },
)
)

#let task = box(
  stroke: colors.tud + 3pt,
  radius: 1em,
  inset: .4em,
  baseline: .3em,
  {
    set text(size: .75em, font: "Noto Serif", fill: colors.tud)
    emph[Aufgabe]
  },
)
