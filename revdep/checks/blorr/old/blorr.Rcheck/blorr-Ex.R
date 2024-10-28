pkgname <- "blorr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('blorr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("blr_bivariate_analysis")
### * blr_bivariate_analysis

flush(stderr()); flush(stdout())

### Name: blr_bivariate_analysis
### Title: Bivariate analysis
### Aliases: blr_bivariate_analysis blr_bivariate_analysis.default

### ** Examples

blr_bivariate_analysis(hsb2, honcomp, female, prog, race, schtyp)




cleanEx()
nameEx("blr_coll_diag")
### * blr_coll_diag

flush(stderr()); flush(stdout())

### Name: blr_coll_diag
### Title: Collinearity diagnostics
### Aliases: blr_coll_diag blr_vif_tol blr_eigen_cindex

### ** Examples

# model
model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

# vif and tolerance
blr_vif_tol(model)

# eigenvalues and condition indices
blr_eigen_cindex(model)

# collinearity diagnostics
blr_coll_diag(model)




cleanEx()
nameEx("blr_confusion_matrix")
### * blr_confusion_matrix

flush(stderr()); flush(stdout())

### Name: blr_confusion_matrix
### Title: Confusion matrix
### Aliases: blr_confusion_matrix blr_confusion_matrix.default

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_confusion_matrix(model, cutoff = 0.4)




cleanEx()
nameEx("blr_decile_capture_rate")
### * blr_decile_capture_rate

flush(stderr()); flush(stdout())

### Name: blr_decile_capture_rate
### Title: Event rate by decile
### Aliases: blr_decile_capture_rate

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_decile_capture_rate(gt)




cleanEx()
nameEx("blr_decile_lift_chart")
### * blr_decile_lift_chart

flush(stderr()); flush(stdout())

### Name: blr_decile_lift_chart
### Title: Decile lift chart
### Aliases: blr_decile_lift_chart

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_decile_lift_chart(gt)




cleanEx()
nameEx("blr_gains_table")
### * blr_gains_table

flush(stderr()); flush(stdout())

### Name: blr_gains_table
### Title: Gains table & lift chart
### Aliases: blr_gains_table plot.blr_gains_table

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
# gains table
blr_gains_table(model)

# lift chart
k <- blr_gains_table(model)
plot(k)




cleanEx()
nameEx("blr_gini_index")
### * blr_gini_index

flush(stderr()); flush(stdout())

### Name: blr_gini_index
### Title: Gini index
### Aliases: blr_gini_index

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_gini_index(model)




cleanEx()
nameEx("blr_ks_chart")
### * blr_ks_chart

flush(stderr()); flush(stdout())

### Name: blr_ks_chart
### Title: KS chart
### Aliases: blr_ks_chart

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_ks_chart(gt)




cleanEx()
nameEx("blr_launch_app")
### * blr_launch_app

flush(stderr()); flush(stdout())

### Name: blr_launch_app
### Title: Launch shiny app
### Aliases: blr_launch_app

### ** Examples

## Not run: 
##D blr_launch_app()
## End(Not run)



cleanEx()
nameEx("blr_linktest")
### * blr_linktest

flush(stderr()); flush(stdout())

### Name: blr_linktest
### Title: Model specification error
### Aliases: blr_linktest

### ** Examples


model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_linktest(model)




cleanEx()
nameEx("blr_lorenz_curve")
### * blr_lorenz_curve

flush(stderr()); flush(stdout())

### Name: blr_lorenz_curve
### Title: Lorenz curve
### Aliases: blr_lorenz_curve

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_lorenz_curve(model)




cleanEx()
nameEx("blr_model_fit_stats")
### * blr_model_fit_stats

flush(stderr()); flush(stdout())

### Name: blr_model_fit_stats
### Title: Model fit statistics
### Aliases: blr_model_fit_stats

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_model_fit_stats(model)




cleanEx()
nameEx("blr_multi_model_fit_stats")
### * blr_multi_model_fit_stats

