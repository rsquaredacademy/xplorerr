pkgname <- "olsrr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('olsrr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("ols_aic")
### * ols_aic

flush(stderr()); flush(stdout())

### Name: ols_aic
### Title: Akaike information criterion
### Aliases: ols_aic

### ** Examples

# using R computation method
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_aic(model)

# using STATA computation method
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_aic(model, method = 'STATA')

# using SAS computation method
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_aic(model, method = 'SAS')

# corrected akaike information criterion
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_aic(model, method = 'SAS', corrected = TRUE)




cleanEx()
nameEx("ols_apc")
### * ols_apc

flush(stderr()); flush(stdout())

### Name: ols_apc
### Title: Amemiya's prediction criterion
### Aliases: ols_apc

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_apc(model)




cleanEx()
nameEx("ols_coll_diag")
### * ols_coll_diag

flush(stderr()); flush(stdout())

### Name: ols_coll_diag
### Title: Collinearity diagnostics
### Aliases: ols_coll_diag ols_vif_tol ols_eigen_cindex

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)

# vif and tolerance
ols_vif_tol(model)

# eigenvalues and condition indices
ols_eigen_cindex(model)

# collinearity diagnostics
ols_coll_diag(model)




cleanEx()
nameEx("ols_correlations")
### * ols_correlations

flush(stderr()); flush(stdout())

### Name: ols_correlations
### Title: Part and partial correlations
### Aliases: ols_correlations

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_correlations(model)




cleanEx()
nameEx("ols_fpe")
### * ols_fpe

flush(stderr()); flush(stdout())

### Name: ols_fpe
### Title: Final prediction error
### Aliases: ols_fpe

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_fpe(model)




cleanEx()
nameEx("ols_hadi")
### * ols_hadi

flush(stderr()); flush(stdout())

### Name: ols_hadi
### Title: Hadi's influence measure
### Aliases: ols_hadi

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_hadi(model)




cleanEx()
nameEx("ols_hsp")
### * ols_hsp

flush(stderr()); flush(stdout())

### Name: ols_hsp
### Title: Hocking's Sp
### Aliases: ols_hsp

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_hsp(model)




cleanEx()
nameEx("ols_launch_app")
### * ols_launch_app

flush(stderr()); flush(stdout())

### Name: ols_launch_app
### Title: Launch shiny app
### Aliases: ols_launch_app

### ** Examples

## Not run: 
##D ols_launch_app()
## End(Not run)



cleanEx()
nameEx("ols_leverage")
### * ols_leverage

flush(stderr()); flush(stdout())

### Name: ols_leverage
### Title: Leverage
### Aliases: ols_leverage

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_leverage(model)




cleanEx()
nameEx("ols_mallows_cp")
### * ols_mallows_cp

flush(stderr()); flush(stdout())

### Name: ols_mallows_cp
### Title: Mallow's Cp
### Aliases: ols_mallows_cp

### ** Examples

full_model <- lm(mpg ~ ., data = mtcars)
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_mallows_cp(model, full_model)




cleanEx()
nameEx("ols_msep")
### * ols_msep

flush(stderr()); flush(stdout())

### Name: ols_msep
### Title: MSEP
### Aliases: ols_msep

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_msep(model)




cleanEx()
nameEx("ols_plot_added_variable")
### * ols_plot_added_variable

flush(stderr()); flush(stdout())

### Name: ols_plot_added_variable
### Title: Added variable plots
### Aliases: ols_plot_added_variable

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_added_variable(model)




cleanEx()
nameEx("ols_plot_comp_plus_resid")
### * ols_plot_comp_plus_resid

flush(stderr()); flush(stdout())

### Name: ols_plot_comp_plus_resid
### Title: Residual plus component plot
### Aliases: ols_plot_comp_plus_resid

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_comp_plus_resid(model)




cleanEx()
nameEx("ols_plot_cooksd_bar")
### * ols_plot_cooksd_bar

flush(stderr()); flush(stdout())

### Name: ols_plot_cooksd_bar
### Title: Cooks' D bar plot
### Aliases: ols_plot_cooksd_bar

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_cooksd_bar(model)
ols_plot_cooksd_bar(model, type = 4)
ols_plot_cooksd_bar(model, threshold = 0.2)




cleanEx()
nameEx("ols_plot_cooksd_chart")
### * ols_plot_cooksd_chart

flush(stderr()); flush(stdout())

### Name: ols_plot_cooksd_chart
### Title: Cooks' D chart
### Aliases: ols_plot_cooksd_chart

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_cooksd_chart(model)
ols_plot_cooksd_chart(model, type = 4)
ols_plot_cooksd_chart(model, threshold = 0.2)




cleanEx()
nameEx("ols_plot_dfbetas")
### * ols_plot_dfbetas

flush(stderr()); flush(stdout())

### Name: ols_plot_dfbetas
### Title: DFBETAs panel
### Aliases: ols_plot_dfbetas

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_dfbetas(model)




cleanEx()
nameEx("ols_plot_dffits")
### * ols_plot_dffits

flush(stderr()); flush(stdout())

### Name: ols_plot_dffits
### Title: DFFITS plot
### Aliases: ols_plot_dffits

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_dffits(model)
ols_plot_dffits(model, size_adj_threshold = FALSE)




