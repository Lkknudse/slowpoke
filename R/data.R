#' Load bundled Pokémon TCG dataset
#'
#' @return A tibble containing Pokémon TCG data.
#' @export

.cache <- new.env(parent = emptyenv())

load_data <- function() {
  if (!exists("dat", envir = .cache)) {
    path <- system.file("extdata", "pokemon_cards.parquet", package = "slowpoke")
    .cache$dat <- arrow::read_parquet(path,
                                      col_select = c("name", "flavorText", "rarity", "series", "artist"))
  }
  .cache$dat
}
