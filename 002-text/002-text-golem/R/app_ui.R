#' @import shiny
app_ui <- function() {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    fluidPage(
      # App title ----
      titlePanel("Shiny Text"),

      # Sidebar layout with a input and output definitions ----
      sidebarLayout(

        # Sidebar panel for inputs ----
        sidebarPanel(

          # Input: Selector for choosing dataset ----
          selectInput(
            inputId = "dataset",
            label = "Choose a dataset:",
            choices = c("rock", "pressure", "cars")
          ),

          # Input: Numeric entry for number of obs to view ----
          numericInput(
            inputId = "obs",
            label = "Number of observations to view:",
            value = 10
          )
        ),

        # Main panel for displaying outputs ----
        mainPanel(

          # Output: Verbatim text for data summary ----
          verbatimTextOutput("summary"),

          # Output: HTML table with requested number of observations ----
          tableOutput("view")
        )
      )
    )
  )
}

#' @import shiny
golem_add_external_resources <- function() {
  addResourcePath(
    "www", system.file("app/www", package = "shinytext")
  )

  tags$head(
    golem::activate_js(),
    golem::favicon()
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    # tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
  )
}
