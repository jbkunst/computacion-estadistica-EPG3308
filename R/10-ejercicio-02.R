library(klassets)
library(tidyverse)

data("idyob10k")

idyob10k

plot(idyob10k)

idyob10k

library(ranger)

modrf <- ranger(y ~ x, data = idyob10k, num.trees = 1000)
modrf

dfval <- tibble(
  x = c(18935022, 28093224, 15180707,  14500000),
  z = c(1,2,3,4)
)

dfval


dfval <- dfval |> 
  mutate(
    ypred = predict(modrf, data = dfval)$predictions
  )

dfval |> 
  mutate(edad = year(Sys.Date()) - ypred)




