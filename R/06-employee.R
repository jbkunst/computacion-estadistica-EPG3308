
# https://relational.fit.cvut.cz/dataset/Employee
# hostname: relational.fit.cvut.cz
# port: 3306
# username: guest
# password: relational
con <-  dbConnect(
  RMariaDB::MariaDB(),
  host = "relational.fit.cvut.cz",
  user = "guest",
  password = "relational",
  port = 3306,
  db = "employee"
)

con

DBI::dbListTables(con)

tbl(con, "employees")

tbl(con, "salaries")

tbl(con, "titles")
