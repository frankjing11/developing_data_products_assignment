library(shiny)
library(datasets)
library(ggplot2)
library(ggthemes)
library(forecast)

rawdata <- airquality

rawdata$Date <- as.Date(paste(rawdata$Month,rawdata$Day,"1973",sep="/"),
                        format="%m/%d/%Y")
rawdata$t <- seq(1,dim(rawdata)[1])
training <- rawdata[rawdata$Month != 9,]
testing <- rawdata[rawdata$Month == 9,]


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$title <- renderText({
    
    if (input$Prediction == FALSE){
      
      paste("The Trend of", input$vari, "Without Prediction")
      
    } else{
      
      paste("The Trend of", input$vari, "With Prediction")
      
    }
    
  })
  
  
  
  
  output$tsPlot <- renderPlot({
    
    if (input$Prediction == FALSE){
      
      p <- ggplot(rawdata, aes_string("Date", input$vari)) +
        geom_line(color="blue",size=0.5)+
        #scale_x_date(date_labels = "%m") +
        xlab("Date") +
        ylab(input$vari)+
        theme_economist()
      p
      
      
    } else {
      
      formulaTextPoint <- reactive({
        paste("as.integer(", input$vari, ")", "~ t")
      })
      
      reg_model <- lm(as.formula(formulaTextPoint()),training)
      pred_summary <- predict.lm(reg_model, testing,interval="prediction")
      testing$pred_value <- data.frame(pred_summary)[,1]
      testing <- cbind(testing,data.frame(pred_summary)[,c(2,3)])
      
      p1 <- ggplot(rawdata, aes_string("Date", input$vari)) +
        geom_line(color="blue",size=0.5)+
        geom_line(aes(y=pred_value),color="#E69F00",size=1,
                  data=data.frame(testing))+
        geom_line(aes(y=lwr),color="red",size=0.5,
                  data=data.frame(testing),linetype = "dashed")+
        geom_line(aes(y=upr),color="red",size=0.5,
                  data=data.frame(testing),linetype = "dashed")+
        xlab("Month") +
        ylab("Daily Mean Ozone Level")+
        theme_economist()
      
      p1
      
      
    }
    
    
  })
  
  output$fit <- renderPrint({
    
    if (input$Prediction == TRUE){
      formulaTextPoint <- reactive({
        paste("as.integer(", input$vari, ")", "~ t")
      })
      
      reg_model <- lm(as.formula(formulaTextPoint()),data=training)
      summary(reg_model)
    }
  })
  
  
})