cleanEx()
nameEx("ols_plot_diagnostics")
### * ols_plot_diagnostics

flush(stderr()); flush(stdout())

### Name: ols_plot_diagnostics
### Title: Diagnostics panel
### Aliases: ols_plot_diagnostics

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_diagnostics(model)




cleanEx()
nameEx("ols_plot_hadi")
### * ols_plot_hadi

flush(stderr()); flush(stdout())

### Name: ols_plot_hadi
### Title: Hadi plot
### Aliases: ols_plot_hadi

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_hadi(model)




cleanEx()
nameEx("ols_plot_obs_fit")
### * ols_plot_obs_fit

flush(stderr()); flush(stdout())

### Name: ols_plot_obs_fit
### Title: Observed vs fitted values plot
### Aliases: ols_plot_obs_fit

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_obs_fit(model)




cleanEx()
nameEx("ols_plot_reg_line")
### * ols_plot_reg_line

flush(stderr()); flush(stdout())

### Name: ols_plot_reg_line
### Title: Simple linear regression line
### Aliases: ols_plot_reg_line

### ** Examples

ols_plot_reg_line(mtcars$mpg, mtcars$disp)




cleanEx()
nameEx("ols_plot_resid_box")
### * ols_plot_resid_box

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_box
### Title: Residual box plot
### Aliases: ols_plot_resid_box

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_box(model)




cleanEx()
nameEx("ols_plot_resid_fit")
### * ols_plot_resid_fit

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_fit
### Title: Residual vs fitted plot
### Aliases: ols_plot_resid_fit

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_fit(model)




cleanEx()
nameEx("ols_plot_resid_fit_spread")
### * ols_plot_resid_fit_spread

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_fit_spread
### Title: Residual fit spread plot
### Aliases: ols_plot_resid_fit_spread ols_plot_fm ols_plot_resid_spread

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt, data = mtcars)

# residual fit spread plot
ols_plot_resid_fit_spread(model)

# fit mean plot
ols_plot_fm(model)

# residual spread plot
ols_plot_resid_spread(model)




cleanEx()
nameEx("ols_plot_resid_hist")
### * ols_plot_resid_hist

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_hist
### Title: Residual histogram
### Aliases: ols_plot_resid_hist

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_hist(model)




cleanEx()
nameEx("ols_plot_resid_lev")
### * ols_plot_resid_lev

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_lev
### Title: Studentized residuals vs leverage plot
### Aliases: ols_plot_resid_lev

### ** Examples

model <- lm(read ~ write + math + science, data = hsb)
ols_plot_resid_lev(model)
ols_plot_resid_lev(model, threshold = 3)




cleanEx()
nameEx("ols_plot_resid_pot")
### * ols_plot_resid_pot

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_pot
### Title: Potential residual plot
### Aliases: ols_plot_resid_pot

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_pot(model)




cleanEx()
nameEx("ols_plot_resid_qq")
### * ols_plot_resid_qq

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_qq
### Title: Residual QQ plot
### Aliases: ols_plot_resid_qq

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_qq(model)




cleanEx()
nameEx("ols_plot_resid_regressor")
### * ols_plot_resid_regressor

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_regressor
### Title: Residual vs regressor plot
### Aliases: ols_plot_resid_regressor

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_regressor(model, 'drat')




cleanEx()
nameEx("ols_plot_resid_stand")
### * ols_plot_resid_stand

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_stand
### Title: Standardized residual chart
### Aliases: ols_plot_resid_stand

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_stand(model)
ols_plot_resid_stand(model, threshold = 3)




cleanEx()
nameEx("ols_plot_resid_stud")
### * ols_plot_resid_stud

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_stud
### Title: Studentized residual plot
### Aliases: ols_plot_resid_stud

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_resid_stud(model)
ols_plot_resid_stud(model, threshold = 2)




cleanEx()
nameEx("ols_plot_resid_stud_fit")
### * ols_plot_resid_stud_fit

flush(stderr()); flush(stdout())

### Name: ols_plot_resid_stud_fit
### Title: Deleted studentized residual vs fitted values plot
### Aliases: ols_plot_resid_stud_fit

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_plot_resid_stud_fit(model)
ols_plot_resid_stud_fit(model, threshold = 3)




cleanEx()
nameEx("ols_plot_response")
### * ols_plot_response

flush(stderr()); flush(stdout())

### Name: ols_plot_response
### Title: Response variable profile
### Aliases: ols_plot_response

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_plot_response(model)




cleanEx()
nameEx("ols_pred_rsq")
### * ols_pred_rsq

flush(stderr()); flush(stdout())

### Name: ols_pred_rsq
### Title: Predicted rsquare
### Aliases: ols_pred_rsq

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_pred_rsq(model)




cleanEx()
nameEx("ols_prep_avplot_data")
### * ols_prep_avplot_data

flush(stderr()); flush(stdout())

### Name: ols_prep_avplot_data
### Title: Added variable plot data
### Aliases: ols_prep_avplot_data

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_prep_avplot_data(model)




cleanEx()
nameEx("ols_prep_cdplot_data")
### * ols_prep_cdplot_data

flush(stderr()); flush(stdout())

### Name: ols_prep_cdplot_data
### Title: Cooks' D plot data
### Aliases: ols_prep_cdplot_data

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_prep_cdplot_data(model)




