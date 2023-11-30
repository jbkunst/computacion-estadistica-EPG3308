# CTRL + SHIFT + C (c de comentario)
# 1. Cargue los paquetes datos, ggplot2 y dplyr.
library(datos)
library(ggplot2)
library(dplyr)

# 2. Ejecute glimpse(vuelos).
glimpse(vuelos)

# 3. Objtenga una muestra de 10.000 registros para responder las preguntas 
# utilizando la funcion sample_n.
# paises2 <- filter(paises, anio == max(anio))
vuelos2 <- sample_n(vuelos, 10000)

# 4. ¿Cuántos filas/columnas tienen los datos?
glimpse(vuelos2)

# 5. ¿Cuántos datos son numéricos?
# Rows: 10,000
# Columns: 19
nrow(vuelos2)
ncol(vuelos2)

# 6. Explore la relación entre distancia y tiempo_vuelo.
ggplot(vuelos2) +
  geom_point(aes(distancia, tiempo_vuelo))
  
distinct(vuelos2, origen, destino)

count(vuelos2, origen, destino)

count(vuelos2, origen, destino, sort = TRUE)

count(vuelos2, origen, destino, distancia, sort = TRUE)

glimpse(arrange(vuelos2, desc(distancia)))

x <- c(10, 10, 20, 340, NA)
sum(x, na.rm = TRUE)
mean(x, na.rm = TRUE)
min(x, na.rm = TRUE)
max(x)
log(x)
is.na(x)


filter(vuelos2, is.na(tiempo_vuelo))
glimpse(filter(vuelos2, is.na(tiempo_vuelo)))

# 7. ¿Qué otras preguntas tienes? ¿Como podríamos obtener QUE vuelo es el más largos?

# 8. Reutiliza el código del ejemplo paso a paso para utilizar la función facet_wrap con estos datos
ggplot(vuelos2) +
  geom_point(aes(distancia, tiempo_vuelo))

glimpse(vuelos2)

ggplot(vuelos2, aes(distancia, tiempo_vuelo)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(vars(mes)) 

vuelos2

ggplot(vuelos2, aes(distancia, tiempo_vuelo)) +
  geom_point(alpha = 0.05, size = 0.5) +
  geom_smooth(aes(color = as.factor(mes)), method = "lm") +
  scale_color_viridis_d()

