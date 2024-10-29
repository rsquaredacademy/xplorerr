pkgname <- "descriptr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('descriptr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("ds_auto_freq_table")
### * ds_auto_freq_table

flush(stderr()); flush(stdout())

### Name: ds_auto_freq_table
### Title: Multiple One & Two Way Tables
### Aliases: ds_auto_freq_table ds_auto_cross_table ds_tway_tables
###   ds_oway_tables

### ** Examples

# multiple one way tables
ds_auto_freq_table(mtcarz)
ds_auto_freq_table(mtcarz, cyl, gear)

# multiple two way tables
ds_auto_cross_table(mtcarz)
ds_auto_cross_table(mtcarz, cyl, gear, am)



cleanEx()
nameEx("ds_auto_group_summary")
### * ds_auto_group_summary

flush(stderr()); flush(stdout())

### Name: ds_auto_group_summary
### Title: Tabulation
### Aliases: ds_auto_group_summary

### ** Examples

ds_auto_group_summary(mtcarz, cyl, gear, mpg, disp)




cleanEx()
nameEx("ds_auto_summary_stats")
### * ds_auto_summary_stats

flush(stderr()); flush(stdout())

### Name: ds_auto_summary_stats
### Title: Descriptive statistics and frquency tables
### Aliases: ds_auto_summary_stats

### ** Examples

ds_auto_summary_stats(mtcarz)
ds_auto_summary_stats(mtcarz, disp, hp)




cleanEx()
nameEx("ds_cross_table")
### * ds_cross_table

flush(stderr()); flush(stdout())

### Name: ds_cross_table
### Title: Two way table
### Aliases: ds_cross_table plot.ds_cross_table ds_twoway_table

### ** Examples

k <- ds_cross_table(mtcarz, cyl, gear)
k

# bar plots
plot(k)
plot(k, stacked = TRUE)
plot(k, proportional = TRUE)

# alternate
ds_twoway_table(mtcarz, cyl, gear)




cleanEx()
nameEx("ds_css")
### * ds_css

flush(stderr()); flush(stdout())

### Name: ds_css
### Title: Corrected Sum of Squares
### Aliases: ds_css

### ** Examples

ds_css(mtcars$mpg)
ds_css(mpg, mtcars)



cleanEx()
nameEx("ds_cvar")
### * ds_cvar

flush(stderr()); flush(stdout())

### Name: ds_cvar
### Title: Coefficient of Variation
### Aliases: ds_cvar

### ** Examples

ds_cvar(mtcars$mpg)
ds_cvar(mpg, mtcars)



cleanEx()
nameEx("ds_extreme_obs")
### * ds_extreme_obs

flush(stderr()); flush(stdout())

### Name: ds_extreme_obs
### Title: Extreme observations
### Aliases: ds_extreme_obs

### ** Examples

ds_extreme_obs(mtcarz, mpg)




cleanEx()
nameEx("ds_freq_table")
### * ds_freq_table

flush(stderr()); flush(stdout())

### Name: ds_freq_table
### Title: Frequency table
### Aliases: ds_freq_table plot.ds_freq_table ds_freq_cont

### ** Examples

# categorical data
ds_freq_table(mtcarz, cyl)

# barplot
k <- ds_freq_table(mtcarz, cyl)
plot(k)

# continuous data
ds_freq_table(mtcarz, mpg)

# barplot
k <- ds_freq_table(mtcarz, mpg)
plot(k)




cleanEx()
nameEx("ds_gmean")
### * ds_gmean

flush(stderr()); flush(stdout())

### Name: ds_gmean
### Title: Geometric Mean
### Aliases: ds_gmean

### ** Examples

ds_gmean(mtcars$mpg)
ds_gmean(mpg, mtcars)



cleanEx()
nameEx("ds_group_summary")
### * ds_group_summary

flush(stderr()); flush(stdout())

### Name: ds_group_summary
### Title: Groupwise descriptive statistics
### Aliases: ds_group_summary plot.ds_group_summary

### ** Examples

# ds_group summary
ds_group_summary(mtcarz, cyl, mpg)

# boxplot
k <- ds_group_summary(mtcarz, cyl, mpg)
plot(k)

# tibble
k$tidy_stats




cleanEx()
nameEx("ds_group_summary_interact")
### * ds_group_summary_interact

flush(stderr()); flush(stdout())

### Name: ds_group_summary_interact
### Title: Category wise descriptive statistics
### Aliases: ds_group_summary_interact

### ** Examples

ds_group_summary_interact(mtcarz, mpg, cyl, gear)