cleanEx()
nameEx("ols_prep_cdplot_outliers")
### * ols_prep_cdplot_outliers

flush(stderr()); flush(stdout())

### Name: ols_prep_cdplot_outliers
### Title: Cooks' d outlier data
### Aliases: ols_prep_cdplot_outliers

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
k <- ols_prep_cdplot_data(model)
ols_prep_cdplot_outliers(k)




cleanEx()
nameEx("ols_prep_dfbeta_data")
### * ols_prep_dfbeta_data

flush(stderr()); flush(stdout())

### Name: ols_prep_dfbeta_data
### Title: DFBETAs plot data
### Aliases: ols_prep_dfbeta_data

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
dfb <- dfbetas(model)
n <- nrow(dfb)
threshold <- 2 / sqrt(n)
dbetas  <- dfb[, 1]
df_data <- data.frame(obs = seq_len(n), dbetas = dbetas)
ols_prep_dfbeta_data(df_data, threshold)




cleanEx()
nameEx("ols_prep_dfbeta_outliers")
### * ols_prep_dfbeta_outliers

flush(stderr()); flush(stdout())

### Name: ols_prep_dfbeta_outliers
### Title: DFBETAs plot outliers
### Aliases: ols_prep_dfbeta_outliers

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
dfb <- dfbetas(model)
n <- nrow(dfb)
threshold <- 2 / sqrt(n)
dbetas  <- dfb[, 1]
df_data <- data.frame(obs = seq_len(n), dbetas = dbetas)
d <- ols_prep_dfbeta_data(df_data, threshold)
ols_prep_dfbeta_outliers(d)




cleanEx()
nameEx("ols_prep_dsrvf_data")
### * ols_prep_dsrvf_data

flush(stderr()); flush(stdout())

### Name: ols_prep_dsrvf_data
### Title: Deleted studentized residual plot data
### Aliases: ols_prep_dsrvf_data

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_prep_dsrvf_data(model)
ols_prep_dsrvf_data(model, threshold = 3)




cleanEx()
nameEx("ols_prep_outlier_obs")
### * ols_prep_outlier_obs

flush(stderr()); flush(stdout())

### Name: ols_prep_outlier_obs
### Title: Cooks' D outlier observations
### Aliases: ols_prep_outlier_obs

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
k <- ols_prep_cdplot_data(model)
ols_prep_outlier_obs(k)




cleanEx()
nameEx("ols_prep_regress_x")
### * ols_prep_regress_x

flush(stderr()); flush(stdout())

### Name: ols_prep_regress_x
### Title: Regress predictor on other predictors
### Aliases: ols_prep_regress_x

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
data <- ols_prep_avplot_data(model)
ols_prep_regress_x(data, 1)




cleanEx()
nameEx("ols_prep_regress_y")
### * ols_prep_regress_y

flush(stderr()); flush(stdout())

### Name: ols_prep_regress_y
### Title: Regress y on other predictors
### Aliases: ols_prep_regress_y

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
data <- ols_prep_avplot_data(model)
ols_prep_regress_y(data, 1)




cleanEx()
nameEx("ols_prep_rfsplot_fmdata")
### * ols_prep_rfsplot_fmdata

flush(stderr()); flush(stdout())

### Name: ols_prep_rfsplot_fmdata
### Title: Residual fit spread plot data
### Aliases: ols_prep_rfsplot_fmdata ols_prep_rfsplot_rsdata

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_prep_rfsplot_fmdata(model)
ols_prep_rfsplot_rsdata(model)




cleanEx()
nameEx("ols_prep_rstudlev_data")
### * ols_prep_rstudlev_data

flush(stderr()); flush(stdout())

### Name: ols_prep_rstudlev_data
### Title: Studentized residual vs leverage plot data
### Aliases: ols_prep_rstudlev_data

### ** Examples

model <- lm(read ~ write + math + science, data = hsb)
ols_prep_rstudlev_data(model)
ols_prep_rstudlev_data(model, threshold = 3)





cleanEx()
nameEx("ols_prep_rvsrplot_data")
### * ols_prep_rvsrplot_data

flush(stderr()); flush(stdout())

### Name: ols_prep_rvsrplot_data
### Title: Residual vs regressor plot data
### Aliases: ols_prep_rvsrplot_data

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_prep_rvsrplot_data(model)




cleanEx()
nameEx("ols_prep_srchart_data")
### * ols_prep_srchart_data

flush(stderr()); flush(stdout())

### Name: ols_prep_srchart_data
### Title: Standardized residual chart data
### Aliases: ols_prep_srchart_data

### ** Examples

model <- lm(read ~ write + math + science, data = hsb)
ols_prep_srchart_data(model)
ols_prep_srchart_data(model, threshold = 3)




cleanEx()
nameEx("ols_prep_srplot_data")
### * ols_prep_srplot_data

flush(stderr()); flush(stdout())

### Name: ols_prep_srplot_data
### Title: Studentized residual plot data
### Aliases: ols_prep_srplot_data

### ** Examples

model <- lm(read ~ write + math + science, data = hsb)
ols_prep_srplot_data(model)




cleanEx()
nameEx("ols_press")
### * ols_press

flush(stderr()); flush(stdout())

### Name: ols_press
### Title: PRESS
### Aliases: ols_press

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_press(model)




