library(ggplot2)
library(ggridges)
library(dplyr)
library(rstudioapi) # get working dir

# set working directory
current_file <- rstudioapi::getActiveDocumentContext()$path
current_dir <- dirname(current_file)
setwd(current_dir)
cat("Current working directory set to:", getwd(), "\n")

data <- read.csv("IOWlinepoints.csv")

head(data)

names(data)[1]<-"ID"
names(data)[2]<-"z"
names(data)[3]<-"Lon"
names(data)[4]<-"Lat"

joy <- ggplot(data,
              aes(x = Lon, y = Lat, group =Lat, height = z))+
  geom_density_ridges(stat = "identity",
                      scale = 20,
                      fill = "black",
                      color ="white",
                      rel_min_height = 0.001,
                      linewidth=0.2)+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill="black"),
        axis.line = element_blank(),
        axis.text.x = element_blank(),
        plot.background = element_rect("black"),
        axis.title.x = element_blank(),
        axis.text.y = element_blank(),
        axis.title.y = element_blank())
joy

ggsave("joyplot_iow.png", width = 2560, height = 1440, units = "px")