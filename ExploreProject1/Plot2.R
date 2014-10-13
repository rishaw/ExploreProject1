hpc_sub <- read.csv(file="hpc_sub.csv", 
                     header = TRUE, 
                     sep = ",", 
                     quote = "\"")

# Plot 2 code

plot(hpc_sub$DateTime,
     hpc_sub$Global_active_power,
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l" )

dev.copy(png,
         file = "plot2.png")
dev.off()