cleanEx()
nameEx("ols_pure_error_anova")
### * ols_pure_error_anova

flush(stderr()); flush(stdout())

### Name: ols_pure_error_anova
### Title: Lack of fit F test
### Aliases: ols_pure_error_anova

### ** Examples

model <- lm(mpg ~ disp, data = mtcars)
ols_pure_error_anova(model)




cleanEx()
nameEx("ols_regress")
### * ols_regress

flush(stderr()); flush(stdout())

### Name: ols_regress
### Title: Ordinary least squares regression
### Aliases: ols_regress ols_regress.lm

### ** Examples

ols_regress(mpg ~ disp + hp + wt, data = mtcars)

# if model includes interaction terms set iterm to TRUE
ols_regress(mpg ~ disp * wt, data = mtcars, iterm = TRUE)




cleanEx()
nameEx("ols_sbc")
### * ols_sbc

flush(stderr()); flush(stdout())

### Name: ols_sbc
### Title: Bayesian information criterion
### Aliases: ols_sbc

### ** Examples

# using R computation method
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_sbc(model)

# using STATA computation method
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_sbc(model, method = 'STATA')

# using SAS computation method
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_sbc(model, method = 'SAS')




cleanEx()
nameEx("ols_sbic")
### * ols_sbic

flush(stderr()); flush(stdout())

### Name: ols_sbic
### Title: Sawa's bayesian information criterion
### Aliases: ols_sbic

### ** Examples

full_model <- lm(mpg ~ ., data = mtcars)
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_sbic(model, full_model)




cleanEx()
nameEx("ols_step_all_possible")
### * ols_step_all_possible

flush(stderr()); flush(stdout())

### Name: ols_step_all_possible
### Title: All possible regression
### Aliases: ols_step_all_possible ols_step_all_possible.default
###   plot.ols_step_all_possible

### ** Examples

model <- lm(mpg ~ disp + hp, data = mtcars)
k <- ols_step_all_possible(model)
k

# plot
plot(k)

# maximum subset
model <- lm(mpg ~ disp + hp + drat + wt + qsec, data = mtcars)
ols_step_all_possible(model, max_order = 3)




cleanEx()
nameEx("ols_step_all_possible_betas")
### * ols_step_all_possible_betas

flush(stderr()); flush(stdout())

### Name: ols_step_all_possible_betas
### Title: All possible regression variable coefficients
### Aliases: ols_step_all_possible_betas

### ** Examples

## Not run: 
##D model <- lm(mpg ~ disp + hp + wt, data = mtcars)
##D ols_step_all_possible_betas(model)
## End(Not run)




cleanEx()
nameEx("ols_step_backward_adj_r2")
### * ols_step_backward_adj_r2

flush(stderr()); flush(stdout())

### Name: ols_step_backward_adj_r2
### Title: Stepwise Adjusted R-Squared backward regression
### Aliases: ols_step_backward_adj_r2 ols_step_backward_adj_r2.default
###   plot.ols_step_backward_adj_r2

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_adj_r2(model)

# final model and selection metrics
k <- ols_step_backward_aic(model)
k$metrics
k$model

# include or exclude variable
# force variables to be included in the selection process
ols_step_backward_adj_r2(model, include = c("alc_mod", "gender"))

# use index of variable instead of name
ols_step_backward_adj_r2(model, include = c(7, 6))

# force variable to be excluded from selection process
ols_step_backward_adj_r2(model, exclude = c("alc_heavy", "bcs"))

# use index of variable instead of name
ols_step_backward_adj_r2(model, exclude = c(8, 1))




cleanEx()
nameEx("ols_step_backward_aic")
### * ols_step_backward_aic

flush(stderr()); flush(stdout())

