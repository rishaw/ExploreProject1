hpc_sub <- read.csv(file="hpc_sub.csv", 
                     header = TRUE, 
                     sep = ",", 
                     quote = "\"")

# Plot 1 code

par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))
with (hpc_sub, {
  hist(Global_active_power,
       breaks = 16, 
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)",
       col = "red",
       border = "black")
})
  
dev.copy(png,
         file = "plot1.png")
dev.off()
