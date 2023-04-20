library(tidyverse)
library(dbplyr)
library(DBI)
library(RMariaDB)

# hostname: relational.fit.cvut.cz
# port: 3306
# username: guest
# password: relational

con <-  dbConnect(
  RMariaDB::MariaDB(),
  host = "relational.fit.cvut.cz",
  db = "employee",
  user = "guest",
  password = "relational",
  port = 3306
)

con

DBI::dbListTables(con)

dempleados <- tbl(con, "employees")
dsalarios  <- tbl(con, "salaries")
dcargos    <- tbl(con, "titles")


dsalarios |> 
  summarise(
    nregistros = n(),
    empleados_distintos = n_distinct(emp_no)
  )

dsalarios |> 
  count(emp_no) |> 
  arrange(desc(n))

dsalarios |> 
  filter(emp_no == 298914) |> 
  collect()

dcargos |> 
  filter(emp_no == 298914) |> 
  collect()

dcargos_unicos <-  dcargos |> 
  group_by(emp_no) |> 
  # filter(to_date == max(to_date))
  filter(year(to_date) == 9999) 

dsalarios_unicos <-  dsalarios |> 
  group_by(emp_no) |> 
  # filter(to_date == max(to_date))
  filter(year(to_date) == 9999) 


data_resumida <- dempleados |> 
  left_join(dcargos_unicos, by = join_by(emp_no)) |> 
  left_join(dsalarios_unicos, by = join_by(emp_no)) |> 
  filter(!is.na(title)) |> 
  group_by(gender, title) |> 
  summarise(
    n = n(),
    salario_min = min(salary),
    salario_mnm = mean(salary),
    salario_max = max(salary)
  ) |> 
  show_query() |> 
  collect()

data_resumida

nm <- scales::comma(as.numeric(sum(data_resumida$n)))

subt <- str_glue("Una muestra de {nm}")

ggplot(data_resumida, aes(gender, salario_mnm/1e3, group = title, color = title)) +
  geom_line() +
  geom_point() + 
  ggrepel::geom_text_repel(
    aes(label = title),
    data = filter(data_resumida, gender == "M")
    ) +
  scale_color_viridis_d() +
  scale_y_continuous(labels = scales::dollar_format(suffix = "M")) +
  theme_minimal() +
  labs(
    title = "asdas",
    x = NULL,
    y = NULL,
    subtitle = subt, 
    color = NULL,
    caption = "Lo que nadie lee, y revelevante"
  ) +
  theme(legend.position = "none")

