# ejercicio 1.1 -----------------------------------------------------------
valor_futuro <- function(captial, interes_anual, meses){
  interes_mensual <- interes_anual/12
  captial * (1 + interes_mensual * meses)
}

# evaluar la función `valor_futuro`
valor_futuro(100000, 12, 24)

valor_futuro(captial = 100000, interes_anual = 12, meses = 24)

# uno puede cambiar el orden de los argumentos
# siempre y cuando se nombren
valor_futuro(interes_anual = 12, meses = 24, captial = 100000)

valor_futuro_im <- function(captial, interes_mensual, meses){
  captial * (1 + interes_mensual * meses)
}

valor_futuro_im(100000, 1, 24)

valor_futuro_im <- function(captial, interes_mensual, meses){
  valorfuturo <- captial * (1 + interes_mensual * meses)
  valorfuturo
}

# ejercicio 1.2 -----------------------------------------------------------
saludo <- function(){
  return("Hola")
}

saludo_custom <- function(nombre){
  paste("Hola", nombre)
}

saludo_custom_default <- function(nombre = "Desconocid(a|o|e)"){
  paste("Hola", nombre)
}

saludo()
saludo("Tulio")

saludo_custom("Juanin") 
saludo_custom()


saludo_custom_default("Bodoque")
saludo_custom_default()




