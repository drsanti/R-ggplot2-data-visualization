
library(tidyr)
library(ggplot2)
library(dplyr)
library(reshape)

filePath = "/Users/santi/Desktop/AML2.csv"
data = read.csv(filePath)


df <- data %>% pivot_longer(cols = c("MP", "LaSota"), names_to = "Virus", values_to = "Fold_Enrichment")

df %>% ggplot(aes(x=Virus, y=KEGG_Pathway, fill=Fold_Enrichment)) +
  geom_tile()


#-------------------------------------------------------------------------------


dfMP <- data.frame(Pathway=data[,1], Factor=data[,2], Virus=rep("MP", nrow(data)))
dfLa <- data.frame(Pathway=data[,1], Factor=data[,3], Virus=rep("LaSota", nrow(data)))

ggplot() + 
  geom_point(data = dfMP, aes(x = Factor, y = Pathway, group=1, fill=Virus, color=Virus), alpha=0.5, size=3) +
  geom_point(data = dfLa, aes(x = Factor, y = Pathway, group=1, fill=Virus, color=Virus), alpha=0.5, size=3)


#-------------------------------------------------------------------------------

dfMerge <- bind_rows(dfMP, dfLa)

ggplot(data = dfMerge, aes(x = factor(Pathway), y = Factor, fill = Virus)) + 
  geom_bar(stat = "identity", position = "dodge", alpha=0.7)+
  coord_flip()

#-------------------------------------------------------------------------------

ggplot(data = dfMerge, aes(x = factor(Pathway), y = Factor, fill = Virus)) + 
  geom_bar(stat = "identity", position = "stack", alpha=0.8)+
  coord_flip()+
  theme_bw()

#-------------------------------------------------------------------------------