flush(stderr()); flush(stdout())

### Name: blr_multi_model_fit_stats
### Title: Multi model fit statistics
### Aliases: blr_multi_model_fit_stats blr_multi_model_fit_stats.default

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

model2 <- glm(honcomp ~ female + read + math, data = hsb2,
family = binomial(link = 'logit'))

blr_multi_model_fit_stats(model, model2)




cleanEx()
nameEx("blr_pairs")
### * blr_pairs

flush(stderr()); flush(stdout())

### Name: blr_pairs
### Title: Concordant & discordant pairs
### Aliases: blr_pairs

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_pairs(model)




cleanEx()
nameEx("blr_plot_c_fitted")
### * blr_plot_c_fitted

flush(stderr()); flush(stdout())

### Name: blr_plot_c_fitted
### Title: CI Displacement C vs fitted values plot
### Aliases: blr_plot_c_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_c_fitted(model)




cleanEx()
nameEx("blr_plot_c_leverage")
### * blr_plot_c_leverage

flush(stderr()); flush(stdout())

### Name: blr_plot_c_leverage
### Title: CI Displacement C vs leverage plot
### Aliases: blr_plot_c_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_c_leverage(model)




cleanEx()
nameEx("blr_plot_deviance_fitted")
### * blr_plot_deviance_fitted

flush(stderr()); flush(stdout())

### Name: blr_plot_deviance_fitted
### Title: Deviance vs fitted values plot
### Aliases: blr_plot_deviance_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_deviance_fitted(model)




cleanEx()
nameEx("blr_plot_deviance_residual")
### * blr_plot_deviance_residual

flush(stderr()); flush(stdout())

### Name: blr_plot_deviance_residual
### Title: Deviance residual values
### Aliases: blr_plot_deviance_residual

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_deviance_residual(model)




cleanEx()
nameEx("blr_plot_dfbetas_panel")
### * blr_plot_dfbetas_panel

flush(stderr()); flush(stdout())

### Name: blr_plot_dfbetas_panel
### Title: DFBETAs panel
### Aliases: blr_plot_dfbetas_panel

### ** Examples

## Not run: 
##D model <- glm(honcomp ~ female + read + science, data = hsb2,
##D family = binomial(link = 'logit'))
##D 
##D blr_plot_dfbetas_panel(model)
## End(Not run)




cleanEx()
nameEx("blr_plot_diag_c")
### * blr_plot_diag_c

flush(stderr()); flush(stdout())

### Name: blr_plot_diag_c
### Title: CI Displacement C plot
### Aliases: blr_plot_diag_c

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_c(model)




cleanEx()
nameEx("blr_plot_diag_cbar")
### * blr_plot_diag_cbar

flush(stderr()); flush(stdout())

### Name: blr_plot_diag_cbar
### Title: CI Displacement CBAR plot
### Aliases: blr_plot_diag_cbar

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_cbar(model)




cleanEx()
nameEx("blr_plot_diag_difchisq")
### * blr_plot_diag_difchisq

flush(stderr()); flush(stdout())

### Name: blr_plot_diag_difchisq
### Title: Delta chisquare plot
### Aliases: blr_plot_diag_difchisq

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_difchisq(model)




cleanEx()
nameEx("blr_plot_diag_difdev")
### * blr_plot_diag_difdev

flush(stderr()); flush(stdout())

### Name: blr_plot_diag_difdev
### Title: Delta deviance plot
### Aliases: blr_plot_diag_difdev

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_difdev(model)




cleanEx()
nameEx("blr_plot_diag_fit")
### * blr_plot_diag_fit

flush(stderr()); flush(stdout())

### Name: blr_plot_diag_fit
### Title: Fitted values diagnostics plot
### Aliases: blr_plot_diag_fit

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_fit(model)




cleanEx()
nameEx("blr_plot_diag_influence")
### * blr_plot_diag_influence

flush(stderr()); flush(stdout())

### Name: blr_plot_diag_influence
### Title: Influence diagnostics plot
### Aliases: blr_plot_diag_influence

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_influence(model)




