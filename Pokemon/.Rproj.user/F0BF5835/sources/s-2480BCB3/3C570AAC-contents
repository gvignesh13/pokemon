#open required packages
library(ggplot2)
library(fmsb)
library(tidyverse)
library(grid)
library(gridExtra)
library(plyr)

#opening dataset and printing summary of dataset
pokemon_data <- read.csv("C:/Users/gvign/Downloads/Documents/FIT5147/Project 1/pokemon/pokemon_stats.csv")
summary(pokemon_data)

#creating independeant datasets and cleaning them to remove incorrect values. There are blank values present in the set which
#will be awarded a value of 0 as they cannot be filled with anything else.
#cleaning base dataset
pokemon_data[,2] <- gsub("^.*?Mega", "Mega", pokemon_data$Name)
pokemon_data[,2] <- gsub("^.*?Primal", "Primal", pokemon_data$Name)
pokemon_data[,2] <- gsub("[^A-za-z ]", "", pokemon_data$Name)
pokemon_data$Type2[is.na(pokemon_data$Type2)] <- 0

# #importing a second file whicg contains evolutionl list for all Pokemon.
# pokemon_species <- read.csv("C:/Users/gvign/Downloads/Documents/FIT5147/Project 1/pokemon/pokemon_species.csv")
# summary(pokemon_species)
# 
# #replacing NA's with 0's. 0 indicates base form
# pokemon_species$evolves_from_species_id[is.na(pokemon_species$evolves_from_species_id)] <- 0
# pokemon_data$evolved_from <- pokemon_species$evolves_from_species_id

#starter pokemon
starter_names <- list(c("Bulbasaur", "Charmander", "Squirtle", "Chikorita", "Cyndaquil", "Totodile", "Treecko", "Torchic", "Mudkip"
              , "Turtwig", "Chimchar", "Piplup", "Snivy", "Tepig", "Oshawott", "Chespin", "Fennekin", "Froakie", "Rowlet",
              "Litten", "Popolio"))
starter_names <- as.data.frame(starter_names, col.names = "Name")
test <- match_df(pokemon_data, starter_names, on = "Name")


#pokemon_starter <-subset(pokemon_data, pokemon_data$Name==starter_names$name)

#splitting main data of Pokemon into sets based on their evolution to better perform operations on them. Each Pokemon has
#a base form and an evolved form or even 2 evolved forms. Certain Pokemon also have Mega Evolution forms based on X or Y
#evolution  stone.
gen_all_normal <- subset(pokemon_data, pokemon_data$Legendary=="FALSE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE))
gen_all_legend <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE))
gen_all_mega <- subset(pokemon_data, grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#splitting based on generations
#generation 1
gen1 <- subset(pokemon_data, pokemon_data$Generation=="1" & pokemon_data$Legendary=="FALSE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE))
gen1_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE) & pokemon_data$Generation=="1")
gen1_mega <- subset(pokemon_data, pokemon_data$Generation=="1" & grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#generation 2
gen2 <- subset(pokemon_data, pokemon_data$Generation=="2")
gen2_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE) & pokemon_data$Generation=="2")
gen2_mega <- subset(pokemon_data, pokemon_data$Generation=="2" & grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#generation 3
gen3 <- subset(pokemon_data, pokemon_data$Generation=="3")
gen3_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE) & pokemon_data$Generation=="3")
gen3_mega <- subset(pokemon_data, pokemon_data$Generation=="3" & grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#generation 4
gen4 <- subset(pokemon_data, pokemon_data$Generation=="4")
gen4_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE) & pokemon_data$Generation=="4")
gen4_mega <- subset(pokemon_data, pokemon_data$Generation=="4" & grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#generation 5
gen5 <- subset(pokemon_data, pokemon_data$Generation=="5")
gen5_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE) & pokemon_data$Generation=="5")
gen5_mega <- subset(pokemon_data, pokemon_data$Generation=="5" & grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#generation 6
gen6 <- subset(pokemon_data, pokemon_data$Generation=="6")
gen6_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE) & pokemon_data$Generation=="6")
gen6_mega <- subset(pokemon_data, pokemon_data$Generation=="6" & grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#generation 7
gen7 <- subset(pokemon_data, pokemon_data$Generation=="7")
gen7_legendary <- subset(pokemon_data, pokemon_data$Legendary=="TRUE" & !grepl("Mega ", pokemon_data$Name, fixed = TRUE) & pokemon_data$Generation=="7")
gen7_mega <- subset(pokemon_data, pokemon_data$Generation=="7" & grepl("Mega ", pokemon_data$Name, fixed = TRUE))

#plotting a distribution of Pokemon types 1 and 2. Legendary Pokemon have been excluded from the plot.
type_1_poke <- ggplot(data= gen_all_normal, aes(Type.1)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-1") + coord_flip()
type_2_poke <- ggplot(data= gen_all_normal, aes(Type.2)) + geom_bar(aes(fill=..count..), alpha=0.8) + theme(axis.text.x = element_text(angle = 90, hjust = 0)) + ggtitle("Distribution Based on Type-2") + coord_flip()
grid.arrange(type_1_poke, type_2_poke, ncol=2)

#basic spider plot
radar_test <- grp_form1[1,6:11]
colnames(radar_test) <- c("HP", "Attack", "Defense", "Sp. Atk", "Sp. Def", "Speed")
radar_test <- rbind( rep(255,6), rep(1,6), radar_test)
radarchart(radar_test, axistype = 1,
           pcol = rgb(171/255, 57/255, 237/255,0.5), pfcol = rgb(171/255, 57/255, 237/255,0.5), plwd = 4,
           cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
           vlcex = 0.8)



