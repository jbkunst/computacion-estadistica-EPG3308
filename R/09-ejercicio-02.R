# paquetes y setup --------------------------------------------------------
library(tidyverse)
library(datos)

fs::dir_create("data/datos_credito_v1")
fs::dir_create("data/datos_credito_v2")

datos_credito <- as_tibble(datos_credito)

datos_credito <- datos_credito |> 
  mutate(id = row_number(), .before = 1) |> 
  sample_frac() |> 
  rename_all(str_to_lower)

datos_credito