cleanEx()
nameEx("blr_plot_diag_leverage")
### * blr_plot_diag_leverage

flush(stderr()); flush(stdout())

### Name: blr_plot_diag_leverage
### Title: Leverage diagnostics plot
### Aliases: blr_plot_diag_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_diag_leverage(model)




cleanEx()
nameEx("blr_plot_difchisq_fitted")
### * blr_plot_difchisq_fitted

flush(stderr()); flush(stdout())

### Name: blr_plot_difchisq_fitted
### Title: Delta chi square vs fitted values plot
### Aliases: blr_plot_difchisq_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difchisq_fitted(model)




cleanEx()
nameEx("blr_plot_difchisq_leverage")
### * blr_plot_difchisq_leverage

flush(stderr()); flush(stdout())

### Name: blr_plot_difchisq_leverage
### Title: Delta chi square vs leverage plot
### Aliases: blr_plot_difchisq_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difchisq_leverage(model)




cleanEx()
nameEx("blr_plot_difdev_fitted")
### * blr_plot_difdev_fitted

flush(stderr()); flush(stdout())

### Name: blr_plot_difdev_fitted
### Title: Delta deviance vs fitted values plot
### Aliases: blr_plot_difdev_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difdev_fitted(model)




cleanEx()
nameEx("blr_plot_difdev_leverage")
### * blr_plot_difdev_leverage

flush(stderr()); flush(stdout())

### Name: blr_plot_difdev_leverage
### Title: Delta deviance vs leverage plot
### Aliases: blr_plot_difdev_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_difdev_leverage(model)




cleanEx()
nameEx("blr_plot_fitted_leverage")
### * blr_plot_fitted_leverage

flush(stderr()); flush(stdout())

### Name: blr_plot_fitted_leverage
### Title: Fitted values vs leverage plot
### Aliases: blr_plot_fitted_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_fitted_leverage(model)




cleanEx()
nameEx("blr_plot_leverage")
### * blr_plot_leverage

flush(stderr()); flush(stdout())

### Name: blr_plot_leverage
### Title: Leverage plot
### Aliases: blr_plot_leverage

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_leverage(model)




cleanEx()
nameEx("blr_plot_leverage_fitted")
### * blr_plot_leverage_fitted

flush(stderr()); flush(stdout())

### Name: blr_plot_leverage_fitted
### Title: Leverage vs fitted values plot
### Aliases: blr_plot_leverage_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_leverage_fitted(model)




cleanEx()
nameEx("blr_plot_pearson_residual")
### * blr_plot_pearson_residual

flush(stderr()); flush(stdout())

### Name: blr_plot_pearson_residual
### Title: Residual values plot
### Aliases: blr_plot_pearson_residual

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_pearson_residual(model)




cleanEx()
nameEx("blr_plot_residual_fitted")
### * blr_plot_residual_fitted

flush(stderr()); flush(stdout())

### Name: blr_plot_residual_fitted
### Title: Residual vs fitted values plot
### Aliases: blr_plot_residual_fitted

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_plot_residual_fitted(model)




cleanEx()
nameEx("blr_prep_dcrate_data")
### * blr_prep_dcrate_data

flush(stderr()); flush(stdout())

### Name: blr_prep_dcrate_data
### Title: Decile capture rate data
### Aliases: blr_prep_dcrate_data

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_prep_dcrate_data(gt)




cleanEx()
nameEx("blr_prep_kschart_data")
### * blr_prep_kschart_data

flush(stderr()); flush(stdout())

### Name: blr_prep_kschart_data
### Title: KS Chart data
### Aliases: blr_prep_kschart_data blr_prep_kschart_line
###   blr_prep_ksannotate_y blr_prep_kschart_stat blr_prep_ksannotate_x

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_prep_kschart_data(gt)
ks_line <- blr_prep_kschart_line(gt)
blr_prep_kschart_stat(ks_line)
blr_prep_ksannotate_y(ks_line)
blr_prep_ksannotate_x(ks_line)




