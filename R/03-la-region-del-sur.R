library(tidyverse)

datosq <- readxl::read_excel("data/muestrame_los_numeros.xlsx")

glimpse(datosq)

# observar el orden de region en la siguiente tabla
datosq |> 
  count(region)

datosq <- datosq |> 
  mutate(region = factor(region, levels = c("sur", "norte", "este", "oeste")))

glimpse(datosq)

# observar _nuevamente_ el orden de region
datosq |> 
  count(region)

datosq <- datosq |>
  mutate(
    es_sur = ifelse(region == "sur", 1, 0),
    q      = as.numeric(str_remove(cuarto, "Q"))
    ) 

glimpse(datosq)

# grafico 1
ggplot(datosq) +
  geom_line(aes(x = q, y = valor))

ggplot(datosq) +
  geom_line(aes(x = cuarto, y = valor))

datosq

ggplot(datosq) +
  geom_line(aes(x = q, y = valor))

ggplot(datosq) +
  geom_line(aes(x = q, 
                y = valor,
                group = region,
                color = region
              ))


ggplot(datosq) +
  geom_line(aes(
    x = cuarto,
    y = valor,
    group = region,
    color = es_sur,
    size = es_sur
  ),
  lineend = "round") +
  scale_color_gradient(low = "#00000020", high = "darkred") +
  scale_size_continuous(range = c(1.5, 3)) +
  scale_y_continuous(position = "right", limits = c(70, 320)) +
  theme_minimal(base_size = 7) +
  theme(legend.position = "none") +
  labs(title = "Sur exhibe el mayor crecimiento con un 234% anual",
       x = NULL,
       y = NULL)
