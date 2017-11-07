##shiny.rstudio.com
##create a new folder

#create an app

library(shiny)
library(ggplot2)


#GUI

##h1("I am header 1"),
##h2("I am header 2")
##fluidPage: the size of page changes if you change the
##page, resize it
ui <- fluidPage(
  titlePanel("Diamonds Data"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId="title", 
                label="Chart title", 
                value=""),
      selectInput(inputId = "pos",
                  label="Position",
                  choices = list("stack", "dodge"),
                  selected = "stack")
      
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

##make sure there is an ID
##TWO PARTS: input and output
###input: title, pos
###output: plot
##use "dodge" and "stack" not in capital because of
##Defalut


# Server
##interactive
server <- function(input,output){
  
  output$plot=renderPlot({
    ggplot(diamonds, aes(x= cut, fill=clarity))+
      geom_bar(position = input$pos)+
      ggtitle(input$title)
  })
  
}
##assign to output
# Run the App
shinyApp(ui, server)

##runApp('diamondsVis')
##run more than one line, use {}
