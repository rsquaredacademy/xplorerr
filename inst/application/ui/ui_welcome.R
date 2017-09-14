tabPanel('Home', value = 'tab_welcome', icon = icon('home'),

  fluidPage(theme = shinytheme('cerulean'),

    # fluidRow(
    #   column(12, align = 'center',
    #     img(src = 'banner3.jpeg', width = '1300px', height = '500px')
    #   )
    # ),

    # fluidRow(
    #   br(),
    #   column(12, align = 'center',
    #     h1('Explore..Discover..Learn', style="color:black")
    #   )
    # ),

    br(),

    fluidRow(
      column(1),
      column(4, align = 'center', 
        br(),
        h3('Explore..Discover..Learn'),
        p('Explore data using a simple interface. Generate descriptive statistics, 
          understand distributions, build visualizations step by step, perform 
          parametric and non-paramaetric tests and build models.'),
        br(),
        actionButton(inputId='welcomebutton', label="Get Started", icon = icon("long-arrow-right"))
      ),
      column(2),
      column(4, align = 'center', 
        img(src = 'xplorerr_home.png', width = '360px', height = '250px')
      ),
      column(1)
    ),

    fluidRow(hr()),

    # fluidRow(
    #   column(6, offset = 3, align = 'center',
    #     h4('Xplorerr is a web interface built for interactive statistical
    #             analysis using ', a("R,", href = "http://r-project.org/"),
    #             a(" RStudio", href = "http://www.rstudio.com"), ' and ',
    #             a("Shiny.", href = "http://shiny.rstudio.com/"), 'The app is
    #             currently used to teach the business analytics course at ',
    #             a("Rsquared Academy.", href = "http://rsquaredacademy.com/"), 
    #             style="color:black")
    #   )
    # ),

    fluidRow(
      column(12, align = 'center',
        h2('Accelerate your learning with Xplorerr')
      )
    ),

    br(),

    fluidRow(
      br(),
      column(2),
      column(4, align = 'center', img(src = 'summary1.png', width = '100px', height = '100px')),
      column(4, align = 'center', img(src = 'visualize2.png', width = '100px', height = '100px')),
      column(2)
    ),


    fluidRow(
      column(2),
      column(4, align = 'center', h3('Descriptive Statistics')),
      column(4, align = 'center', h3('Data Visualization')),
      column(2)
    ),

    fluidRow(
      br(),
      column(2),
      column(4, align = 'center', img(src = 'independent.png', width = '100px', height = '100px')),
      column(4, align = 'center', img(src = 'simple_reg.png', width = '100px', height = '100px')),
      column(2)
    ),

    fluidRow(
      column(2),
      column(4, align = 'center', h3('Statistical Inference')),
      column(4, align = 'center', h3('Model Building & Validation')),
      column(2)
    ),

    hr(),

    fluidRow(
      column(12, align = 'center',
        h2('Quick Demo')
      )
    ),

    fluidRow(
      column(12, align = 'center',
        div(style = "height:550px;",
          br(),
          br(),
          tags$iframe(width="760", height="515", src="https://www.youtube.com/embed/aM0bjrYCvv8?rel=0&autoplay=1")
        )
      )
    ),

    br(),

    fluidRow(column(12, hr())),

    fluidRow(
      column(12, align = 'center', h2('Built With')),
      br(),
      br(),
      br(),
      column(6, align = 'center',
        a(img(src = 'shiny.png', width = '300px', height = '200px'), href = "http://shiny.rstudio.com/", target = "_blank")
      ),
      column(6, align = 'center',
        br(),
        a(img(src = 'rstudio.png', width = '360px', height = '150px'), href = "https://www.rstudio.com/", target = "_blank")
      )
    ),

    br(),
    br(),

    fluidRow(column(12, hr())),

    fluidRow(
      column(12, align = 'center',
        a(img(src = 'fbicon.png'), href = "https://www.facebook.com/rsquaredacademy", target = "_blank"),
        a(img(src = 'twittericon.png'), href = "https://twitter.com/rsquaredacademy", target = "_blank"),
        a(img(src = 'githubicon.png'), href = "https://github.com/rsquaredacademy", target = "_blank"),
        a(img(src = 'youtubeicon.png'), href = "https://www.youtube.com/user/rsquaredin/", target = "_blank"),
        a(img(src = 'linkedinicon.png'), href = "https://www.slideshare.net/rsquaredin", target = "_blank")
      )
    ),

    fluidRow(column(12, hr())),

    fluidRow(
      column(12, align = 'center',
        tags$footer('Copyright: 2014-2017 Rsquared Academy')
      )
    ),
    br()

    # fluidRow(
    #   column(4, offset = 4, align = 'center',
    #     h2('Simple Interface'),
    #     p('Xplorerr offers a simple interface for uploading data. As a tool aimed at beginners, all 
    #       you need to do is to upload your data in a comma or tab separated file and get going with your analysis.')
    #   ),
    #   column(12, align = 'center',
    #     tags$iframe(src="https://player.vimeo.com/video/208786227", width="640", height="360")
    #   )
      
    # ),

    # br(),
    # br(),
    # br(),

    # fluidRow(
    #   column(4, offset = 4, align = 'center',
    #     h2('Transform Data'),
    #     p('Screen data for missing values, rename variables and modify data types.')
    #   ),
    #   column(12, align = 'center',
    #     tags$iframe(src="https://player.vimeo.com/video/208786721", width="640", height="360")
    #   )
    # ),

    # br(),
    # br(),
    # br(),

    # fluidRow(
    #   column(4, offset = 4, align = 'center',
    #     h2('Exploratory Data Analysis'),
    #     p('Generate detailed summary statistics, one and two way tables, group summaries and
    #       visualize the same.')
    #   ),
    #   column(12, align = 'center',
    #     tags$iframe(src="https://player.vimeo.com/video/208787963", width="640", height="360")
    #   )
    # ),

    # br(),
    # br(),
    # br(),

    # fluidRow(
    #   column(4, offset = 4, align = 'center',
    #     h2('Understand Statistical Distributions'),
    #     p('Vizually explore the most important statistical distributions. Understand the factors which
    #       influence their shapes. Learn to calculate the probability and quantiles.')
    #   ),
    #   column(12, align = 'center',
    #     tags$iframe(src="https://player.vimeo.com/video/208788108", width="640", height="360")
    #   )
    # ),

    # br(),
    # br(),
    # br(),

    # fluidRow(
    #   column(4, offset = 4, align = 'center',
    #     h2('Visualize Data'),
    #     p('Visualize data by interactively building plots step by step.')
    #   ),
    #   column(12, align = 'center',
    #     tags$iframe(src="https://player.vimeo.com/video/208788291", width="640", height="360")
    #   )
    # ),

    # br(),
    # br(),
    # br(),

    # fluidRow(
    #   column(4, offset = 4, align = 'center',
    #     h2('Inferential Statistics'),
    #     p('Test hypothesis using a set of most important parametric and non-parametric tests.')
    #   ),
    #   column(12, align = 'center',
    #     tags$iframe(src="https://player.vimeo.com/video/208788340", width="640", height="360")
    #   )
    # ),

    # br(),
    # br(),
    # br(),

    # fluidRow(
    #   column(4, offset = 4, align = 'center',
    #     h2('Model Building & Validation'),
    #     p('Build and evaluate statistical models using a simple workflow.')
    #   ),
    #   column(12, align = 'center',
    #     tags$iframe(src="https://player.vimeo.com/video/208788402", width="640", height="360")
    #   )
    # ),

    # br(),
    # br(),
    # br()

  )

)
