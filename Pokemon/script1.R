#open required packages
library(ggplot2)
library(tidyverse)
library(grid)
library(gridExtra)

#opening dataset and printing summary of dataset
pokemon_data <- read.csv("C:/Users/gvign/Downloads/Documents/FIT5147/Project 1/pokemon/pokemon_stats.csv")
summary(pokemon_data)

#creating independeant datasets and cleaning them to remove incorrect values. There are no missing values present in the
#dataset. There are blank values present in the set which will be awarded a value of 0 as they cannot be filled with anything
#else.

#creating temporary set to store cleaned Names and then replacing the base text with the same. Deleting temeporary set to
#remove unncessary variables at runtime.
elim <- gsub("^.*?Mega", "Mega", pokemon_data$Name)
pokemon_data[,2] <- elim
elim <- gsub("[^A-za-z ]", "", pokemon_data$Name)
pokemon_data[,2] <- elim
remove(elim)

#splitting main data of Pokemon into sets based on their evolution to better perform operations on them. Each Pokemon has
#a base form and an evolved form or even 2 evolved forms. Certain Pokemon also have Mega Evolution forms based on X or Y
#evolution  stone.z
grp_form1 <- subset(pokemon_data, pokemon_data$Legendary=="FALSE")

for (iter in grp_form1$HP){
  if (grp_form1$HP[iter] < grp_form1$HP[iter+1]){
    if (grp_form1$HP[iter] < grp_form1$HP[iter+2])
  }
}

grp_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE")
grp_mega_evols <- subset(pokemon_data, grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#plotting a distribution of Pokemon types 1 and 2. Legendary Pokemon have been excluded from the plot.
type_1_poke <- ggplot(data= grp_form1, aes(Type.1)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-1") + coord_flip()
type_2_poke <- ggplot(data= grp_form1, aes(Type.2)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-2") + coord_flip()
grid.arrange(type_1_poke, type_2_poke, ncol=2)