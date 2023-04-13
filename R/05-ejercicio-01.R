library(tidyverse)
library(datos)


# pregunta 1 --------------------------------------------------------------
# cálculo de la tasa de tuberculosis en cada tabla
tabla1 |> 
  mutate(tasa =  casos/poblacion)

TRUE
!TRUE

tabla2 |> 
  filter(!(pais == "China" & anio == 1999 & tipo == "población")) |> 
  pivot_wider(
    names_from = tipo, 
    values_from = cuenta
  ) |> 
  mutate(tasa =  casos/población)

tabla3 |> 
  separate(
    col = tasa,
    into = c("casos", "población"),
    sep = "/",
    convert = TRUE
  ) |> 
  mutate(tasa =  casos/población) 


tabla4a |> 
  pivot_longer(
    cols = c(`1999`, `2000`),
    names_to = "anio",
    values_to = "casos")

tabla4b |> 
  pivot_longer(
    cols = c(`1999`, `2000`),
    names_to = "anio",
    values_to = "población"
    )

tabla4b |> 
  pivot_longer(
    cols = `1999`:`2000`,
    names_to = "anio",
    values_to = "población"
    )

tabla4b |> 
  pivot_longer(
    cols = where(is.numeric),
    names_to = "anio",
    values_to = "población")


tabla4b |> 
  pivot_longer(
    cols = c(2, 3),
    names_to = "anio",
    values_to = "población")

tabla4b |> 
  pivot_longer(
    cols = 2:3,
    names_to = "anio",
    values_to = "población")

tabla4b |> 
  pivot_longer(
    cols = matches("[0-9]{4}"),
    names_to = "anio",
    values_to = "población")

tabla4b |> select(`1999`, `2000`)
tabla4b |> select(`1999`:`2000`)
tabla4b |> select(where(is.numeric))
tabla4b |> select(matches("[0-9]{4}"))


# pregunta 2 --------------------------------------------------------------
# 
# Para tabla1 graficar la evolución de la
# tasa para cada país. ¿Qué observa?
# 
tabla1t <- tabla1 |> 
  mutate(tasa = casos/poblacion)

tabla1t

# ver1. dejar en default el mapeo definido en ggplot
ggplot(tabla1t, aes(x = anio, y = tasa, color = pais)) +
  geom_line() +
  geom_smooth() 

# ver2. explicitar el mapeo definido en cada capa
ggplot(tabla1t) +
  geom_line(aes(x = anio, y = tasa, color = pais)) +
  geom_smooth(aes(x = anio, y = tasa, color = pais)) 

# ver3. explicitar el mapeo definido en cada capa
ggplot(tabla1t, aes(x = anio, y = tasa, color = pais)) +
  geom_line(aes(x = anio, y = tasa, color = NULL)) +
  geom_smooth() 

# ver1. dejar en default el mapeo definido en ggplot
ggplot(tabla1t, aes(x = anio, y = tasa, color = pais)) +
  geom_line() +
  geom_smooth(aes(color = NULL)) +
  scale_y_continuous(labels = scales::percent) +
  scale_x_continuous(breaks = c(1999, 2000))

ggplot(tabla1t, aes(x = as.character(anio), y = tasa, color = pais, group = pais)) +
  geom_line() +
  geom_smooth(aes(color = NULL)) +
  scale_y_continuous(labels = scales::percent)

# pregunta 3 --------------------------------------------------------------
# Grafique un mapa de calor con 
# los datos relig_income del paquete tidyr.
relig_income
relig_income |>  pivot_longer(cols = 2:11)
relig_income |>  pivot_longer(cols = `<$10k`:`Don't know/refused`)
relig_income |>  pivot_longer(cols = 2:last_col())
relig_income |>  pivot_longer(cols = 2:last_col())
relig_income |>  pivot_longer(cols = matches("0k|refused"))
relig_income |>  pivot_longer(cols = -religion) # :) 😊

niveles <- relig_income |> 
  select(-religion) |> 
  names()

relig_income_tidy <- pivot_longer(relig_income, cols = -religion)
relig_income_tidy

# relig_income_tidy <- relig_income_tidy |> 
#   mutate(name = factor(name, labels = niveles)) 

# library(forcats)
relig_income_tidy <- relig_income_tidy |> 
  mutate(name = fct_inorder(name)) 

ggplot() +
  geom_tile(
    aes(name, religion, fill = value),
    data = relig_income_tidy
    )

# normalizar
relig_income_tidy <- relig_income_tidy |>
  group_by(religion) |> 
  mutate(p = value/sum(value))
  

ggplot() +
  geom_tile(
    aes(name, religion, fill = p),
    data = relig_income_tidy
  )

ggplot(data = relig_income_tidy, aes(name, religion)) +
  geom_tile(aes(fill = p)) +
  geom_text(
    aes(label = scales::percent(p, accuracy = 0.1)),
    color = "white"
    ) +
  scale_fill_viridis_c()

relig_income_tidy |> 
  filter)
ggplot(data = , aes(name, religion)) +
  geom_tile(aes(fill = p)) +
  geom_text(
    aes(label = scales::percent(p, accuracy = 0.1)),
    color = "white"
  ) +
  scale_fill_viridis_c()



"$" > "&"
"r"  > "python"
