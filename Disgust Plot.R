# Blog2015.10.18-Eye-tracker
# Plot data 1
p <-
  ggplot(a, aes(x = x, y =y)) +
  annotation_custom(g, # Image
                    xmin= -0.15, # Coordinates to represent the image
                    xmax= 1.25,
                    ymin= -0.25,
                    ymax= 1.25) +
  stat_density2d(data= a, aes(x= x, y=y, fill = ..level.., alpha = ..level..),
                 size= 10, bins= 50, geom='polygon') +
  geom_point(data= a, aes(x=x, y=y),  # coordinates       
             color="black", # Color point
             position=position_jitter(w=0.01,h=0.01), # Point plot desviation
             alpha=0.5) + # Point transaparecen
  
  theme_bw() + # Kind of theme. I strongly recomend theme_bw

  scale_fill_gradient( low = "green",   # Lowest color value
                       high = "red", # High color value
                       limits = c(0, 15) , # Limits for coloring
                       breaks = c(0, 3, 5, 10)  # Breaks in the color legend
                      ) +
  scale_alpha_continuous(range=c(0.0, 1) , guide = FALSE) + # You can play with the range to show a better image. Range belongs to [0, 1] interval
  xlim(0, 1) + # Control lim for x-axe
  ylim(0, 1) # Control lim for y-axe
print(p)

jpeg(filename = "disgust with density plot.jpeg", res = 100,
     width = 18, height =10 ,units =  "cm")
print(p)
dev.off()
# E Image 1 ---------------------------------------------------------------