cleanEx()
nameEx("ds_hmean")
### * ds_hmean

flush(stderr()); flush(stdout())

### Name: ds_hmean
### Title: Harmonic Mean
### Aliases: ds_hmean

### ** Examples

ds_hmean(mtcars$mpg)
ds_hmean(mpg, mtcars)



cleanEx()
nameEx("ds_kurtosis")
### * ds_kurtosis

flush(stderr()); flush(stdout())

### Name: ds_kurtosis
### Title: Kurtosis
### Aliases: ds_kurtosis

### ** Examples

ds_kurtosis(mtcars$mpg)
ds_kurtosis(mpg, mtcars)



cleanEx()
nameEx("ds_launch_shiny_app")
### * ds_launch_shiny_app

flush(stderr()); flush(stdout())

### Name: ds_launch_shiny_app
### Title: Launch Shiny App
### Aliases: ds_launch_shiny_app

### ** Examples

## Not run: 
##D ds_launch_shiny_app()
## End(Not run)



cleanEx()
nameEx("ds_mdev")
### * ds_mdev

flush(stderr()); flush(stdout())

### Name: ds_mdev
### Title: Mean Absolute Deviation
### Aliases: ds_mdev

### ** Examples

ds_mdev(mtcars$mpg)
ds_mdev(mpg, mtcars)



cleanEx()
nameEx("ds_measures_location")
### * ds_measures_location

flush(stderr()); flush(stdout())

### Name: ds_measures_location
### Title: Measures of location
### Aliases: ds_measures_location

### ** Examples

ds_measures_location(mtcarz)
ds_measures_location(mtcarz, mpg)
ds_measures_location(mtcarz, mpg, disp)




cleanEx()
nameEx("ds_measures_symmetry")
### * ds_measures_symmetry

flush(stderr()); flush(stdout())

### Name: ds_measures_symmetry
### Title: Measures of symmetry
### Aliases: ds_measures_symmetry

### ** Examples

ds_measures_symmetry(mtcarz)
ds_measures_symmetry(mtcarz, mpg)
ds_measures_symmetry(mtcarz, mpg, disp)




cleanEx()
nameEx("ds_measures_variation")
### * ds_measures_variation

flush(stderr()); flush(stdout())

### Name: ds_measures_variation
### Title: Measures of variation
### Aliases: ds_measures_variation

### ** Examples

ds_measures_variation(mtcarz)
ds_measures_variation(mtcarz, mpg)
ds_measures_variation(mtcarz, mpg, disp)




cleanEx()
nameEx("ds_mode")
### * ds_mode

flush(stderr()); flush(stdout())

### Name: ds_mode
### Title: Mode
### Aliases: ds_mode

### ** Examples

ds_mode(mtcars$mpg)
ds_mode(mtcars$cyl)



cleanEx()
nameEx("ds_percentiles")
### * ds_percentiles

flush(stderr()); flush(stdout())

### Name: ds_percentiles
### Title: Percentiles
### Aliases: ds_percentiles

### ** Examples

ds_percentiles(mtcarz)
ds_percentiles(mtcarz, mpg)
ds_percentiles(mtcarz, mpg, disp)




cleanEx()
nameEx("ds_plot_bar")
### * ds_plot_bar

flush(stderr()); flush(stdout())

### Name: ds_plot_bar
### Title: Generate bar plots
### Aliases: ds_plot_bar

### ** Examples

ds_plot_bar(mtcarz)
ds_plot_bar(mtcarz, cyl)
ds_plot_bar(mtcarz, cyl, gear)




cleanEx()
nameEx("ds_plot_bar_grouped")
### * ds_plot_bar_grouped

flush(stderr()); flush(stdout())

### Name: ds_plot_bar_grouped
### Title: Generate grouped bar plots
### Aliases: ds_plot_bar_grouped

### ** Examples

mt <- dplyr::select(mtcarz, cyl, gear, am)
ds_plot_bar_grouped(mt)
ds_plot_bar_grouped(mtcarz, cyl, gear)




cleanEx()
nameEx("ds_plot_bar_stacked")
### * ds_plot_bar_stacked

flush(stderr()); flush(stdout())

### Name: ds_plot_bar_stacked
### Title: Generate stacked bar plots
### Aliases: ds_plot_bar_stacked

### ** Examples

mt <- dplyr::select(mtcarz, cyl, gear, am)
ds_plot_bar_stacked(mt)
ds_plot_bar_stacked(mtcarz, cyl, gear)




