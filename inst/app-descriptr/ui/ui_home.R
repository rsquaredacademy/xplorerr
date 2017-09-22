tabPanel("Home", value = "tab_analyze_home",
	fluidPage(
		
		fluidRow(
			column(12, align = 'center',
				h3('What do you want to do?')
			)
		),

		br(),
		br(),

		fluidRow(
			column(1),
			column(2, align = 'right',
				img(src = 'summary1.png', width = '100px', height = '100px')
			),
			column(6, align = 'center',
				h4('Descriptive Statisics'),
				p('Generate descriptive/summary statistics.')
			),
			column(2, align = 'left',
				br(),
				actionButton(
					inputId = 'click_descriptive',
					label = 'Click Here',
					width = '100px'
				)
			),
			column(1)
		),

		br(),

		fluidRow(
			column(1),
			column(2, align = 'right',
				img(src = 'normal.png', width = '100px', height = '100px')
			),
			column(6, align = 'center',
				h4('Statistical Distributions'),
				p('Explore and visualize different statistical distributions.')
			),
			column(2, align = 'left',
				br(),
				actionButton(
					inputId = 'click_distributions',
					label = 'Click Here',
					width = '100px'
				)
			),
			column(1)
		)

	)
)