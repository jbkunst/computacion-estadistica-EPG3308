# packages ----------------------------------------------------------------
library(tidyverse)
library(datos)
library(skimr)
library(rsample)
library(partykit)
library(rpart)
library(ranger)


# install.packages()
# pacma

# data --------------------------------------------------------------------
glimpse(datos_credito)

datos_credito <- filter(datos_credito, complete.cases(datos_credito))
datos_credito <- janitor::clean_names(datos_credito)
datos_credito <- datos_credito |> 
  mutate(estado = as.numeric(estado == "bueno")) 


glimpse(datos_credito)

class(datos_credito)

skimr::skim(datos_credito)

# split 
class(datos_credito)

datos_credito <- as_tibble(datos_credito)

class(datos_credito)

datos_credito

datos_credito <- datos_credito |> 
  mutate(muestra = if_else(runif(n()) < .2, "tst", "trn"))

datos_credito |> count(muestra)

# datasplit <- initial_split(datos_credito)
# training(datasplit)
# testing(datasplit)

datos_credito_trn <- datos_credito |> 
  filter(muestra == "trn") |> 
  select(-muestra)


# tri ---------------------------------------------------------------------
# m1 <- rpart(estado~ ., data = datos_credito_trn, control = rpart.control(maxdepth = 4))
# plot(m1)
# text(m1)

m2 <- ctree(estado ~ .,  
            data = datos_credito_trn, control = ctree_control(maxdepth = 4))
# plot(m2)


# rl ----------------------------------------------------------------------
m3 <- glm(estado ~ ., data = datos_credito_trn, family = binomial())
m3 <- step(m3)
m3

predict(m3, type = "response")

broom::tidy(m3)


# rf ----------------------------------------------------------------------
m4 <- ranger(estado ~ ., data = datos_credito_trn, probability = TRUE)

# evaluar modelos ---------------------------------------------------------
datos_credito <- datos_credito |> 
  mutate(
    pred_arb = predict(m2, newdata = datos_credito, type = "prob")[, 2],
    pred_rl  = predict(m3, newdata = datos_credito, type = "response"),
    pred_rf  = predict(m4, data = datos_credito, type = "response")$predictions[,2]
  )

datos_credito |> 
  select(muestra, estado, starts_with("pred_")) |> 
  # mutate(estado = as.numeric(estado == "bueno")) |> 
  pivot_longer(cols = starts_with("pred"), names_to = "modelo", values_to = "pred") |> 
  group_by(muestra, modelo) |> 
  summarise(
    auc = Metrics::auc(estado, pred)
  ) |> 
  ungroup() |> 
  pivot_wider(names_from = muestra, values_from = auc)


# vi ----------------------------------------------------------------------
# datos_credito_tst <- datos_credito |> 
#   filter(muestra == "tst")
# 
# datos_credito_tst
# 
# celavi::variable_importance(m4, data = datos_credito_tst)
