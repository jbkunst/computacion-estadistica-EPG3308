# paquetes y setup --------------------------------------------------------
library(tidyverse)
library(datos)

fs::dir_create("data/datos_credito")
# fs::dir_create("data/datos_credito_v2")

datos_credito <- as_tibble(datos_credito)

datos_credito <- datos_credito |> 
  mutate(id = row_number(), .before = 1) |> 
  sample_frac() |> 
  rename_all(str_to_lower)


# v1 separar los datos y guardarlos en archivos independientes ------------
# (omitamos NA por simplicidad)
trabajos <- datos_credito |> 
  count(trabajo) |> 
  pull(trabajo) |> 
  na.omit() |> 
  as.character()

# walk(trabajos, genere el data set y lo guarde)

map(trabajos, function(t = "freelance"){
  
  message(t)
  
  daux <- datos_credito |> 
    filter(trabajo == t)
  
  fn <- str_glue("data/datos_credito/dc_v1_{ t }.csv")
  
  write_csv(daux, fn)
 
})

# otra opcion de v1
walk(trabajos, function(t = "freelance"){
  
  cli::cli_progress_step("Trabajo: { t }")
  
  daux <- datos_credito |> 
    filter(trabajo == t)
  
  fn <- str_glue("data/datos_credito/dc_v1_{ t }.csv")
  
  write_csv(daux, fn)
  
})


# v2 para serparar archivos por columnas ----------------------------------
nombres <- names(datos_credito)
nombres

grupos <- split(nombres, ceiling(seq_along(nombres)/4))
grupos

walk(grupos, function(g = grupos[[3]]){
  
  cli::cli_progress_step("Grupo: { g }")
  
  variables <- unique(c("id", g))
  
  daux <- datos_credito |> 
    select(all_of(variables))
  
  g2 <- str_c(g, collapse = "_")
  
  fn <- str_glue("data/datos_credito/dc_v2_{ g2 }.csv")
  fn 
  
  write_csv(daux, fn)
  
})


# leer cada version de archivo --------------------------------------------
# v1
dc1 <- fs::dir_ls("data/datos_credito/") |> 
  str_subset("_v1_") |> 
  map(read_csv) |> 
  reduce(bind_rows)

# v2
dc2 <- fs::dir_ls("data/datos_credito/") |> 
  str_subset("_v2_") |> 
  map(read_csv) |> 
  reduce(full_join)

# idea markdown -----------------------------------------------------------
walk(trabajos, function(t = "freelance"){
  
  cli::cli_progress_step("Trabajo: { t }")
  
  daux <- datos_credito |> 
    filter(trabajo == t)
  
  fn <- str_glue("rmarkdown/informe_{ t }.html")
  
  rmarkdown::render("informe.Rmd", fn, params = list(tr = t))
  
})
