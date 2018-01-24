response_var <- function(model) {

  model %>%
    use_series(terms) %>%
    extract2(2)

}

# name of the data set
data_name <- function(model) {

  model %>%
    use_series(call) %>%
    extract2(4)

}

# number of observations
data_nrows <- function(model) {

  model %>%
    use_series(data) %>%
    nrow

}

# model convergence status
converge_status <- function(model) {

  model %>%
    use_series(converged)

}

# residual degrees of freedom
residual_df <- function(model) {

  model %>%
    use_series(df.residual)

}

# model degrees of freedom
model_df <- function(model) {

  model %>%
    use_series(df.null)

}

# response profile
resp_profile <- function(model) {

  resp <- model %>%
    response_var

  model %>%
    use_series(data) %>%
    pull(!!resp) %>%
    as.factor %>%
    table

}


# analysis of maximum likelihood estimates
predictor_names <- function(model) {

  model %>%
    use_series(coefficients) %>%
    names

}

# model df
predictor_df <- function(model) {

  model %>%
    use_series(rank) %>%
    rep_len(x = 1)

}

# model estimate
predictor_est <- function(model) {

  model %>%
    use_series(coefficients) %>%
    unname

}

# extract columns from model summary
predictor_mine <- function(model, col_name = NULL) {

  model %>%
    summary %>%
    use_series(coefficients) %>%
    extract(, col_name) %>%
    unname

}

# standard error
predictor_se <- function(model) {
  predictor_mine(model, 'Std. Error')
}

# z value
predictor_zval <- function(model) {
  predictor_mine(model, 'z value')
}

# p values
predictor_pval <- function(model) {
  predictor_mine(model, 'Pr(>|z|)')
}

# odds ratio estimate
# odds ratio effects
odds_effect <- function(model) {

  model %>%
    coef %>%
    names %>%
    extract(-1)

}

# odds ratio point estimates
odds_point <- function(model) {

  model %>%
    coef %>%
    exp %>%
    extract(-1) %>%
    unname

}

# odds ratio confidence intervals
odds_conf_limit <- function(model) {

  model %>%
    confint %>%
    as_tibble %>%
    slice(2:n()) %>%
    exp

}

# -2 log likelihood
mll <- function(model) {

  model %>%
    logLik %>%
    `[`(1) %>%
    multiply_by(-2)

}

# model class
model_class <- function(model) {

  model %>%
    class %>%
    extract(1)

}

# create intercept only model
i_model <- function(model) {

  dep <- response_var(model)

  dat <- model %>%
    use_series(data) 

  glm(glue(dep, ' ~ 1'), data = dat,
      family = binomial(link = 'logit'))

}

# model dfs
model_d_f <- function(model) {

  model %>%
    use_series(coefficients) %>%
    length

}

# extract log likelihood from blr_lr_test
extract_ll <- function(model, n = 1) {

  blr_lr_test(model) %>%
    use_series(model_info) %>%
    pull(log_lik) %>%
    extract(n)

}

# log likelihood
model_ll <- function(model) {

  model %>%
    logLik %>%
    extract(1)

}

# output formatting
fc <- function(x, w) {
    x <- as.character(x)
    ret <- format(x, width = w, justify = "centre")
    return(ret)
}

fs <- function() {
    x <- rep("  ")
    return(x)
}

fs1 <- function() {
    x <- rep("    ")
    return(x)
}

fs2 <- function() {
    x <- rep("     ")
    return(x)
}

fs3 <- function() {
    x <- rep("      ")
    return(x)
}

fs4 <- function() {
    x <- rep("         ")
    return(x)
}

f16 <- function() {
  x <- rep('                ')
  return(x)
}

fg <- function(x, w) {
    z <- as.character(x)
    y <- format(z, width = w, justify = 'right')
    return(y)
}

fw <- function(x, w) {
    z <- format(as.character(x), width = w, justify = 'right')
    return(z)
}

fl <- function(x, w) {
    x <- as.character(x)
    ret <- format(x, width = w, justify = "left")
    return(ret)
}


# collinearity diagnostics
fmrsq <- function(nam, data, i) {
  fm <- as.formula(paste0('`', nam[i], '` ', "~ ."))
  m1 <- lm(fm, data = data)
  rsq <- 1 - (summary(m1)$r.squared)
  return(rsq)
}

viftol <- function(model) {
  m    <- tibble::as_data_frame(model.matrix(model))[-1]
  nam  <- names(m)
  p    <- length(model$coefficients) - 1
  tol  <- c()

  for (i in seq_len(p)) {
    tol[i]  <- fmrsq(nam, m, i)
  }

  vifs <- 1 / tol

  result <- list(nam = names(m), tol = tol, vifs = vifs)
  return(result)
}


evalue <- function(x) {

  y <- x
  colnames(y)[1] <- "intercept"
  z <- scale(y, scale = T, center = F)
  tu <- t(z) %*% z
  e <- eigen(tu / diag(tu))$values

  result <- list(e = e, pvdata = z)

  return(result)

}


cindx <- function(e) {
  return(sqrt(e[1] / e))
}


pveindex <- function(z) {
  svdx <- svd(z)
  phi <- svdx$v %*% diag(1/svdx$d)
  ph <- t(phi ^ 2)
  pv <- prop.table(ph %*% diag(rowSums(ph, 1)), 2)
  return(pv)
}


mod_sel_data <- function(model) {
    model %>%
      use_series(data)
}