#import "slides-template.typ": *
#import "globals.typ": github-repo-url

#show: dkk-slides.with(
  title: "Vectortiles mit MapLibre",
  author: "Jakob Listabarth",
  date: datetime(year: 2026, month: 5, day: 27, hour: 9, minute: 00, second: 0),
)

#v(1fr)

#title()

#v(1fr)

#context {
  set text(size: .75em)
  document.author.join(",")
  linebreak()
  document.date.display("[day].[month].[year], [hour]:[minute]")
  linebreak()
  [DKK 2026, Dresden]
}

#pagebreak()

= MapLibre und Vectortiles

== Was ist MapLibre?

#image("links/maplibre-logo-for-light-bg.svg", width: 10em)

- open source fork von mapbox-gl-js (December 2020)
- verwendet _WebGL_-Technologie (GPU) #sym.arrow performant
- entwickelt speziell für vectortiles

#pagebreak()

== Was sind Vectortiles?

- Speicherformat von mathematische Beschreibungen (Vektoren) geometrischer Formen (Punkten, Linien, Polygonen) und deren Attributen (Daten) in Kacheln
- beinhalten nur die geometrischen Informationen (und Attribute) und *nicht das Aussehen*.
- Erst der Browser rendert die Daten zu einer Karte basierend auf Stilen.

*Links*
- Beispiel Tiles: #link("https://pmtiles.io/#url=https%3A%2F%2Fdemo-bucket.protomaps.com%2Fv4.pmtiles&map=0.56/0/2.9&showTileBoundaries=true")[Vectortiles]
- Beispiel Raster vs. Vector: https://basemap.de/viewer/

#pagebreak()

#grid(
  columns: 2,
  gutter: 2em,
  [
    === Vorteile von Vectortiles
    - dynamisch und anpassbar
      - Accessibility: Schriftgröße, Kontrast, Farben -- Nutzerpräferenzen
      - Sprache (Internationalisierung)
      - Inhalte (Filter als Teil der Stil-Definition)
    - kontinuierlicher Zoom
    - geringere Speichergröße und weniger komplex #sym.arrow mehr Angebote als Endnutzer*in
  ],
  [
    === Nachteile von Vectortiles
    - Qualitätsverlust: weniger Details, Auflösung, Anti-Aliasing
    - Begrenzt in Bezug auf visuelle Details oder Stile (z. B. keine Schatten, Verläufe etc.)
    - benötigt relative leistungsstarke Geräte (WebGL)
  ],
)

#pagebreak()

= Web Kontext 🕺💃🪩

Wenn das Web eine Tanzfläche ist, dann wäre …


#{
  let parts = (
    (
      icon: "🦴",
      name: "HTML",
      description: [#strong[H]yper#strong[T]ext #strong[M]arkup #strong[L]anguage],
      translation: "das Skelett",
    ),
    (
      icon: "👗",
      name: "CSS",
      description: [#strong[C]ascading #strong[S]tyle #strong[S]heets],
      translation: "das Outift",
    ),
    (icon: "➡️", name: "JavaScript", description: [#strong[J]ava#strong[S]cript], translation: "die Dance-Moves"),
  )
  set par(leading: .5em)
  show grid.cell: it => rect(inset: 1em, stroke: colors.tud.lighten(80%), radius: .5em, width: 100%, height: 100%, it)
  grid(
    columns: 3,
    rows: 65%,
    gutter: 1em,
    ..parts.map(part => {
      rect(stroke: colors.tud, inset: (top: 0.3em, bottom: .7em, x: .5em), radius: .25em, text(size: 2em, align(
        horizon,
        part.icon,
      )))
      part.name
      linebreak()
      text(size: .8em, part.description)
      v(1fr)
      part.translation
    }),
  )
}

#pagebreak()

= Visual Studio Code

- IDE (Integrated Development Environment), ein Texteditor
- bietet viele Funktionen, die die Entwicklung von Software erleichtern (z. B. Syntaxhervorhebung, Autovervollständigung, Debugging-Tools, etc.)
- unterstützt viele Programmiersprachen und Frameworks durch Erweiterungen (Extensions)
- kostenlos und open source

#pagebreak()

= Code-Along: HTML Dokument aufsetzen

#pagebreak()

= *Aufgabe* Startposition der Karte verändern

- Setzen Sie die Startposition der Karte auf die Koordinaten von dem Ort aus dem Sie angereist sind. (Wenn Sie aus Dresden sind, dann wählen Sie den Ort der letzten DKK, Frankfurt).
- Passen Sie ggfs. das Zoom-Level an.

*Hinweis*:
Reihenfolge der Koordinaten: [`Längengrad`, `Breitengrad`]

#pagebreak()

== *Aufgabe* Maputnik

- Passen Sie die Farbe der Elbe an: diese soll für unsere spezifische Karte mehr heraustechen.
- Suchen Sie sich eine Schrift aus und verwenden Sie die Schrift für bestimmte Label

#pagebreak()

== Style aus File einbinden

#pagebreak()

#rect(fill: colors.tud.lighten(90%), radius: 1em, inset: 1em, grid(
  columns: 2,
  gutter: 3em,
  qrcode(github-repo-url, fill: colors.tud, background-fill: white, quiet-zone: 3, height: 5em),
  [
    Den Code sowie das Handout finden Sie auf GitHub: #link(github-repo-url)
  ],
))

