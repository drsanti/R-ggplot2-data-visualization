
library(tidyr)
library(ggplot2)
library(dplyr)
library(reshape)

## Set working directory. The directory contains the input file(s)
## Change the line below based on your system.
setwd("/Users/santi/Desktop/R-ggplot2-data-visualization")

## Target file name
file_name <- "data.csv"

## Get working directory
current_dir <- getwd()

## Path to target file
file_path <- paste(current_dir, file_name, sep = "/")


## Check file existing
if(!file.exists(file_path))
{
  stop(c("The target file ", file_path, " not exists"))
  return(-1)
}

## Read the csv data
data <- read.csv(file_path)

#-------------------------------------------------------------------------------

## Reshape the data format from wide format to long format and change the column names
df <- data %>% pivot_longer(cols = c("MP", "LaSota"), names_to = "Virus", values_to = "Fold_Enrichment")

#-------------------------------------------------------------------------------

## Tile plot
tile_plot <- df %>% ggplot(aes(x = Virus, y = KEGG_Pathway, fill = Fold_Enrichment))
tile_plot <- tile_plot + geom_tile()
tile_plot

#-------------------------------------------------------------------------------

## Create datasets for the two viruses separately
dfMP <- data.frame(Pathway=data[,1], Factor=data[,2], Virus=rep("MP", nrow(data)))
dfLa <- data.frame(Pathway=data[,1], Factor=data[,3], Virus=rep("LaSota", nrow(data)))

#-------------------------------------------------------------------------------

## Point plot
point_plot <- ggplot()
point_plot <- point_plot + geom_point(data = dfMP, aes(x = Factor, y = Pathway, group=1, fill=Virus, color = Virus), alpha = 0.5, size = 3)
point_plot <- point_plot + geom_point(data = dfLa, aes(x = Factor, y = Pathway, group=1, fill=Virus, color = Virus), alpha = 0.5, size = 3)
point_plot

#-------------------------------------------------------------------------------

## Create a dataset for bar plots
dfMerge <- bind_rows(dfMP, dfLa)

#-------------------------------------------------------------------------------

## Dodge bar plot
bar_plot <- dfMerge %>% ggplot(aes(x = factor(Pathway), y = Factor, fill = Virus))
bar_plot <- bar_plot + geom_bar(stat = "identity", position = "dodge", alpha=0.7)
bar_plot <- bar_plot + coord_flip()
bar_plot

#-------------------------------------------------------------------------------

## Stack bar plot
bar_plot <- dfMerge %>% ggplot(aes(x = factor(Pathway), y = Factor, fill = Virus))
  geom_bar(stat = "identity", position = "stack", alpha=0.8)
  coord_flip()
  theme_bw()

#-------------------------------------------------------------------------------