### Name: ols_step_backward_aic
### Title: Stepwise AIC backward regression
### Aliases: ols_step_backward_aic ols_step_backward_aic.default
###   plot.ols_step_backward_aic

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_aic(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_aic(model)
plot(k)

# selection metrics
k$metrics
 
# final model
k$model

# include or exclude variable
# force variables to be included in the selection process
ols_step_backward_aic(model, include = c("alc_mod", "gender"))

# use index of variable instead of name
ols_step_backward_aic(model, include = c(7, 6))

# force variable to be excluded from selection process
ols_step_backward_aic(model, exclude = c("alc_heavy", "bcs"))

# use index of variable instead of name
ols_step_backward_aic(model, exclude = c(8, 1))




cleanEx()
nameEx("ols_step_backward_p")
### * ols_step_backward_p

flush(stderr()); flush(stdout())

### Name: ols_step_backward_p
### Title: Stepwise backward regression
### Aliases: ols_step_backward_p ols_step_backward_p.default
###   plot.ols_step_backward_p

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_p(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_p(model)
plot(k)

# selection metrics
k$metrics

# final model
k$model

# include or exclude variables
# force variable to be included in selection process
ols_step_backward_p(model, include = c("age", "alc_mod"))

# use index of variable instead of name
ols_step_backward_p(model, include = c(5, 7))

# force variable to be excluded from selection process
ols_step_backward_p(model, exclude = c("pindex"))

# use index of variable instead of name
ols_step_backward_p(model, exclude = c(2))

# hierarchical selection
model <- lm(y ~ bcs + alc_heavy + pindex + age + alc_mod, data = surgical)
ols_step_backward_p(model, 0.1, hierarchical = TRUE)

# plot
k <- ols_step_backward_p(model, 0.1, hierarchical = TRUE)
plot(k)




cleanEx()
nameEx("ols_step_backward_r2")
### * ols_step_backward_r2

flush(stderr()); flush(stdout())

### Name: ols_step_backward_r2
### Title: Stepwise R-Squared backward regression
### Aliases: ols_step_backward_r2 ols_step_backward_r2.default
###   plot.ols_step_backward_r2

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_r2(model)

# final model and selection metrics
k <- ols_step_backward_aic(model)
k$metrics
k$model

# include or exclude variable
# force variables to be included in the selection process
ols_step_backward_r2(model, include = c("alc_mod", "gender"))

# use index of variable instead of name
ols_step_backward_r2(model, include = c(7, 6))

# force variable to be excluded from selection process
ols_step_backward_r2(model, exclude = c("alc_heavy", "bcs"))

# use index of variable instead of name
ols_step_backward_r2(model, exclude = c(8, 1))




cleanEx()
nameEx("ols_step_backward_sbc")
### * ols_step_backward_sbc

flush(stderr()); flush(stdout())

### Name: ols_step_backward_sbc
### Title: Stepwise SBC backward regression
### Aliases: ols_step_backward_sbc ols_step_backward_sbc.default
###   plot.ols_step_backward_sbc

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_sbc(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_sbc(model)
plot(k)

# selection metrics
k$metrics

# final model
k$model

# include or exclude variable
# force variables to be included in the selection process
ols_step_backward_sbc(model, include = c("alc_mod", "gender"))

# use index of variable instead of name
ols_step_backward_sbc(model, include = c(7, 6))

# force variable to be excluded from selection process
ols_step_backward_sbc(model, exclude = c("alc_heavy", "bcs"))

# use index of variable instead of name
ols_step_backward_sbc(model, exclude = c(8, 1))




cleanEx()
nameEx("ols_step_backward_sbic")
### * ols_step_backward_sbic

flush(stderr()); flush(stdout())

### Name: ols_step_backward_sbic
### Title: Stepwise SBIC backward regression
### Aliases: ols_step_backward_sbic ols_step_backward_sbic.default
###   plot.ols_step_backward_sbic

### ** Examples

# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward_sbic(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward_sbic(model)
plot(k)

# selection metrics
k$metrics

# final model
k$model

# include or exclude variable
# force variables to be included in the selection process
ols_step_backward_sbic(model, include = c("alc_mod", "gender"))

# use index of variable instead of name
ols_step_backward_sbic(model, include = c(7, 6))

# force variable to be excluded from selection process
ols_step_backward_sbic(model, exclude = c("alc_heavy", "bcs"))

# use index of variable instead of name
ols_step_backward_sbic(model, exclude = c(8, 1))




cleanEx()
nameEx("ols_step_best_subset")
### * ols_step_best_subset

flush(stderr()); flush(stdout())

### Name: ols_step_best_subset
### Title: Best subsets regression
### Aliases: ols_step_best_subset ols_step_best_subset.default
###   plot.ols_step_best_subset

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_step_best_subset(model)
ols_step_best_subset(model, metric = "adjr")
ols_step_best_subset(model, metric = "cp")

# maximum subset
model <- lm(mpg ~ disp + hp + drat + wt + qsec, data = mtcars)
ols_step_best_subset(model, max_order = 3)

# plot
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
k <- ols_step_best_subset(model)
plot(k)

# return only models including `qsec`
ols_step_best_subset(model, include = c("qsec"))

# exclude `hp` from selection process
ols_step_best_subset(model, exclude = c("hp"))




cleanEx()
nameEx("ols_step_both_adj_r2")
### * ols_step_both_adj_r2

flush(stderr()); flush(stdout())

### Name: ols_step_both_adj_r2
### Title: Stepwise Adjusted R-Squared regression
### Aliases: ols_step_both_adj_r2 ols_step_both_adj_r2.default
###   plot.ols_step_both_adj_r2

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- lm(y ~ ., data = stepdata)
##D ols_step_both_adj_r2(model)
##D 
##D # stepwise regression plot
##D model <- lm(y ~ ., data = stepdata)
##D k <- ols_step_both_adj_r2(model)
##D plot(k)
##D 
##D # selection metrics
##D k$metrics
##D 
##D # final model
##D k$model
##D 
##D # include or exclude variables
##D # force variable to be included in selection process
##D model <- lm(y ~ ., data = stepdata)
##D 
##D ols_step_both_adj_r2(model, include = c("x6"))
##D 
##D # use index of variable instead of name
##D ols_step_both_adj_r2(model, include = c(6))
##D 
##D # force variable to be excluded from selection process
##D ols_step_both_adj_r2(model, exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_adj_r2(model, exclude = c(2))
##D 
##D # include & exclude variables in the selection process
##D ols_step_both_adj_r2(model, include = c("x6"), exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_adj_r2(model, include = c(6), exclude = c(2))
## End(Not run)




cleanEx()
nameEx("ols_step_both_aic")
### * ols_step_both_aic

flush(stderr()); flush(stdout())

### Name: ols_step_both_aic
### Title: Stepwise AIC regression
### Aliases: ols_step_both_aic ols_step_both_aic.default
###   plot.ols_step_both_aic

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- lm(y ~ ., data = stepdata)
##D ols_step_both_aic(model)
##D 
##D # stepwise regression plot
##D model <- lm(y ~ ., data = stepdata)
##D k <- ols_step_both_aic(model)
##D plot(k)
##D 
##D # selection metrics
##D k$metrics
##D 
##D # final model
##D k$model
##D 
##D # include or exclude variables
##D # force variable to be included in selection process
##D model <- lm(y ~ ., data = stepdata)
##D 
##D ols_step_both_aic(model, include = c("x6"))
##D 
##D # use index of variable instead of name
##D ols_step_both_aic(model, include = c(6))
##D 
##D # force variable to be excluded from selection process
##D ols_step_both_aic(model, exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_aic(model, exclude = c(2))
##D 
##D # include & exclude variables in the selection process
##D ols_step_both_aic(model, include = c("x6"), exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_aic(model, include = c(6), exclude = c(2))
## End(Not run)




cleanEx()
nameEx("ols_step_both_p")
### * ols_step_both_p

flush(stderr()); flush(stdout())

### Name: ols_step_both_p
### Title: Stepwise regression
### Aliases: ols_step_both_p ols_step_both_p.default plot.ols_step_both_p

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- lm(y ~ ., data = surgical)
##D ols_step_both_p(model)
##D 
##D # stepwise regression plot
##D model <- lm(y ~ ., data = surgical)
##D k <- ols_step_both_p(model)
##D plot(k)
##D 
##D # selection metrics
##D k$metrics
##D 
##D # final model
##D k$model
##D 
##D # include or exclude variables
##D model <- lm(y ~ ., data = stepdata)
##D 
##D # force variable to be included in selection process
##D ols_step_both_p(model, include = c("x6"))
##D 
##D # use index of variable instead of name
##D ols_step_both_p(model, include = c(6))
##D 
##D # force variable to be excluded from selection process
##D ols_step_both_p(model, exclude = c("x1"))
##D 
##D # use index of variable instead of name
##D ols_step_both_p(model, exclude = c(1))
## End(Not run)




cleanEx()
nameEx("ols_step_both_r2")
### * ols_step_both_r2

flush(stderr()); flush(stdout())

### Name: ols_step_both_r2
### Title: Stepwise R-Squared regression
### Aliases: ols_step_both_r2 ols_step_both_r2.default
###   plot.ols_step_both_r2

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- lm(y ~ ., data = stepdata)
##D ols_step_both_r2(model)
##D 
##D # stepwise regression plot
##D model <- lm(y ~ ., data = stepdata)
##D k <- ols_step_both_r2(model)
##D plot(k)
##D 
##D # selection metrics
##D k$metrics
##D 
##D # final model
##D k$model
##D 
##D # include or exclude variables
##D # force variable to be included in selection process
##D model <- lm(y ~ ., data = stepdata)
##D 
##D ols_step_both_r2(model, include = c("x6"))
##D 
##D # use index of variable instead of name
##D ols_step_both_r2(model, include = c(6))
##D 
##D # force variable to be excluded from selection process
##D ols_step_both_r2(model, exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_r2(model, exclude = c(2))
##D 
##D # include & exclude variables in the selection process
##D ols_step_both_r2(model, include = c("x6"), exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_r2(model, include = c(6), exclude = c(2))
## End(Not run)




cleanEx()
nameEx("ols_step_both_sbc")
### * ols_step_both_sbc

flush(stderr()); flush(stdout())

### Name: ols_step_both_sbc
### Title: Stepwise SBC regression
### Aliases: ols_step_both_sbc ols_step_both_sbc.default
###   plot.ols_step_both_sbc

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- lm(y ~ ., data = stepdata)
##D ols_step_both_sbc(model)
##D 
##D # stepwise regression plot
##D model <- lm(y ~ ., data = stepdata)
##D k <- ols_step_both_sbc(model)
##D plot(k)
##D 
##D # selection metrics
##D k$metrics
##D 
##D # final model
##D k$model
##D 
##D # include or exclude variables
##D # force variable to be included in selection process
##D model <- lm(y ~ ., data = stepdata)
##D 
##D ols_step_both_sbc(model, include = c("x6"))
##D 
##D # use index of variable instead of name
##D ols_step_both_sbc(model, include = c(6))
##D 
##D # force variable to be excluded from selection process
##D ols_step_both_sbc(model, exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_sbc(model, exclude = c(2))
##D 
##D # include & exclude variables in the selection process
##D ols_step_both_sbc(model, include = c("x6"), exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_sbc(model, include = c(6), exclude = c(2))
## End(Not run)




cleanEx()
nameEx("ols_step_both_sbic")
### * ols_step_both_sbic

flush(stderr()); flush(stdout())

### Name: ols_step_both_sbic
### Title: Stepwise SBIC regression
### Aliases: ols_step_both_sbic ols_step_both_sbic.default
###   plot.ols_step_both_sbic

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- lm(y ~ ., data = stepdata)
##D ols_step_both_sbic(model)
##D 
##D # stepwise regression plot
##D model <- lm(y ~ ., data = stepdata)
##D k <- ols_step_both_sbic(model)
##D plot(k)
##D 
##D # selection metrics
##D k$metrics
##D 
##D # final model
##D k$model
##D 
##D # include or exclude variables
##D # force variable to be included in selection process
##D model <- lm(y ~ ., data = stepdata)
##D 
##D ols_step_both_sbic(model, include = c("x6"))
##D 
##D # use index of variable instead of name
##D ols_step_both_sbic(model, include = c(6))
##D 
##D # force variable to be excluded from selection process
##D ols_step_both_sbic(model, exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_sbic(model, exclude = c(2))
##D 
##D # include & exclude variables in the selection process
##D ols_step_both_sbic(model, include = c("x6"), exclude = c("x2"))
##D 
##D # use index of variable instead of name
##D ols_step_both_sbic(model, include = c(6), exclude = c(2))
## End(Not run)




cleanEx()
nameEx("ols_step_forward_adj_r2")
### * ols_step_forward_adj_r2

flush(stderr()); flush(stdout())

### Name: ols_step_forward_adj_r2
### Title: Stepwise Adjusted R-Squared forward regression
### Aliases: ols_step_forward_adj_r2 ols_step_forward_adj_r2.default
###   plot.ols_step_forward_adj_r2

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_adj_r2(model)

# stepwise forward regression plot
k <- ols_step_forward_adj_r2(model)
plot(k)

# selection metrics
k$metrics

# extract final model
k$model

# include or exclude variables
# force variable to be included in selection process
ols_step_forward_adj_r2(model, include = c("age"))

# use index of variable instead of name
ols_step_forward_adj_r2(model, include = c(5))

# force variable to be excluded from selection process
ols_step_forward_adj_r2(model, exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_adj_r2(model, exclude = c(4))

# include & exclude variables in the selection process
ols_step_forward_adj_r2(model, include = c("age"), exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_adj_r2(model, include = c(5), exclude = c(4))




cleanEx()
nameEx("ols_step_forward_aic")
### * ols_step_forward_aic

flush(stderr()); flush(stdout())

### Name: ols_step_forward_aic
### Title: Stepwise AIC forward regression
### Aliases: ols_step_forward_aic ols_step_forward_aic.default
###   plot.ols_step_forward_aic

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_aic(model)

# stepwise forward regression plot
k <- ols_step_forward_aic(model)
plot(k)

# selection metrics
k$metrics

# extract final model
k$model

# include or exclude variables
# force variable to be included in selection process
ols_step_forward_aic(model, include = c("age"))

# use index of variable instead of name
ols_step_forward_aic(model, include = c(5))

# force variable to be excluded from selection process
ols_step_forward_aic(model, exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_aic(model, exclude = c(4))

# include & exclude variables in the selection process
ols_step_forward_aic(model, include = c("age"), exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_aic(model, include = c(5), exclude = c(4))




cleanEx()
nameEx("ols_step_forward_p")
### * ols_step_forward_p

flush(stderr()); flush(stdout())

### Name: ols_step_forward_p
### Title: Stepwise forward regression
### Aliases: ols_step_forward_p ols_step_forward_p.default
###   plot.ols_step_forward_p

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_p(model)

# stepwise forward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_forward_p(model)
plot(k)

# selection metrics
k$metrics

# final model
k$model

# include or exclude variables
# force variable to be included in selection process
ols_step_forward_p(model, include = c("age", "alc_mod"))

# use index of variable instead of name
ols_step_forward_p(model, include = c(5, 7))

# force variable to be excluded from selection process
ols_step_forward_p(model, exclude = c("pindex"))

# use index of variable instead of name
ols_step_forward_p(model, exclude = c(2))

# hierarchical selection
model <- lm(y ~ bcs + alc_heavy + pindex + enzyme_test, data = surgical)
ols_step_forward_p(model, 0.1, hierarchical = TRUE)

# plot
k <- ols_step_forward_p(model, 0.1, hierarchical = TRUE)
plot(k)




cleanEx()
nameEx("ols_step_forward_r2")
### * ols_step_forward_r2

flush(stderr()); flush(stdout())

### Name: ols_step_forward_r2
### Title: Stepwise R-Squared forward regression
### Aliases: ols_step_forward_r2 ols_step_forward_r2.default
###   plot.ols_step_forward_r2

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_r2(model)

# stepwise forward regression plot
k <- ols_step_forward_r2(model)
plot(k)

# selection metrics
k$metrics

# extract final model
k$model

# include or exclude variables
# force variable to be included in selection process
ols_step_forward_r2(model, include = c("age"))

# use index of variable instead of name
ols_step_forward_r2(model, include = c(5))

# force variable to be excluded from selection process
ols_step_forward_r2(model, exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_r2(model, exclude = c(4))

# include & exclude variables in the selection process
ols_step_forward_r2(model, include = c("age"), exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_r2(model, include = c(5), exclude = c(4))




cleanEx()
nameEx("ols_step_forward_sbc")
### * ols_step_forward_sbc

flush(stderr()); flush(stdout())

### Name: ols_step_forward_sbc
### Title: Stepwise SBC forward regression
### Aliases: ols_step_forward_sbc ols_step_forward_sbc.default
###   plot.ols_step_forward_sbc

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_sbc(model)

# stepwise forward regression plot
k <- ols_step_forward_sbc(model)
plot(k)

# selection metrics
k$metrics

# extract final model
k$model

# include or exclude variables
# force variable to be included in selection process
ols_step_forward_sbc(model, include = c("age"))

# use index of variable instead of name
ols_step_forward_sbc(model, include = c(5))

# force variable to be excluded from selection process
ols_step_forward_sbc(model, exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_sbc(model, exclude = c(4))

# include & exclude variables in the selection process
ols_step_forward_sbc(model, include = c("age"), exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_sbc(model, include = c(5), exclude = c(4))




cleanEx()
nameEx("ols_step_forward_sbic")
### * ols_step_forward_sbic

flush(stderr()); flush(stdout())

### Name: ols_step_forward_sbic
### Title: Stepwise SBIC forward regression
### Aliases: ols_step_forward_sbic ols_step_forward_sbic.default
###   plot.ols_step_forward_sbic

### ** Examples

# stepwise forward regression
model <- lm(y ~ ., data = surgical)
ols_step_forward_sbic(model)

# stepwise forward regression plot
k <- ols_step_forward_sbic(model)
plot(k)

# selection metrics
k$metrics

# extract final model
k$model

# include or exclude variables
# force variable to be included in selection process
ols_step_forward_sbic(model, include = c("age"))

# use index of variable instead of name
ols_step_forward_sbic(model, include = c(5))

# force variable to be excluded from selection process
ols_step_forward_sbic(model, exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_sbic(model, exclude = c(4))

# include & exclude variables in the selection process
ols_step_forward_sbic(model, include = c("age"), exclude = c("liver_test"))

# use index of variable instead of name
ols_step_forward_sbic(model, include = c(5), exclude = c(4))




cleanEx()
nameEx("ols_test_bartlett")
### * ols_test_bartlett

flush(stderr()); flush(stdout())

### Name: ols_test_bartlett
### Title: Bartlett test
### Aliases: ols_test_bartlett ols_test_bartlett.default

### ** Examples

# using grouping variable
if (require("descriptr")) {
  library(descriptr)
  ols_test_bartlett(mtcarz, 'mpg', group_var = 'cyl')
}

# using variables
ols_test_bartlett(hsb, 'read', 'write')




cleanEx()
nameEx("ols_test_breusch_pagan")
### * ols_test_breusch_pagan

flush(stderr()); flush(stdout())

### Name: ols_test_breusch_pagan
### Title: Breusch pagan test
### Aliases: ols_test_breusch_pagan

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)

# use fitted values of the model
ols_test_breusch_pagan(model)

# use independent variables of the model
ols_test_breusch_pagan(model, rhs = TRUE)

# use independent variables of the model and perform multiple tests
ols_test_breusch_pagan(model, rhs = TRUE, multiple = TRUE)

# bonferroni p value adjustment
ols_test_breusch_pagan(model, rhs = TRUE, multiple = TRUE, p.adj = 'bonferroni')

# sidak p value adjustment
ols_test_breusch_pagan(model, rhs = TRUE, multiple = TRUE, p.adj = 'sidak')

# holm's p value adjustment
ols_test_breusch_pagan(model, rhs = TRUE, multiple = TRUE, p.adj = 'holm')




cleanEx()
nameEx("ols_test_correlation")
### * ols_test_correlation

flush(stderr()); flush(stdout())

### Name: ols_test_correlation
### Title: Correlation test for normality
### Aliases: ols_test_correlation

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_correlation(model)




cleanEx()
nameEx("ols_test_f")
### * ols_test_f

flush(stderr()); flush(stdout())

### Name: ols_test_f
### Title: F test
### Aliases: ols_test_f

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)

# using fitted values
ols_test_f(model)

# using all predictors of the model
ols_test_f(model, rhs = TRUE)

# using fitted values
ols_test_f(model, vars = c('disp', 'hp'))




cleanEx()
nameEx("ols_test_normality")
### * ols_test_normality

flush(stderr()); flush(stdout())

### Name: ols_test_normality
### Title: Test for normality
### Aliases: ols_test_normality ols_test_normality.lm

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_normality(model)




cleanEx()
nameEx("ols_test_outlier")
### * ols_test_outlier

flush(stderr()); flush(stdout())

### Name: ols_test_outlier
### Title: Bonferroni Outlier Test
### Aliases: ols_test_outlier

### ** Examples

# model
model <- lm(y ~ ., data = surgical)
ols_test_outlier(model)




cleanEx()
nameEx("ols_test_score")
### * ols_test_score

flush(stderr()); flush(stdout())

### Name: ols_test_score
### Title: Score test
### Aliases: ols_test_score

### ** Examples

# model
model <- lm(mpg ~ disp + hp + wt, data = mtcars)

# using fitted values of the model
ols_test_score(model)

# using predictors from the model
ols_test_score(model, rhs = TRUE)

# specify predictors from the model
ols_test_score(model, vars = c('disp', 'wt'))




cleanEx()
nameEx("rvsr_plot_shiny")
### * rvsr_plot_shiny

flush(stderr()); flush(stdout())

### Name: rvsr_plot_shiny
### Title: Residual vs regressors plot for shiny app
### Aliases: rvsr_plot_shiny

### ** Examples

model <- lm(mpg ~ disp + hp + wt, data = mtcars)
rvsr_plot_shiny(model, mtcars, 'drat')




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
