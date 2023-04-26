library(tidyverse)
library(datos)

glimpse(encuesta)


# 1 -----------------------------------------------------------------------
encuesta |> 
  pull(raza) |> 
  levels()

