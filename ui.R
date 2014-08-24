library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Iris prediction"),
    sidebarPanel(
      numericInput('sepal_length', 'Sepal Length', 1, min = 0.1, max =10 , step = 0.1),
      numericInput('sepal_width', 'Sepal Width', 1, min = 0.1, max =10 , step = 0.1),
      numericInput('petal_length', 'Petal Length', 1, min = 0.1, max =10 , step = 0.1),
      numericInput('petal_width', 'Petal Width', 1, min = 0.1, max =10 , step = 0.1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("prediction"),
      h4('User Guide'),
      verbatimTextOutput("instruction")
    )
  )
)