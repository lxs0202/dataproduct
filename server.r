library(shiny)

set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

library(randomForest)
rf <- randomForest(Species ~ ., data=trainData, ntree=100, proximity=TRUE)

predictiris <- function(sepal_length, sepal_width, petal_length,petal_width,model=rf){
  data <- data.frame(sepal_length)
  data$"Sepal.Width" <- sepal_width
  data$"Petal.Length" <- petal_length
  data$"Petal.Width" <- petal_width
  names(data)[1] <-"Sepal.Length";
  irisPred <- predict(rf, data)
  return(as.character(irisPred))
}


shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({paste(input$sepal_length,input$sepal_width,input$petal_length,input$petal_width, sep=",")})
    output$prediction <- renderPrint({predictiris(input$sepal_length,input$sepal_width,input$petal_length,input$petal_width)})
    output$instruction <- renderPrint("please enter the attribute of an iris, the system will return the type of the iris. The dataset for building the model is the iris dataset, please type the 'iris' in R to find more information")
  }
)


