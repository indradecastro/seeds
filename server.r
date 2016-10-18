library(shiny)
raw <- read.table("emergence.etc.csv", header=T, sep = ",", dec=".")

shinyServer(function(input, output){
      seed <- reactive({as.character(input$seed)})
      
      output$myseed <- renderText({seed()})
     
      output$myhist <- renderPlot({
            hist(raw[,seed()], breaks = min(raw[,seed()]):max(raw[,seed()]), main=seed(), xlab="num. emerged seedlings")
      })
     
      output$mybox <- renderPlot({
            mycol <- rep(c("white", "brown", "blue", "red"), c(3,1,1,1))
            boxplot(raw[,seed()]~raw$trad.group, main=seed(), col=mycol, ylab="num. emerged seedlings")
      })
      
      output$mycontrast <- renderPlot({
            raw$control <- ifelse(raw$trad.group==grep("c.", raw$trad.group, value=T), "control", "scarabs")
            boxplot(raw[,seed()]~raw$control, outpch = NA, main=seed(), ylab="num. emerged seedlings")
            stripchart(raw[,seed()]~raw$control,
                       vertical = TRUE, method = "jitter",
                       pch = 21,# col = "maroon", bg = "white",
                       add = TRUE)
      })
})