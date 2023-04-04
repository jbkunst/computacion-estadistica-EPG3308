# install.packages("edgebundle")
library(tidyverse)
library(datos)
library(edgebundle)
library(igraph)

glimpse(vuelos)

glimpse(aeropuertos)

states <- map_data("state")

# data --------------------------------------------------------------------
dedges <- vuelos |> 
  count(from = origen, to = destino, name = "weight")

dedges

dvertices <- aeropuertos |> 
  select(name = codigo_aeropuerto, longitud, latitud) 

dvertices

# filtros para que funcione -----------------------------------------------
dvertices <- dvertices |> 
  distinct(name, .keep_all = TRUE) |> 
  filter(name %in% c(dedges$from, dedges$to))

dvertices

dedges <- dedges |> 
  filter(from %in% dvertices$name) |> 
  filter(to %in% dvertices$name)  

# primer gráfico (bruto) --------------------------------------------------
dedges2 <- dedges |> 
  left_join(dvertices, by = join_by(from == name), suffix = c("", "_from")) |> 
  left_join(dvertices, by = join_by(to   == name), suffix = c("", "_to"))

ggplot() +
  ggraph::theme_graph(background = "black") +
  coord_map() +
  geom_polygon(
    data = states, aes(long, lat, group = group),  col = "gray20", linewidth = 0.1, fill = NA
    ) +
  geom_segment(
    data = dedges2, 
    aes(x = longitud, y = latitud, xend =  longitud_to, yend =  latitud_to),
    col = "gray70", linewidth = 1, alpha = 0.1
    )

# segundo intento (Force directed edge bundling) --------------------------
g <- graph_from_data_frame(dedges, directed = TRUE, vertices = dvertices)

str(g)

xy <- cbind(V(g)$longitud, V(g)$latitud)

verts <- data.frame(x = V(g)$longitud, y = V(g)$latitud)

fbundle <- edge_bundle_force(g, xy, compatibility_threshold = 0.6)

ggplot() +
  ggraph::theme_graph(background = "black") +
  coord_map() +
  geom_polygon(data = states, aes(long, lat, group = group),  col = "gray20", linewidth = 0.1, fill = NA) +
  geom_path(data = fbundle, aes(x, y, group = group), col = "gray70", linewidth = 1, alpha = 0.1) 
