bond_portfolio_simplex <- bond_portfolio +
  annotate("segment",
    x = 0, xend = 0.75, y = 0, yend = 0,
    colour = "black", size = 1.5,
    arrow = arrow()) +
  annotate("segment",
    x = 0.75, xend = 0.6, y = 0, yend = 0.3,
    colour = "black", size = 1.5,
    arrow = arrow())


print(bond_portfolio_simplex)