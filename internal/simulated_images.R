
# devtools::install_github("johannesbjork/LaCroixColoR")

library(geoR)
library(ggplot2); library(LaCroixColoR)

my_grid <- expand.grid(1:20, 1:100)

size = nrow(my_grid)

params = c(sigmasq = 5, phi = 30)

grf_grid <- grf(n = size, grid = my_grid, cov.pars = params)

my_grid$Var3 <- grf_grid$data

my_cols <- lacroix_palette("Pamplemousse", n = 20, type = "continuous")

ggplot(my_grid, aes(x = Var1, y = Var2)) +
  geom_tile(aes(fill = Var3), col = "white") +
  scale_fill_gradientn(colours = my_cols) +
  theme_void() +
  theme(legend.position = "none")

ggsave("images/grf1.png", height = 250*3, width = 750*3, units = "px", bg = "transparent")
ggsave("images/grf2.png", height = 900*3, width = 250*3, units = "px", bg = "transparent")


