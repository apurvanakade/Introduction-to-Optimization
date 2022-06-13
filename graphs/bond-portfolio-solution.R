library(ggplot2)

b <- c(3.6, 1.5, 1)
A <- matrix(c(3, 6, 2, 1, 1, 1), nrow = 3, byrow = TRUE)
labels <- c(
  paste(1, ":", A[1, 1], "x + ", A[1, 2], "y <=", b[1], sep = " "),
  paste(2, ":", A[2, 1], "x + ", A[2, 2], "y <=", b[2], sep = " "),
  paste(3, ":", A[3, 1], "x + ", A[3, 2], "y <=", b[3], sep = " ")
)

bond_portfolio <- ggplot() +
  xlim(0, max(b / A[, 1])) +
  ylim(0, max(b / A[, 2])) +
  geom_vline(xintercept = c(0), alpha = 0.4) +
  geom_hline(yintercept = c(0), alpha = 0.4) +
  theme_bw() +
  geom_polygon(
    data = data.frame(
      x = c(0, 0, b[1] / A[1, 1]),
      y = c(0, b[1] / A[1, 2], 0)),
    aes(x = x, y = y, fill = labels[1]),
    inherit.aes = FALSE, alpha = 0.4) +
  geom_polygon(
    data = data.frame(
      x = c(0, 0, b[2] / A[2, 1]),
      y = c(0, b[2] / A[2, 2], 0)),
    aes(x = x, y = y, fill = labels[2]),
    inherit.aes = FALSE, alpha = 0.4) +
  geom_polygon(
    data = data.frame(
      x = c(0, 0, b[3] / A[3, 1]),
      y = c(0, b[3] / A[3, 2], 0)),
    aes(x = x, y = y, fill = labels[3]),
    inherit.aes = FALSE, alpha = 0.4) +
  guides(fill = guide_legend(title = "Constraints"))

bond_portfolio_solution <- bond_portfolio +
  geom_point(aes(x=0.6, y=0.3), color = "black") +
  geom_text(aes(x=0.6, y=0.3), label="(0.6, 0.3)", vjust=-.5, hjust=0) +
  stat_function(fun = function(x) {(4*0.6 + 3*0.3 - 4*x)/3}, color = "black")

print(bond_portfolio_solution)
