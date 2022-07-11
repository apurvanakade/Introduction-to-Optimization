library(ggplot2)

labels <- c(
  "1 : x + 2y <= 6",
  "2 : -x <= -1",
  "2 : -y <= -2"
)

auxiliary_lp <- ggplot() +
  xlim(0, 6) +
  ylim(0, 3) +
  geom_vline(xintercept = c(0), alpha = 0.4) +
  geom_hline(yintercept = c(0), alpha = 0.4) +
  theme_bw() +
  geom_polygon(
    data = data.frame(
      x = c(0, 0, 6),
      y = c(0, 3, 0)),
    aes(x = x, y = y, fill = labels[1]),
    inherit.aes = FALSE, alpha = 0.4) + 
  geom_polygon(
    data = data.frame(
      x = c(1, 1, 6, 6),
      y = c(0, 3, 3, 0)),
    aes(x = x, y = y, fill = labels[2]),
    inherit.aes = FALSE, alpha = 0.4) +  
geom_polygon(
    data = data.frame(
      x = c(0, 6, 6, 0),
      y = c(2, 2, 3, 3)),
    aes(x = x, y = y, fill = labels[3]),
    inherit.aes = FALSE, alpha = 0.4) +
  guides(fill = guide_legend(title = "Constraints")) +
  geom_point(aes(x=1, y=2), color = "red") +
  geom_text(aes(x=1, y=2), label="Start of Phase II", vjust=2.5, hjust=0.65, color = "red") +
  geom_point(aes(x=2, y=2), color = "black") +
  geom_text(aes(x=1, y=2), label="Optimal solution", vjust=-1.5, hjust=-0.5)

print(auxiliary_lp)
