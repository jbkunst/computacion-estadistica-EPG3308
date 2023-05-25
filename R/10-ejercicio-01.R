library(klassets)
set.seed(123)

df <- sim_xy(n = 1000, x_dist = runif)
df <- dplyr::mutate(df, y = y + 2*sin(5 * x) + sin(10 * x))

plot(df)

plot(fit_linear_model(df))
plot(fit_linear_model(df, order = 3))

plot(fit_regression_tree(df))

plot(fit_regression_tree(df, maxdepth = 0))
plot(fit_regression_tree(df, maxdepth = 1))
plot(fit_regression_tree(df, maxdepth = 2))
plot(fit_regression_tree(df, maxdepth = 3))

plot(fit_loess(df))
plot(fit_loess(df, span = 0.1))
plot(fit_loess(df, span = 0.01))
plot(fit_loess(df, span = 5))


plot(fit_regression_random_forest(df))
plot(fit_regression_random_forest(df, ntree = 1))


plot(fit_mars(df))
