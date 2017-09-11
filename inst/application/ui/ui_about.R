tabPanel("About", value="tab_about", icon = icon('info-circle'),

    fluidPage(

      fluidRow(

        column(12, align = 'center',
          img(src = 'about.jpg', width = '1300px', height = '500px')
        )
      ),
      br(),
      br(),

		    fluidRow(
            h2('WELCOME TO RSQUARED ACADEMY', align = 'center'),
            hr(),
            column(6, align = 'center', offset = 3, 
              p('Rsquared Academy is an e-learning platform offering self paced and instructor led courses. Our 
                main area of focus are data science and business analytics. Our courses are curated by experts from 
                the industry and delivered by a team passionate about online education. We offer 24/7 on-demand support for all
                our courses.')
            ),
            br(),
            column(6, align = 'center', offset = 3,
              br(),
              h4('Our Vision'),
              p('To make professional education flexible, affordable, effective and enjoyable.'),
              br(),
              h4('Our Mission'),
              p('Leverage technology and experitse to build a platform that offers interactive online learning 
                accompanied by 24/7 support. ')
            )
            
       	),

        br(),
        br(),

        fluidRow(
          h2('Contact Us', align = 'center'),
          br(),
          br(),
          column(4),
          column(2, align = 'left',
            h4('OFFICE ADDRESS', style='color:black'),
            p('Rsquared Academy'),
            p('59/4, Bhadra Landmark'),
            p('Basavanagudi'),
            p('Bengaluru - 560004')
          ),
          column(2, align = 'right', 
            h4('CONTACT NUMBER', style='color:black'),
            p('+91 7349713145 (Sales)'),
            p('sales@rsquaredacademy.com'),
            p('support@rsquaredacademy.com')
          ),
          column(4)
        ),

        br(),
        br(),

        fluidRow(
          column(6, align = 'center', offset = 3,
            tags$iframe(src='https://forms.zohopublic.com/rsquaredacademy/form/ContactForm/formperma/7mm67F924f01g7_7F109hm91h',
              width = '99%', height = '500px')
          )
        ),

        br(),
        br(),
        br(),
        br()

    )

)