cleanEx()
nameEx("blr_prep_lchart_gmean")
### * blr_prep_lchart_gmean

flush(stderr()); flush(stdout())

### Name: blr_prep_lchart_gmean
### Title: Lift Chart data
### Aliases: blr_prep_lchart_gmean blr_prep_lchart_data

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
globalmean <- blr_prep_lchart_gmean(gt)
blr_prep_lchart_data(gt, globalmean)




cleanEx()
nameEx("blr_prep_lorenz_data")
### * blr_prep_lorenz_data

flush(stderr()); flush(stdout())

### Name: blr_prep_lorenz_data
### Title: Lorenz curve data
### Aliases: blr_prep_lorenz_data

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
data <- model$data
blr_prep_lorenz_data(model, data, FALSE)




cleanEx()
nameEx("blr_prep_roc_data")
### * blr_prep_roc_data

flush(stderr()); flush(stdout())

### Name: blr_prep_roc_data
### Title: ROC curve data
### Aliases: blr_prep_roc_data

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
gt <- blr_gains_table(model)
blr_prep_roc_data(gt)




cleanEx()
nameEx("blr_regress")
### * blr_regress

flush(stderr()); flush(stdout())

### Name: blr_regress
### Title: Binary logistic regression
### Aliases: blr_regress blr_regress.glm

### ** Examples

# using formula
blr_regress(object = honcomp ~ female + read + science, data = hsb2)

# using a model built with glm
model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))

blr_regress(model)

# odds ratio estimates
blr_regress(model, odd_conf_limit = TRUE)




cleanEx()
nameEx("blr_residual_diagnostics")
### * blr_residual_diagnostics

flush(stderr()); flush(stdout())

### Name: blr_residual_diagnostics
### Title: Residual diagnostics
### Aliases: blr_residual_diagnostics

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_residual_diagnostics(model)




cleanEx()
nameEx("blr_roc_curve")
### * blr_roc_curve

flush(stderr()); flush(stdout())

### Name: blr_roc_curve
### Title: ROC curve
### Aliases: blr_roc_curve

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
k <- blr_gains_table(model)
blr_roc_curve(k)




cleanEx()
nameEx("blr_rsq_adj_count")
### * blr_rsq_adj_count

flush(stderr()); flush(stdout())

### Name: blr_rsq_adj_count
### Title: Adjusted count R2
### Aliases: blr_rsq_adj_count

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_adj_count(model)




cleanEx()
nameEx("blr_rsq_count")
### * blr_rsq_count

flush(stderr()); flush(stdout())

### Name: blr_rsq_count
### Title: Count R2
### Aliases: blr_rsq_count

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_count(model)




cleanEx()
nameEx("blr_rsq_cox_snell")
### * blr_rsq_cox_snell

flush(stderr()); flush(stdout())

### Name: blr_rsq_cox_snell
### Title: Cox Snell R2
### Aliases: blr_rsq_cox_snell

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_cox_snell(model)




cleanEx()
nameEx("blr_rsq_effron")
### * blr_rsq_effron

flush(stderr()); flush(stdout())

### Name: blr_rsq_effron
### Title: Effron R2
### Aliases: blr_rsq_effron

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_effron(model)




cleanEx()
nameEx("blr_rsq_mcfadden")
### * blr_rsq_mcfadden

flush(stderr()); flush(stdout())

### Name: blr_rsq_mcfadden
### Title: McFadden's R2
### Aliases: blr_rsq_mcfadden

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_mcfadden(model)




cleanEx()
nameEx("blr_rsq_mcfadden_adj")
### * blr_rsq_mcfadden_adj

flush(stderr()); flush(stdout())

### Name: blr_rsq_mcfadden_adj
### Title: McFadden's adjusted R2
### Aliases: blr_rsq_mcfadden_adj

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_mcfadden_adj(model)




cleanEx()
nameEx("blr_rsq_mckelvey_zavoina")
### * blr_rsq_mckelvey_zavoina

