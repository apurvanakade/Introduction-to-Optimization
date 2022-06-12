bond_portfolio_slack <- bond_portfolio +
  geom_text(aes(x = 0.02, y = 0.75), label = "x = 0") +
  geom_text(aes(x = 0.75, y = 0.02), label = "y = 0") +
  geom_text(aes(x = 1, y = 0.125), label = "w_1 = 0") +
  geom_text(aes(x = 0.25, y = 1.1), label = "w_2 = 0") +
  geom_text(aes(x = 0.65, y = 0.4), label = "w_3 = 0")
  
print(bond_portfolio_slack)