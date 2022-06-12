bond_portfolio_solution <- bond_portfolio +
  geom_point(aes(x=0.6, y=0.3), color = "black") +
  geom_text(aes(x=0.6, y=0.3), label="(0.6, 0.3)", vjust=-.5, hjust=0) +
  stat_function(fun = function(x) {(4*0.6 + 3*0.3 - 4*x)/3}, color = "black")

print(bond_portfolio_solution)