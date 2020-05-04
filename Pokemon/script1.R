library(ggplot2)
library(grid)
library(gridExtra)

pokemon_data <- read.csv("C:/Users/gvign/Downloads/Documents/FIT5147/Project 1/pokemon/pokemon_stats.csv")

summary(pokemon_data)

grp_normal <- subset(pokemon_data, pokemon_data$Legendary=="FALSE")

grp_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE")

grp_base <- 

# type_1_poke <- ggplot(data= pokemon_data, aes(Type.1)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-1") + coord_flip()
# 
# type_2_poke <- ggplot(data= pokemon_data, aes(Type.2)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-2") + coord_flip()
# 
# grid.arrange(type_1_poke, type_2_poke, ncol=2)