#' @import shiny
NULL

#' Run the app
#'
#' @param path Path to interact with.
#'
#' @return Called for its side effect.
#' @export
#'
#' @examplesIf interactive()
#' run_app("/")
run_app <- function(path = "/pushymatador/fake/company") {
  ui <- fluidPage(
    textInput("path", "Path to explore", value = path),
    textInput("db", "Path read", value = path),
    numericInput(".n", "Rows to show", min = 1, max = 10, value = 5),
    verbatimTextOutput("explore"),
    tableOutput("table")
  )
  server <- function(input, output, session) {
    output$explore <- renderText({
      list.files(input$path)
    })

    output$table <- renderTable({
      dataset <- arrow::open_dataset(input$db)
      utils::head(dataset, input$.n)
    })
  }

  shinyApp(ui, server)
}
