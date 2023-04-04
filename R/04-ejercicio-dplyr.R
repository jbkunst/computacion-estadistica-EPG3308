library(tidyverse)
library(datos)

glimpse(vuelos)
glimpse(aeropuertos)
glimpse(aerolineas)
glimpse(aviones)
glimpse(clima)

vuelos |> 
  select(contains("_salida"))

vuelos |> 
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))

vuelos |> 
  select(where(is.numeric)) |> 
  summarise(across(everything(), ~ mean(.x, na.rm = TRUE)))


vuelos |> 
  select(where( ~ any(is.na(.x)))) |>
  filter(if_any(everything(), ~ is.na(.x)))
