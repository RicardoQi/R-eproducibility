library("dplyr")
Mydata <- read.csv("C:\\Users\\qi199\\Documents\\R-eproducibility\\InputData\\FallopiaData.csv")
Mydata1 <- subset(Mydata, Total>60)
Mydata2 <- subset(Mydata1, select = c(Total, Taxon, Scenario, Nutrients)) ##Showing only 4 columns
Mydata2$TotalG <- Mydata2$Total / 1000 
Mydata2 <- Mydata2[,c(5,2:4)] 

ctm <- function() {
  var1 <- readline("Enter the sequence of numbers separated by comma : ")
  var2 <- readline("Enter the operation : ")
  var1 <- strsplit(var1,',')
  var1 <- as.numeric(unlist(var1))
  
  avg <- mean(var1)
  ttl <- sum(var1)
  cnt <- table(var1)
  
  if (var2 == "Average") {
    print(avg)
  } else if (var2 == "Sum") {
    print(ttl)
  } else if (var2 == "Observations") {
    print(cnt)
  } else {
    print("Error: Wrong operation!")
  }
  
}
ctm()



Mydata2 %>% count(Taxon)

aggregate(Mydata2[, 1], list(Mydata2$Nutrients), mean)

write.csv(Mydata2, "C:\\Users\\qi199\\Documents\\R-eproducibility\\Output\\WrangledData.csv", row.names = FALSE)

