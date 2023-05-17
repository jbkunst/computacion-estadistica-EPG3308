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