flush(stderr()); flush(stdout())

### Name: blr_rsq_mckelvey_zavoina
### Title: McKelvey Zavoina R2
### Aliases: blr_rsq_mckelvey_zavoina

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_mckelvey_zavoina(model)




cleanEx()
nameEx("blr_rsq_nagelkerke")
### * blr_rsq_nagelkerke

flush(stderr()); flush(stdout())

### Name: blr_rsq_nagelkerke
### Title: Cragg-Uhler (Nagelkerke) R2
### Aliases: blr_rsq_nagelkerke

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_nagelkerke(model)




cleanEx()
nameEx("blr_segment")
### * blr_segment

flush(stderr()); flush(stdout())

### Name: blr_segment
### Title: Event rate
### Aliases: blr_segment blr_segment.default

### ** Examples

blr_segment(hsb2, honcomp, prog)




cleanEx()
nameEx("blr_segment_dist")
### * blr_segment_dist

flush(stderr()); flush(stdout())

### Name: blr_segment_dist
### Title: Response distribution
### Aliases: blr_segment_dist plot.blr_segment_dist

### ** Examples

k <- blr_segment_dist(hsb2, honcomp, prog)
k

# plot
plot(k)




cleanEx()
nameEx("blr_segment_twoway")
### * blr_segment_twoway

flush(stderr()); flush(stdout())

### Name: blr_segment_twoway
### Title: Two way event rate
### Aliases: blr_segment_twoway blr_segment_twoway.default

### ** Examples

blr_segment_twoway(hsb2, honcomp, prog, female)




cleanEx()
nameEx("blr_step_aic_backward")
### * blr_step_aic_backward

flush(stderr()); flush(stdout())

### Name: blr_step_aic_backward
### Title: Stepwise AIC backward elimination
### Aliases: blr_step_aic_backward blr_step_aic_backward.default
###   plot.blr_step_aic_backward

### ** Examples

## Not run: 
##D model <- glm(honcomp ~ female + read + science + math + prog + socst,
##D data = hsb2, family = binomial(link = 'logit'))
##D 
##D # elimination summary
##D blr_step_aic_backward(model)
##D 
##D # print details of each step
##D blr_step_aic_backward(model, details = TRUE)
##D 
##D # plot
##D plot(blr_step_aic_backward(model))
##D 
##D # final model
##D k <- blr_step_aic_backward(model)
##D k$model
##D 
## End(Not run)




cleanEx()
nameEx("blr_step_aic_both")
### * blr_step_aic_both

flush(stderr()); flush(stdout())

### Name: blr_step_aic_both
### Title: Stepwise AIC selection
### Aliases: blr_step_aic_both plot.blr_step_aic_both

### ** Examples

## Not run: 
##D model <- glm(y ~ ., data = stepwise)
##D 
##D # selection summary
##D blr_step_aic_both(model)
##D 
##D # print details at each step
##D blr_step_aic_both(model, details = TRUE)
##D 
##D # plot
##D plot(blr_step_aic_both(model))
##D 
##D # final model
##D k <- blr_step_aic_both(model)
##D k$model
##D 
## End(Not run)




cleanEx()
nameEx("blr_step_aic_forward")
### * blr_step_aic_forward

flush(stderr()); flush(stdout())

### Name: blr_step_aic_forward
### Title: Stepwise AIC forward selection
### Aliases: blr_step_aic_forward blr_step_aic_forward.default
###   plot.blr_step_aic_forward

### ** Examples

## Not run: 
##D model <- glm(honcomp ~ female + read + science, data = hsb2,
##D family = binomial(link = 'logit'))
##D 
##D # selection summary
##D blr_step_aic_forward(model)
##D 
##D # print details of each step
##D blr_step_aic_forward(model, details = TRUE)
##D 
##D # plot
##D plot(blr_step_aic_forward(model))
##D 
##D # final model
##D k <- blr_step_aic_forward(model)
##D k$model
##D 
## End(Not run)




