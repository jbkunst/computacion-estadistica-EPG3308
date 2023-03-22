library(tidyverse)
library(scales)

set.seed(123)

legos <- read_csv("https://raw.githubusercontent.com/seankross/lego/master/data-tidy/legosets.csv") |> 
  mutate(year2 = floor(Year/10)*10) |> 
  sample_n(3000)

ggplot(legos) + 
  geom_point(aes(Pieces, USD_MSRP), alpha = 0.25, size = 1) +
  labs(title = "Precio según cantidad de piezas", x = "Piezas", y = "Precio USD")

ggplot(legos) + 
  geom_point(aes(Pieces, USD_MSRP), alpha = 0.25, size = 1) +
  scale_y_sqrt(labels = scales::dollar, limits = c(1, 300)) +
  scale_x_sqrt(labels = scales::comma, limits = c(1, 2000)) +
  labs(title = "Precio según cantidad de piezas", x = "Piezas", y = "Precio USD")

ggplot(legos) + 
  geom_point(aes(Pieces, USD_MSRP, size = Minifigures, color = year2), alpha = 0.5) +
  scale_y_sqrt(labels = scales::dollar, limits = c(1, 300)) +
  scale_x_sqrt(labels = scales::comma, limits = c(1, 2000)) +
  scale_size(name = "Piezas") +
  scale_color_viridis_c(name = "", breaks = c(1970, 1980, 1990, 2000, 2010)) +
  labs(title = "Precio según cantidad de piezas", x = "Piezas", y = "Precio USD")


fmt_dec <- function(x) {
  
  if(as.numeric(x) == 2000) {
    out <- x
  } else {
    out <- paste(str_extract(x, "[0-9]{2}$"), "'s")
  }
  
  out
  
}

fmt_dec <- Vectorize(fmt_dec)

pl <- ggplot(legos, aes(factor(year2), USD_MSRP)) +
  scale_color_viridis_c(breaks = c(1970, 1990, 2010), guide = "none") + 
  scale_size(name = "Piezas") +
  scale_y_continuous(name = "Precio USD", labels = scales::dollar, limits = c(0, 300)) + 
  scale_x_discrete(name = "Década", labels = fmt_dec) +
  labs(title = "Precios por década")

pl +
  geom_point(aes(size = Pieces, color = Year), alpha = 0.5, width = 0.25,
             position = position_jitter(seed = 12)) 

pl +
  geom_point(aes(size = Pieces, color = Year), alpha = 0.5, width = 0.25,
             position = position_jitter(seed = 12)) +
  geom_boxplot(aes(fill = factor(year2)), width = 0.25, alpha = 0.5,
               color = "gray50", outlier.color = "gray50") +
  scale_fill_viridis_d(breaks = c(1970, 1980, 1990, 2000, 2010), name = NULL) 

pl +
  # geom_jitter(aes(size = Pieces, color = Year), alpha = 0.5, width = 0.25) +
  geom_boxplot(aes(fill = factor(year2)), width = 0.25, alpha = 0.85,
               color = "gray50", outlier.color = "gray50") +
  scale_fill_viridis_d(breaks = c(1970, 1980, 1990, 2000, 2010), name = NULL) 

ggplot(legos, aes(factor(year2))) +
  geom_bar(aes(fill = factor(year2)), width = 0.5, alpha = 0.85) +
  scale_fill_viridis_d(guide = "none") +
  scale_y_continuous(labels = comma) +
  labs(
    title = "Cantidad de sets por década",
    x = "Década",
    y = "Sets"
  )
