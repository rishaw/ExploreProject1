hpc_sub <- read.csv(file="hpc_sub.csv", 
                     header = TRUE, 
                     sep = ",", 
                     quote = "\"")

# Plot 3 code

plot(x = hpc_sub$DateTime,
     y = hpc_sub$Sub_metering_1,
     main = "",
     ylab = "Energy Sub Metering",
     xlab = "",
     col = "black",
     type = "l" )
lines(x = hpc_sub$DateTime,
      y = hpc_sub$Sub_metering_2,
      col = "red",
)
lines(x = hpc_sub$DateTime,
      y = hpc_sub$Sub_metering_3,
      col = "blue",
)

dev.copy(png,
         file = "plot3.png")
dev.off()
