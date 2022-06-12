
library(ggplot2)

# p <- ggplot(data.frame(x = c(0, 100)), aes(x = x)) + 
#   stat_function(fun = function(x) {(100 - x)/2}, aes(color = "Function 1")) + 
#   stat_function(fun = function(x) {(75 - 3*x) }, aes(color = "Function 2")) + 
#   theme_bw() + 
#   scale_color_discrete(name = "Function") + 
#   geom_polygon(
#     data = data.frame(
#       x = c(0, 0, 100, Inf),
#       y = c(0, 50, 0, 0)
#     ),
#     aes(
#       x = x, y = y, fill = "Constraint 1"
#     ),
#     inherit.aes = FALSE, alpha = 0.4
#   ) + 
#   geom_polygon(
#     data = data.frame(
#       x = c(0, 0, 25, Inf),
#       y = c(0, 75, 0, 0)
#     ),
#     aes(
#       x = x, y = y, fill = "Constraint 2"
#     ),
#     inherit.aes = FALSE, alpha = 0.4
#   ) + 
#   scale_fill_discrete(name = "Constraint Set") + 
#   scale_y_continuous(limits = c(0, 100))



p <- 
  ggplot() + 
  labs(title = "Title") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),    # Center title position and size
    plot.subtitle = element_text(hjust = 0.5),            # Center subtitle
    plot.caption = element_text(hjust = 0, face = "italic")# move caption to the left
  ) + 
  xlim(0, 200/25) +
  ylim(0, 200/20) +
  geom_vline(xintercept=c(0)) +
  geom_hline(yintercept=c(0)) +
  theme_bw() + 
  geom_polygon(
      data = data.frame(
        x = c(0, 0, 200/80, Inf),
        y = c(0, 200/20, 0, 0)),
      aes(x = x, y = y, fill = "1: 80x + 20y <= 200"),
      inherit.aes = FALSE, alpha = 0.4) + 
  geom_polygon(
      data = data.frame(
        x = c(0, 0, 200/25, Inf),
        y = c(0, 200/75, 0, 0)),
      aes(x = x, y = y, fill = "2: 25x + 75y <= 200"),
      inherit.aes = TRUE, alpha = 0.4) +
  geom_polygon(
      data = data.frame(
        x = c(0, 0, 3, Inf),
        y = c(0, 3, 0, 0)),
      aes(x = x, y = y, fill = "3: x + y <= 3"),
      inherit.aes = FALSE, alpha = 0.4) + 
  scale_fill_discrete(name = "Constraints") +
  geom_point(aes(x=2, y=2), color = "red") +
  geom_text(aes(x=2, y=2), label="(2, 2)", vjust=-.5, hjust=-.5)

  # scale_y_continuous(limits = c(0, 100))

print(p)