cleanEx()
nameEx("ds_plot_box_group")
### * ds_plot_box_group

flush(stderr()); flush(stdout())

### Name: ds_plot_box_group
### Title: Compare distributions
### Aliases: ds_plot_box_group

### ** Examples

mt <- dplyr::select(mtcarz, cyl, disp, mpg)
ds_plot_box_group(mt)
ds_plot_box_group(mtcarz, cyl, gear, mpg)




cleanEx()
nameEx("ds_plot_box_single")
### * ds_plot_box_single

flush(stderr()); flush(stdout())

### Name: ds_plot_box_single
### Title: Generate box plots
### Aliases: ds_plot_box_single

### ** Examples

ds_plot_box_single(mtcarz)
ds_plot_box_single(mtcarz, mpg)
ds_plot_box_single(mtcarz, mpg, disp, hp)




cleanEx()
nameEx("ds_plot_density")
### * ds_plot_density

flush(stderr()); flush(stdout())

### Name: ds_plot_density
### Title: Generate density plots
### Aliases: ds_plot_density

### ** Examples

ds_plot_density(mtcarz)
ds_plot_density(mtcarz, mpg)
ds_plot_density(mtcarz, mpg, disp, hp)




cleanEx()
nameEx("ds_plot_histogram")
### * ds_plot_histogram

flush(stderr()); flush(stdout())

### Name: ds_plot_histogram
### Title: Generate histograms
### Aliases: ds_plot_histogram

### ** Examples

ds_plot_histogram(mtcarz)
ds_plot_histogram(mtcarz, mpg)
ds_plot_histogram(mtcarz, mpg, disp, hp)




cleanEx()
nameEx("ds_plot_scatter")
### * ds_plot_scatter

flush(stderr()); flush(stdout())

### Name: ds_plot_scatter
### Title: Generate scatter plots
### Aliases: ds_plot_scatter

### ** Examples

ds_plot_scatter(mtcarz)
ds_plot_scatter(mtcarz, mpg, disp)




cleanEx()
nameEx("ds_range")
### * ds_range

flush(stderr()); flush(stdout())

### Name: ds_range
### Title: Range
### Aliases: ds_range

### ** Examples

ds_range(mtcars$mpg)
ds_range(mpg, mtcars)



cleanEx()
nameEx("ds_rindex")
### * ds_rindex

flush(stderr()); flush(stdout())

### Name: ds_rindex
### Title: Index Values
### Aliases: ds_rindex

### ** Examples

ds_rindex(mtcars$mpg, 21)
ds_rindex(mtcars$mpg, 22)



cleanEx()
nameEx("ds_screener")
### * ds_screener

flush(stderr()); flush(stdout())

### Name: ds_screener
### Title: Screen data
### Aliases: ds_screener plot.ds_screener

### ** Examples

# screen data
ds_screener(mtcarz)
ds_screener(airquality)

# plot
x <- ds_screener(airquality)
plot(x)




cleanEx()
nameEx("ds_skewness")
### * ds_skewness

flush(stderr()); flush(stdout())

### Name: ds_skewness
### Title: Skewness
### Aliases: ds_skewness

### ** Examples

ds_skewness(mtcars$mpg)
ds_skewness(mpg, mtcars)



cleanEx()
nameEx("ds_std_error")
### * ds_std_error

flush(stderr()); flush(stdout())

### Name: ds_std_error
### Title: Standard error of mean
### Aliases: ds_std_error

### ** Examples

ds_std_error(mtcars$mpg)




cleanEx()
nameEx("ds_summary_stats")
### * ds_summary_stats

flush(stderr()); flush(stdout())

### Name: ds_summary_stats
### Title: Descriptive statistics
### Aliases: ds_summary_stats

### ** Examples

ds_summary_stats(mtcarz, mpg)




cleanEx()
nameEx("ds_tailobs")
### * ds_tailobs

flush(stderr()); flush(stdout())

### Name: ds_tailobs
### Title: Tail Observations
### Aliases: ds_tailobs

### ** Examples

ds_tailobs(mtcarz$mpg, 5)
ds_tailobs(mtcarz$mpg, 5, type = "high")



cleanEx()
nameEx("ds_tidy_stats")
### * ds_tidy_stats

flush(stderr()); flush(stdout())

### Name: ds_tidy_stats
### Title: Tidy descriptive statistics
### Aliases: ds_tidy_stats ds_multi_stats

### ** Examples

ds_tidy_stats(mtcarz)
ds_tidy_stats(mtcarz, mpg, disp, hp)




### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
