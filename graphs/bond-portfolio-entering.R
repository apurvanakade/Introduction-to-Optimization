bond_portfolio_entering <- bond_portfolio +
  annotate("segment",
    x = 0, xend = 0.75, y = 0, yend = 0,
    colour = "black", size = 1.5,
    arrow = arrow()
  ) +
  annotate("segment",
    x = 0.75, xend = 0.6, y = 0, yend = 0.3,
    colour = "black", size = 1.5,
    arrow = arrow()
  ) +
  geom_text(aes(x = 0.35, y = 0.05), label = "x enters, w_2 leaves") +
  geom_text(aes(x = 0.95, y = 0.15), label = "y enters, w_1 leaves")
  
print(bond_portfolio_entering)