tabPanel('Multiple 2 Way Tables', value = 'tab_mult2',
  fluidPage(
    fluidRow(
      column(8, align = 'left',
        h4('Multiple Two Way Tables'),
        p('Generates multiple two way tables.')
      ),
      column(4, align = 'right',
        actionButton(inputId='multwo1', label="Help", icon = icon("question-circle"),
          onclick ="window.open('http://google.com', '_blank')"),
        actionButton(inputId='multwo3', label="Demo", icon = icon("video-camera"),
          onclick ="window.open('http://google.com', '_blank')")
      )
    ),
    hr(),
    fluidRow(
      column(12, align = 'center',
        verbatimTextOutput('mult2')
      )
    )
  )
)
