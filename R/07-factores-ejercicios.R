library(tidyverse)
library(datos)

glimpse(encuesta)

f <- factor(c("a", "a", "b", "a", "c", NA))
f

f <- fct_na_value_to_level(f, "sin dato")
f

# 1 -----------------------------------------------------------------------
encuesta |> 
  select(raza)

encuesta |> 
  pull(raza) |> 
  levels()

draza <- encuesta |> 
  count(raza, .drop = FALSE)

draza

ggplot(draza) +
  geom_col(aes(raza, n))


# 2 -----------------------------------------------------------------------
encuesta |> 
  count(ingreso) |> 
  ggplot() +
  geom_col(aes(n, ingreso))

encuesta$ingreso
levels(encuesta$ingreso)

encuesta |> 
  count(ingreso) |> 
  mutate(ingreso = fct_relevel(ingreso, "No aplica")) |> 
  ggplot() +
  geom_col(aes(n, ingreso))



