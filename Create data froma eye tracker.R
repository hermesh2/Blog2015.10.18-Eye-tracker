# S Install and load package ----------------------------------------------
needed <- list("ggplot2", "data.table", "png", "jpeg", "grid")
unlist(lapply(needed, FUN = function(x){
  if(!x %in% installed.packages()){
    cat("====================================================\n")
    cat("The following package will be installed ",x, "\n")
    install.packages(x)
    cat("====================================================\n")
  }
  library(x, character.only = T, verbose = F)
  return(paste0( x , " successfully loaded"))
}))
# E Install and load package ----------------------------------------------


# S Create data -----------------------------------------------------------
rm(list = ls())
# Heatmaps for eyetracker
setwd("C:/Users/usuario//Dropbox/Chabi/Blog/Numero 3/") # Put your path
set.seed(123456)


# S Image 1 ---------------------------------------------------------------
# read Image 1
img <- readPNG(source =   "disggust.png") 
# Transform
g <- rasterGrob(image = img, interpolate=TRUE)


# create data 1 per ROI
noise_mean <- 0
noise_sd <- 10e-2 * .5

RightEye_n <- 200 + 2
RightEye_x <- 0.25 + rnorm(n = RightEye_n,mean = noise_mean, sd = noise_sd )
RightEye_y <- 0.65 + rnorm(n = RightEye_n,mean = noise_mean, sd = noise_sd )

LeftEye_n <- 200 + 2
LeftEye_x <- 0.45 + rnorm(n = LeftEye_n,mean = noise_mean, sd = noise_sd )
LeftEye_y <- 0.70 + rnorm(n = LeftEye_n,mean = noise_mean, sd = noise_sd )

Mouth_n <- 150 + 4
Mouth_x <- 0.4 + rnorm(n = Mouth_n, mean = noise_mean, sd = noise_sd )
Mouth_y <- 0.45 + rnorm(n = Mouth_n,mean = noise_mean, sd = noise_sd )

Nouse_n <- 100 + 10
Nouse_x <- 0.38 + rnorm(n = Mouth_n, mean = noise_mean, sd = noise_sd )
Nouse_y <- 0.55 + rnorm(n = Mouth_n,mean = noise_mean, sd = noise_sd )

Noise_n <- 20
Noise_x <- seq(from = 0.38,  to = 1, length.out = Noise_n) + 
  rnorm(n = Noise_n , mean = noise_mean, sd = noise_sd )
Noise_y <- 
  seq(from = 0.55,to =  1, length.out = Noise_n) + 
  rnorm(n = Noise_n , mean = noise_mean, sd = noise_sd )

x <- c(RightEye_x, Mouth_x, Nouse_x, LeftEye_x , Noise_x)  
y <- c(RightEye_y, Mouth_y, Nouse_y, LeftEye_y , Noise_y)

a <- data.table(x,y)
summary(a)
data1 <- a
# E Create data -----------------------------------------------------------