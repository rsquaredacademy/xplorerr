tabPanel('Home', value = 'tab_home_analyze', icon = icon('home'),
         
    navlistPanel(id = 'navlist_home',
        well = FALSE,
        widths = c(2, 10),

        source('ui/ui_home.R', local = TRUE)[[1]],
        source('ui/ui_eda_home.R', local = TRUE)[[1]],
        source('ui/ui_dist_home.R', local = TRUE)[[1]]
    )
)