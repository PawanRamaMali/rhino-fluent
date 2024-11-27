library(shiny)
library(shiny.fluent)

ui <- fluentPage(
  Stack(
    tokens = list(childrenGap = 30, padding = 20),
    # Header Section
    Stack(
      horizontal = TRUE,
      horizontalAlign = "space-between",
      verticalAlign = "center",
      tokens = list(childrenGap = 10),
      Text(variant = "xxLarge", "Image Data Extraction App"),
      Text(variant = "large", "Streamline your image data processing")
    ),
    
    # Main Content Section
    Stack(
      horizontal = FALSE,
      tokens = list(childrenGap = 40),
      
      # Step 1: Upload Section
      Stack(
        tokens = list(childrenGap = 15),
        Text(variant = "xLarge", "Step 1: Upload Your Image"),
        fileInput(
          inputId = "imageFile",
          label = NULL,
          accept = c("image/jpeg", "image/png"),
          multiple = FALSE
        )
      ),
      
      # Step 2: Select Mode Section
      Stack(
        tokens = list(childrenGap = 15),
        Text(variant = "xLarge", "Step 2: Select Extraction Mode"),
        Dropdown(
          label = NULL,
          options = list(
            list(key = "text", text = "Extract Text"),
            list(key = "objects", text = "Identify Objects"),
            list(key = "metadata", text = "Extract Metadata")
          ),
          placeholder = "Choose a mode",
          onChange = JS("function(value) { Shiny.setInputValue('mode', value.key); }")
        )
      ),
      
      # Step 3: Process Button
      Stack(
        tokens = list(childrenGap = 15),
        Text(variant = "xLarge", "Step 3: Process the Image"),
        PrimaryButton(
          text = "Process Image",
          onClick = JS("function() { Shiny.setInputValue('process', true); }")
        )
      )
    ),
    
    # Results Section
    Separator(), # Adds a visual separator
    Stack(
      tokens = list(childrenGap = 20),
      Text(variant = "xLarge", "Results"),
      Stack(
        tokens = list(childrenGap = 10),
        Text("Preview:"),
        Text("Image preview will appear here."),
        Text("Processed data results will be displayed here.")
      )
    )
  )
)

server <- function(input, output, session) {
  # Server logic would go here
}

shinyApp(ui, server)
