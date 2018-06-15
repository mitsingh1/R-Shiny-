library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Phenotpyes"),
  
  # Some helpful information
  helpText("This application creates a graph to display the difference in phenotype of rice",
           "from various Regions. Please use the buttons below to select",
           "your phenotype and type of graph."),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("Graph", #the input variable that the value will go into
                   "Select a graph to display:",
                   c("boxplot",
                     "point",
                     "violin")
      ),
      
      radioButtons("Traits", #the input variable that the value will go into
                   "Select a trait to display:",
                   c("Amylose.content",
                     "Brown.rice.volume",
                     "Panicle.fertility",
                     "Panicle.number.per.plant")
                   
      )),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("plot1")
    )
  )
))