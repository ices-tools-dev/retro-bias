#' auxilliary stock data from ICES SD database
#'
#' Iauxilliary stock data from ICES SD database
#' using the icesSD R packages linking to sd.ices.dk web services
#'
#' @name sid_data
#' @format csv file
#' @tafOriginator ICES
#' @tafYear 2022
#' @tafAccess Public
#' @tafSource script

library(icesTAF)
library(icesSD)
library(dplyr)

msg("getting auxilliary stock data from ICES SD database")
stockinfo <- icesSD::getSD()

current_year <- as.numeric(format(Sys.time(), "%Y"))

stockinfo <-
  stockinfo %>%
  filter(ActiveYear %in% seq(2018, current_year)) %>%
  rename(
    stock = StockKeyLabel,
    year = ActiveYear
  )

# save
write.taf(stockinfo, quote = TRUE)
