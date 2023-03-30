library(tidyverse)
# gapminder ppt

df <- paises |> 
  filter(anio == max(anio))

ggplot(df) + 
  geom_point(aes(esperanza_de_vida, pib_per_capita, size = poblacion, color = continente), alpha = 0.7) +
  scale_color_viridis_d(option = "A") + 
  scale_y_sqrt(name = "GDP per Capita", labels = scales::comma, limits = c(NA, NA)) +
  scale_x_continuous(name = "Esperanza de vida", labels = scales::comma, limits = c(NA, NA)) +
  scale_size(labels = scales::comma, range = c(3, 10), breaks = c(100, 1000, 2000)*1e6) +
  labs(title = "Esperanza de vida y GDP per capita ")

# variable ordinales
# uso variables ordinales
# ord mismo factor, solamente que agregan una dimension de orden entre las 
# categorías
glimpse(diamantes)

diamantes$corte
diamantes$claridad

class(diamantes$claridad)

glimpse(paises)

paises$continente

class(paises$continente)



x <- c("sur", "norte", "norte", "este", "oeste", "norte")
x
class(x)

x1 <- as.factor(x)
x1
class(x1)

# este caso aborda el 95% de los casos
x2 <- factor(x, levels = c("norte", "este", "sur", "oeste"))
x2
class(x2)

x3 <- factor(x, levels = c("norte", "este", "sur", "oeste", "otra_categoria"))
x3
class(x3)

x4 <- factor(x, levels = c("norte", "este", "sur", "oeste"), ordered = TRUE)
x4
class(x4)



# por favor! no hacer, evitar.
diamantes |> 
  mutate(corte_num = as.numeric(corte),
         claridad_num = as.numeric(claridad)) |> 
  summarise(cor(corte_num, claridad_num))


# NA
TRUE
NA
FALSE

edades <- c(26, 30, NA, 33, 33, 45, 37, 50, NA, 32)
class(edades)

