library(shinyjs)

appCSS <- "
#loading-content {
  position: absolute;
  background: #000000;
  opacity: 0.9;
  z-index: 100;
  left: 0;
  right: 0;
  height: 100%;
  text-align: center;
  color: #FFFFFF;
}
"

shinyApp(
  ui = fluidPage(
    useShinyjs(),
    inlineCSS(appCSS),
    
    # Loading message
    div(
      id = "loading-content",
      h2("Loading...")
    ),

    # The main app code goes here
    div(
      id = "app-content",
      p("This is a simple example of a Shiny app with a loading screen."),
      p("You can view the source code",
        a(href = "https://github.com/daattali/shiny-server/blob/master/loading-screen",
          "on GitHub")
      )
    )
  ),
  server = function(input, output, session) {
    # Simulate work being done for 1 second
    Sys.sleep(1)
    
    # Hide the loading message when the rest of the server function has executed
    hide(id = "loading-content", anim = TRUE, animType = "fade")    
  }
)
