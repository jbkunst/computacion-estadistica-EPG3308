library(stringr)
str_view <- purrr::partial(stringr::str_view, html = TRUE, match = NA)

# retomando patrones simples ----------------------------------------------
x <- c("eSta", 
       "  es    uña",
       "cadena  de carácteres   ", 
       "esto\ttambién",
       "1 o 2 palabras. seradas",
       "separado se escribe todo junto",
       "todo junto se escribe separado",
       "72! s.", 
       "un millón! 1.000.000",
       NA)

str_view(x)
str_view(x, "a")

# ^ -----------------------------------------------------------------------
# ^ indica inicio de un string
# ej: queremos matchear solo las "e" que estén al comienzo

str_view(x, "e")
str_view(x, "^e")

# $ -----------------------------------------------------------------------
# ^ indica final del string
# ej: la última letra es es `a`.

str_view(x, "a")
str_view(x, "a$")

# | -----------------------------------------------------------------------
# | es para indicar o
# ej: matchar esto o eSto

str_view(x, "est|eSt")
str_view(x, "e(s|S)t")


# . -----------------------------------------------------------------------
# . indica cualquier caracter (incluye espacios)
# ej: queremos matchear el primer/ultimo caracter.

str_view(x, ".")
str_view(x, "\\.")
str_view(x, "^.")
str_view(x, ".$")

# {} ----------------------------------------------------------------------
# {} Sirven para dar largo del patrón
# ej: Primero tres carácteres.

str_view(x, ".{3}")
str_view(x, "^.{3}")
str_view(x, " {2}")
str_view(x, " {3}")
str_view(x, ".{2,3}")


# \d ----------------------------------------------------------------------
# \d matchea digitos

str_view(x, "\\d")
str_view(x, "\\d{2}")
str_view(x, "\\d{1,}") # 1 o más


# \w ----------------------------------------------------------------------
# \w matchea caracteres sin considerar espacios ni puntos

str_view(x, "\\w")
str_view(x, "\\w+")
str_view(x, "\\w{3,}") # palabras de 3 o más letras

# ej: Todo lo que aparezca antes del primer espacio
str_view(x, "^\\w+")
str_view(x, "^( )*?\\w+")

# usos cotidianos de regex ------------------------------------------------
dir(recursive = TRUE)
dir(pattern = "\\.Rmd$", recursive = TRUE)
dir(pattern = "\\.R$", recursive = TRUE)
dir(pattern = "\\.csv$", recursive = TRUE)

# ejemplo email -----------------------------------------------------------
xs <- "Por favor, envíame un correo electrónico a juan.perez@gmail.com con la información que necesito.
Para contactarnos, envía un correo electrónico a info@miempresa.com.
¿Te has registrado en nuestra página web? Si es así, revisa tu correo electrónico para activar tu cuenta.
Me encantaría trabajar en esa empresa. ¿Podrías darme el correo electrónico del departamento de recursos humanos?
Recibí un correo electrónico de soporte@miempresa.com diciéndome que están trabajando en mi problema.
¿Podrías por favor enviar tus preguntas por correo electrónico a preguntas@nuestraempresa.com?
Hola, me llamo Ana y mi correo electrónico es ana.barrera@proveedor.com.
Acabo de recibir un correo electrónico de confirmación de mi pedido en ventas@tiendaonline.com.
Si tienes algún problema técnico, envía un correo electrónico a soporte_tecnico@miempresa.com.
Por favor, no respondas a este correo electrónico. Para ponerte en contacto con nosotros, utiliza nuestro formulario de contacto en línea o envía un correo electrónico a contacto@sitio.com.
¿Has recibido el correo electrónico con la información de la reunión de mañana? Si no lo has visto, revisa tu bandeja de spam o envía un correo electrónico a reuniones@miempresa.com."

xs <- str_split_1(xs, "\n")

str_view(xs)
str_view(xs, "[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}")

# ejemplo direcciones -----------------------------------------------------
library(tidyverse)

data <- tibble(
  direccion = c(
    "Bdo OHiggins #4506, Santiago",
    "Avenida Providencia #123, Providencia",
    "Av. Siempre Viva #744",
    "Riverside número 228",
    "Riverside número 432, EstatieneComuna",
    "Calle Elm n° 1344"
  )
)

data

data <- data |> 
  separate(
    direccion,
    c("direccion", "comuna"),
    sep = ","
  ) 
data

data |> 
  mutate(numero = str_extract(direccion, " "))

data <- data |> 
  separate(
    direccion,
    c("calle", "numero"),
    sep = "#|número|numero|n°"
    # sep = "[^ ]*$"
  )
data

data <- data |> 
  mutate(
    comuna = str_trim(comuna),
    numero = as.numeric(str_trim(numero)),
    calle  = str_trim(calle),
    tipo = str_extract(calle, "Avenida|avenida|Av.|Calle|Psje")
  )

data

