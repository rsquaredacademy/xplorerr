cdplot <- function(model){

           cooksd <- cooks.distance(model)
            	  n <- length(cooksd)
	            ckd <- tibble(obs = seq_len(n), cd = cooksd)
               ts <- 4 / length(ckd$cd)
	      ckd$color <- ifelse(ckd$cd >= ts, c("outlier"), c("normal"))
	     ckd$color1 <- factor(ckd$color)
	ckd$Observation <- ordered(ckd$color1, levels = c("normal", "outlier"))
               ts <- 4 / length(ckd$cd)
	           maxx <- max(ckd$cd) + 0.1
           result <- list(ckd = ckd, maxx = maxx, ts = ts)
  return(result)

}
