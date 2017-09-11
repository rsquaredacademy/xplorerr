tabPanel('Distributions', value = 'tab_dist_home',

	fluidPage(

		fluidRow(

			column(12),

			br(),

			column(12, align = 'center',
				h5('What do you want to do?')
			),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Explore Normal Distribution')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_1',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Explore t Distribution')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_2',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Explore Chi Square Distribution')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_3',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Explore Binomial Distribution')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_4',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3),

			br(),
			br(),
			br(),

			column(3),

			column(4, align = 'left',
				h5('Explore F Distribution')
			),

			column(2, align = 'left',
					actionButton(
						inputId = 'button_dist_home_5',
						label = 'Click Here',
						width = '120px'
					)
			),

			column(3)

		)

	)
)