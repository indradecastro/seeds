library(shiny)
shinyUI(fluidPage(
      titlePanel("Exploring seedling emergence of several species"),
      
      verticalLayout(
            sidebarPanel(
                  selectInput("seed",
                              "Select a seed species:",
                              c("Hordeum", "Anthyllis", "Cistus", "other"),
                              selected = "other")
            ),
#             mainPanel(fluidRow(splitLayout(cellWidths = c("50%", "50%"),
#                      # textOutput("myseed"),
#                      plotOutput("myhist"),
#                      plotOutput("mycontrast"))),
#                      plotOutput("mybox")
#             )
            mainPanel(fluidRow(splitLayout(cellWidths = c("40%", "40%", "70%"),
                                           # textOutput("myseed"),
                                           plotOutput("myhist"),
                                           plotOutput("mycontrast"),
                                           plotOutput("mybox")))
)

      )
))