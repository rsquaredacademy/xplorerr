pkgname <- "inferr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('inferr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("infer_binom_calc")
### * infer_binom_calc

flush(stderr()); flush(stdout())

### Name: infer_binom_calc
### Title: Binomial Test
### Aliases: infer_binom_calc infer_binom_test

### ** Examples

# using calculator
infer_binom_calc(32, 13, prob = 0.5)

# using data set
infer_binom_test(hsb, female, prob = 0.5)



cleanEx()
nameEx("infer_chisq_assoc_test")
### * infer_chisq_assoc_test

flush(stderr()); flush(stdout())

### Name: infer_chisq_assoc_test
### Title: Chi Square Test of Association
### Aliases: infer_chisq_assoc_test

### ** Examples

infer_chisq_assoc_test(hsb, female, schtyp)

infer_chisq_assoc_test(hsb, female, ses)



cleanEx()
nameEx("infer_chisq_gof_test")
### * infer_chisq_gof_test

flush(stderr()); flush(stdout())

### Name: infer_chisq_gof_test
### Title: Chi Square Goodness of Fit Test
### Aliases: infer_chisq_gof_test

### ** Examples

infer_chisq_gof_test(hsb, race, c(20, 20, 20, 140))

# apply continuity correction
infer_chisq_gof_test(hsb, race, c(20, 20, 20, 140), correct = TRUE)



cleanEx()
nameEx("infer_cochran_qtest")
### * infer_cochran_qtest

flush(stderr()); flush(stdout())

### Name: infer_cochran_qtest
### Title: Cochran Q Test
### Aliases: infer_cochran_qtest

### ** Examples

infer_cochran_qtest(exam, exam1, exam2, exam3)



cleanEx()
nameEx("infer_launch_shiny_app")
### * infer_launch_shiny_app

flush(stderr()); flush(stdout())

### Name: infer_launch_shiny_app
### Title: Launch Shiny App
### Aliases: infer_launch_shiny_app

### ** Examples

## Not run: 
##D infer_launch_shiny_app()
## End(Not run)



cleanEx()
nameEx("infer_levene_test")
### * infer_levene_test

flush(stderr()); flush(stdout())

### Name: infer_levene_test
### Title: Levene's test for equality of variances
### Aliases: infer_levene_test infer_levene_test.default

### ** Examples

# using grouping variable
infer_levene_test(hsb, read, group_var = race)

# using  variables
infer_levene_test(hsb, read, write, socst)




cleanEx()
nameEx("infer_mcnemar_test")
### * infer_mcnemar_test

flush(stderr()); flush(stdout())

### Name: infer_mcnemar_test
### Title: McNemar Test
### Aliases: infer_mcnemar_test

### ** Examples

# using variables from data
hb <- hsb
hb$himath <- ifelse(hsb$math > 60, 1, 0)
hb$hiread <- ifelse(hsb$read > 60, 1, 0)
infer_mcnemar_test(hb, himath, hiread)

# test if the proportion of students in himath and hiread group is same
himath <- ifelse(hsb$math > 60, 1, 0)
hiread <- ifelse(hsb$read > 60, 1, 0)
infer_mcnemar_test(table(himath, hiread))

# using matrix
infer_mcnemar_test(matrix(c(135, 18, 21, 26), nrow = 2))



cleanEx()
nameEx("infer_oneway_anova")
### * infer_oneway_anova

flush(stderr()); flush(stdout())

### Name: infer_oneway_anova
### Title: One Way ANOVA
### Aliases: infer_oneway_anova

### ** Examples

infer_oneway_anova(mtcars, mpg, cyl)
infer_oneway_anova(hsb, write, prog)



cleanEx()
nameEx("infer_os_prop_test")
### * infer_os_prop_test

flush(stderr()); flush(stdout())

### Name: infer_os_prop_test
### Title: One Sample Test of Proportion
### Aliases: infer_os_prop_test infer_os_prop_test.default

### ** Examples

# use as a calculator
infer_os_prop_test(200, prob = 0.5, phat = 0.3)

# using data set
infer_os_prop_test(hsb, female, prob = 0.5)