cleanEx()
nameEx("blr_step_p_backward")
### * blr_step_p_backward

flush(stderr()); flush(stdout())

### Name: blr_step_p_backward
### Title: Stepwise backward regression
### Aliases: blr_step_p_backward blr_step_p_backward.default
###   plot.blr_step_p_backward

### ** Examples

## Not run: 
##D # stepwise backward regression
##D model <- glm(honcomp ~ female + read + science + math + prog + socst,
##D   data = hsb2, family = binomial(link = 'logit'))
##D blr_step_p_backward(model)
##D 
##D # stepwise backward regression plot
##D model <- glm(honcomp ~ female + read + science + math + prog + socst,
##D   data = hsb2, family = binomial(link = 'logit'))
##D k <- blr_step_p_backward(model)
##D plot(k)
##D 
##D # final model
##D k$model
##D 
## End(Not run)





cleanEx()
nameEx("blr_step_p_both")
### * blr_step_p_both

flush(stderr()); flush(stdout())

### Name: blr_step_p_both
### Title: Stepwise regression
### Aliases: blr_step_p_both blr_step_p_both.default plot.blr_step_p_both

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- glm(y ~ ., data = stepwise)
##D blr_step_p_both(model)
##D 
##D # stepwise regression plot
##D model <- glm(y ~ ., data = stepwise)
##D k <- blr_step_p_both(model)
##D plot(k)
##D 
##D # final model
##D k$model
##D 
## End(Not run)




cleanEx()
nameEx("blr_step_p_forward")
### * blr_step_p_forward

flush(stderr()); flush(stdout())

### Name: blr_step_p_forward
### Title: Stepwise forward regression
### Aliases: blr_step_p_forward blr_step_p_forward.default
###   plot.blr_step_p_forward

### ** Examples

## Not run: 
##D # stepwise forward regression
##D model <- glm(honcomp ~ female + read + science, data = hsb2,
##D   family = binomial(link = 'logit'))
##D blr_step_p_forward(model)
##D 
##D # stepwise forward regression plot
##D model <- glm(honcomp ~ female + read + science, data = hsb2,
##D   family = binomial(link = 'logit'))
##D k <- blr_step_p_forward(model)
##D plot(k)
##D 
##D # final model
##D k$model
##D 
## End(Not run)




cleanEx()
nameEx("blr_test_hosmer_lemeshow")
### * blr_test_hosmer_lemeshow

flush(stderr()); flush(stdout())

### Name: blr_test_hosmer_lemeshow
### Title: Hosmer lemeshow test
### Aliases: blr_test_hosmer_lemeshow

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))

blr_test_hosmer_lemeshow(model)




cleanEx()
nameEx("blr_test_lr")
### * blr_test_lr

flush(stderr()); flush(stdout())

### Name: blr_test_lr
### Title: Likelihood ratio test
### Aliases: blr_test_lr blr_test_lr.default

### ** Examples

# compare full model with intercept only model
# full model
model_1 <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_test_lr(model_1)

# compare full model with nested model
# nested model
model_2 <- glm(honcomp ~ female + read, data = hsb2,
            family = binomial(link = 'logit'))

blr_test_lr(model_1, model_2)





cleanEx()
nameEx("blr_woe_iv")
### * blr_woe_iv

flush(stderr()); flush(stdout())

### Name: blr_woe_iv
### Title: WoE & IV
### Aliases: blr_woe_iv plot.blr_woe_iv

### ** Examples

# woe and iv
k <- blr_woe_iv(hsb2, female, honcomp)
k

# plot woe
plot(k)




cleanEx()
nameEx("blr_woe_iv_stats")
### * blr_woe_iv_stats

flush(stderr()); flush(stdout())

### Name: blr_woe_iv_stats
### Title: Multi variable WOE & IV
### Aliases: blr_woe_iv_stats

### ** Examples

blr_woe_iv_stats(hsb2, honcomp, prog, race, female, schtyp)




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
