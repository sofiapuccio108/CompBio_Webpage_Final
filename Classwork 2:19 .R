### Class Notes 2/19 ### 
## Sofia Puccio #3 GGPLOT 

# required packages for this scirpt 
library(ggplot2)
library(patchwork)
library(ggthemes)
install.packages("patchwork")

# load our dataset 
d <- mpg

# our first call to ggpolot: histogram 
ggplot(data = d) + 
  aes(x = hwy) + 
  geom_histogram(fill = "blue")

# density plot 
ggplot(data = d) + 
  aes(x = hwy) + 
  geom_density(fill = "mintcream")

# scatterplot 
ggplot(data = d) + 
  aes(x = displ, y - hwy) + 
  geom_point() + 
  geom_smooth(method = "lm", col = "red")

