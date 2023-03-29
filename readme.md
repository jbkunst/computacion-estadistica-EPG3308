EPG3308 - Computación Estadística
================

- <a href="#programa" id="toc-programa">Programa</a>
- <a href="#material" id="toc-material">Material</a>
  - <a href="#slides" id="toc-slides">Slides</a>
  - <a href="#repositorio" id="toc-repositorio">Repositorio</a>
- <a href="#bibliografía" id="toc-bibliografía">Bibliografía</a>
- <a href="#horarios" id="toc-horarios">Horarios</a>
  - <a href="#cátedra" id="toc-cátedra">Cátedra</a>
  - <a href="#ayudantía" id="toc-ayudantía">Ayudantía</a>
- <a href="#evaluaciones" id="toc-evaluaciones">Evaluaciones</a>

## Programa

1.  Introducción a la programación con R.
2.  Análisis Exploratorio de datos.
3.  Manipulación de datos.
4.  Reproductibilidad.
5.  Funciones y programación funcional.
6.  Elementos del modelamiento predictivo.
7.  Aplicaciones.

En particular, las clases están planificadas de la siguiente manera:

<small>

|  Id | Fecha      | Tópico             | Tema                                               | Contenido                                                                                                                                               | Referencias                                                                                                                                      | Info              |
|----:|:-----------|:-------------------|:---------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------|:------------------|
|   1 | 2023-03-15 |                    | Bienvenida                                         | Ambiente de trabajo: R, Rstudio, posit.cloud                                                                                                            |                                                                                                                                                  |                   |
|   2 | 2023-03-22 | AED                | AED ggplot2                                        | Análisis exploratorio de datos, ejemplos. Paquete ggplot2. Capas y gramática de gráficos                                                                |                                                                                                                                                  |                   |
|   3 | 2023-03-29 | AED                | AED ggplot2                                        | Buenas prácticas en la visualización. Estadística descriptiva.                                                                                          |                                                                                                                                                  | on-line           |
|   4 | 2023-04-05 | AED                | Transformación de datos                            | Operador pipe \|\>, %\>%. Paquete dplyr y principales funciones/acciones/verbos para la manipulación de dataframes: select, filter, arrange, summarize. | <https://es.r4ds.hadley.nz/transform.html>                                                                                                       |                   |
|   5 | 2023-04-12 | Manipulación datos | Datos ordenados y datos relacionales               | Paquete tidyr y otras funciones para la manipulacion, pivot_longer, pivot_wider, separate, unite, fill.                                                 | <https://es.r4ds.hadley.nz/datos-ordenados.html> <https://es.r4ds.hadley.nz/datos-relacionales.html>                                             |                   |
|   6 | 2023-04-19 | Manipulación datos | Importación de datos                               | Fuentes de información txt, csv, xlsx, html, API, bbdd, otros. Paquetes readr, rvest, httr, haven                                                       | <https://es.r4ds.hadley.nz/importaci%C3%B3n-de-datos.html>                                                                                       |                   |
|   7 | 2023-04-26 | Manipulación datos | Tipos de datos                                     | stringr: carácteres y expresiones regulares. Forcast: factores. Lubridate: fechas y horas. Nulos, NA.                                                   | <https://es.r4ds.hadley.nz/cadenas-de-caracteres.html> <https://es.r4ds.hadley.nz/factores.html> <https://es.r4ds.hadley.nz/fechas-y-horas.html> |                   |
|   8 | 2023-05-03 |                    |                                                    |                                                                                                                                                         |                                                                                                                                                  | semana-receso     |
|   9 | 2023-05-10 | Comunicar          | Generación de informes automatizados con Rmarkdown | Rmarkdown: Sintaxis. Componentes: YAML, texto, código. Tipos de Documentos/outputs/formatos. HTMLWidgets.                                               | <https://es.r4ds.hadley.nz/r-markdown.html>                                                                                                      |                   |
|  10 | 2023-05-17 | Programar          | Funciones & Programación Funcional                 | Motivación: funciones. Paquete purrr, funciones map, map2, y pmap, walk. Paquete furrr.                                                                 | <https://es.r4ds.hadley.nz/iteraci%C3%B3n.html>                                                                                                  |                   |
|  11 | 2023-05-24 | Modelamiento       | Elementos del modelamiento predictivo              | Definiciones, error, sesgo, varianza. Introducción regresión linear, logística, árbol de decisión.                                                      | <https://es.r4ds.hadley.nz/modelos-conceptos-b%C3%A1sicos.html>                                                                                  |                   |
|  12 | 2023-05-31 | Aplicaciones       | Por definir/tentativo                              | Series de tiempo                                                                                                                                        |                                                                                                                                                  |                   |
|  13 | 2023-06-07 | Aplicaciones       | Por definir/tentativo                              | Simulaciones                                                                                                                                            |                                                                                                                                                  |                   |
|  14 | 2023-06-14 | Aplicaciones       | Por definir/tentativo                              | Modelamiento                                                                                                                                            |                                                                                                                                                  |                   |
|  15 | 2023-06-21 |                    |                                                    |                                                                                                                                                         |                                                                                                                                                  | pueblos-indigenas |
|  16 | 2023-06-28 | Aplicaciones       | Por definir/tentativo                              | Shiny                                                                                                                                                   |                                                                                                                                                  | última-clase      |

</small>

## Material

### Slides

1.  [Bienvenida R Rstudio Copy
    Paste](https://jbkunst.github.io/computacion-estadistica-EPG3308/slides/01-R-Rstudio-copy-paste.html)
2.  [AED Viz
    <code><small>ggplot2</small></code>](https://jbkunst.github.io/computacion-estadistica-EPG3308/slides/02-AED-Viz-ggplot2.html)
3.  [AED Viz Estadística Descriptiva
    <code><small>ggplot2</small></code>](https://jbkunst.github.io/computacion-estadistica-EPG3308/slides/03-AED-Viz-Estadística-Descriptiva-ggplot2.html)

### Repositorio

Repositorio del curso en github
<https://github.com/jbkunst/computacion-estadistica-EPG3308>. Acá
estarán datos, scripts, código fuente de las slides, ayudantías,
evaluaciones, etc.

## Bibliografía

- [R for Data Science](https://r4ds.hadley.nz/). Versión traducida al
  español [R para Ciencia de Datos](https://es.r4ds.hadley.nz/).
- [Tidy Modeling with R](https://www.tmwr.org/).
- [Machine Learning for
  Everyone](https://vas3k.com/blog/machine_learning/).

## Horarios

### Cátedra

Miércoles módulos 6, 7 y 8, desde 17:30 a 20:20 hrs. Sala A301 (Patio de
la Virgen) en el campus Casa Central

### Ayudantía

Sábado desde 10:00 a 11:20 hrs por Alonso Campos, <aacampos3@uc.cl>.

# Evaluaciones

| Tarea | Publicación | Entrega  |
|-------|-------------|----------|
| 1     | 21 abril    | 28 abril |
| 2     | 24 mayo     | 31 mayo  |
| 3     | 20 junio    | 28 junio |
