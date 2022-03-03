#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))


ui <- fluidPage(
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(inputId = "y",
                  label = "Y-axis:",
                  choices = c("imdb_rating", "imdb_num_votes",
                              "critics_score", "audience_score", "runtime"),
                  selected = "audience_score"),
      
      selectInput(inputId = "x",
                  label = "X-axis:",
                  choices = c("imdb_rating", "imdb_num_votes",
                              "critics_score", "audience_score", "runtime"),
                  selected = "critics_score")),
    mainPanel(
      plotOutput(outputId = "scatterplot", hover = "plot_hover"),
      #      DT::dataTableOutput(outputId = "moviestable")
      dataTableOutput(outputId = "moviestable"),
      br()
    )
  )
)

server <- function(input, output) {
  
  output$scatterplot <- renderPlot({
    ggplot(data = movies, aes_string(x = input$x, y = input$y)) +
      geom_point()
  })
  
  # output$moviestable <- DT::renderDataTable({
  #   brushedPoints(movies, req(input$plot_brush)) %>%
  #     select(title, audience_score, critics_score)
  output$moviestable <- DT::renderDataTable({
    nearPoints(movies, input$plot_hover) %>%
      select(title, audience_score, critics_score)
  })
}

shinyApp(ui = ui, server = server)
