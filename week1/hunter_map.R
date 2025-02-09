if (!require("leaflet")) install.packages("leaflet")
if (!require("tidyverse")) {
  install.packages("tidyverse")
}
library(tidyverse)
library(rvest)
library(leaflet)

pAGE <- read_html("https://en.wikipedia.org/wiki/Hunter_College")
pAGE |>
  html_element(".latitude") |>
  html_text2() -> HunterLatitude
hunter_longitude <- pAGE |>
  html_element(".longitude") |>
  html_text2()


HunterLatitude <- sum(as.numeric(strsplit(
  HunterLatitude,
  "[^0123456789]"
)[[1]]) * (1 / 60)^(0:2), na.rm = TRUE)
hunter_longitude <- sum(as.numeric(strsplit(hunter_longitude, "[^0123456789]")[[1]]) *
                          (1 / 60)^(0:2), na.rm = TRUE)

leaflet() %>%
  addTiles() %>%
  setView(-hunter_longitude, HunterLatitude, zoom = 17) %>%
  addPopups(-hunter_longitude, HunterLatitude, "Look! It's <b>Hunter College</b>!")
