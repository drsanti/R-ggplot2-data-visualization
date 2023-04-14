library(ggplot2)

plot <- ggplot(mpg, aes(displ, hwy, colour = class))
plot <- plot + ggtitle("ggplot2 Data Visualization")
plot <- plot + geom_point(alpha = 0.5, aes(size = 32))        # point geometry
plot <- plot + theme(axis.text = element_text(size = 20))     # x-axis and y-axis
plot <- plot + theme(axis.text.x = element_text(size = 30))   # x-axis
plot <- plot + theme(axis.text.y = element_text(size = 30))   # y-axis
plot <- plot + theme(axis.title = element_text(size = 40))    # Title
plot <- plot + theme(axis.title.x = element_text(size = 20))  # x-axis title
plot <- plot + theme(axis.title.y = element_text(size = 20))  # y-axis title
plot <- plot + theme(plot.title = element_text(size = 40))    # Plot title size
plot <- plot + theme(legend.text = element_text(size = 20))   # Legend text
plot <- plot + theme(legend.title = element_text(size = 20))  # Legend title
plot