cleanEx()
nameEx("infer_os_t_test")
### * infer_os_t_test

flush(stderr()); flush(stdout())

### Name: infer_os_t_test
### Title: One Sample t Test
### Aliases: infer_os_t_test

### ** Examples

# lower tail
infer_os_t_test(hsb, write, mu = 50, alternative = 'less')

# upper tail
infer_os_t_test(hsb, write, mu = 50, alternative = 'greater')

# both tails
infer_os_t_test(hsb, write, mu = 50, alternative = 'both')

# all tails
infer_os_t_test(hsb, write, mu = 50, alternative = 'all')




cleanEx()
nameEx("infer_os_var_test")
### * infer_os_var_test

flush(stderr()); flush(stdout())

### Name: infer_os_var_test
### Title: One Sample Variance Comparison Test
### Aliases: infer_os_var_test

### ** Examples

# lower tail
infer_os_var_test(mtcars, mpg, 5, alternative = 'less')

# upper tail
infer_os_var_test(mtcars, mpg, 5, alternative = 'greater')

# both tails
infer_os_var_test(mtcars, mpg, 5, alternative = 'both')

# all tails
infer_os_var_test(mtcars, mpg, 5, alternative = 'all')



cleanEx()
nameEx("infer_runs_test")
### * infer_runs_test

flush(stderr()); flush(stdout())

### Name: infer_runs_test
### Title: Test for Random Order
### Aliases: infer_runs_test

### ** Examples

infer_runs_test(hsb, read)

infer_runs_test(hsb, read, drop = TRUE)

infer_runs_test(hsb, read, split = TRUE)

infer_runs_test(hsb, read, mean = TRUE)

infer_runs_test(hsb, read, threshold = 0)




cleanEx()
nameEx("infer_ts_ind_ttest")
### * infer_ts_ind_ttest

flush(stderr()); flush(stdout())

### Name: infer_ts_ind_ttest
### Title: Two Independent Sample t Test
### Aliases: infer_ts_ind_ttest

### ** Examples

# lower tail
infer_ts_ind_ttest(hsb, female, write, alternative = 'less')

# upper tail
infer_ts_ind_ttest(hsb, female, write, alternative = 'greater')

# both tails
infer_ts_ind_ttest(hsb, female, write, alternative = 'both')

# all tails
infer_ts_ind_ttest(hsb, female, write, alternative = 'all')



cleanEx()
nameEx("infer_ts_paired_ttest")
### * infer_ts_paired_ttest

flush(stderr()); flush(stdout())

### Name: infer_ts_paired_ttest
### Title: Paired t test
### Aliases: infer_ts_paired_ttest

### ** Examples

# lower tail
infer_ts_paired_ttest(hsb, read, write, alternative = 'less')

# upper tail
infer_ts_paired_ttest(hsb, read, write, alternative = 'greater')

# both tails
infer_ts_paired_ttest(hsb, read, write, alternative = 'both')

# all tails
infer_ts_paired_ttest(hsb, read, write, alternative = 'all')



cleanEx()
nameEx("infer_ts_prop_test")
### * infer_ts_prop_test

flush(stderr()); flush(stdout())

### Name: infer_ts_prop_test
### Title: Two Sample Test of Proportion
### Aliases: infer_ts_prop_test infer_ts_prop_calc infer_ts_prop_group

### ** Examples

# using variables
# lower tail
infer_ts_prop_test(treatment, treatment1, treatment2,
alternative = 'less')

# using groups
# lower tail
infer_ts_prop_group(treatment2, outcome, female,
alternative = 'less')

# using sample size and proportions
# lower tail
infer_ts_prop_calc(n1 = 30, n2 = 25, p1 = 0.3, p2 = 0.5, alternative = 'less')




cleanEx()
nameEx("infer_ts_var_test")
### * infer_ts_var_test

flush(stderr()); flush(stdout())

### Name: infer_ts_var_test
### Title: Two Sample Variance Comparison Test
### Aliases: infer_ts_var_test

### ** Examples

# using grouping variable
infer_ts_var_test(hsb, read, group_var = female, alternative = 'less')

# using two variables
infer_ts_var_test(hsb, read, write, alternative = 'less')




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
