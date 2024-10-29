context("test-visual")

test_that("output from vdist_binom_plot is as expected", {
  skip_on_cran()
  p <- vdist_binom_plot(10, 0.3)
  vdiffr::expect_doppelganger("binomial plot", p)
})

test_that("output from vdist_binom_prob is as expected", {
  skip_on_cran()

  p1 <- vdist_binom_prob(10, 0.3, 4, type = 'exact')
  vdiffr::expect_doppelganger("binomial prob exact", p1)

  p2 <- vdist_binom_prob(10, 0.3, 4, type = 'lower')
  vdiffr::expect_doppelganger("binomial prob lower", p2)

  p3 <- vdist_binom_prob(10, 0.3, 4, type = 'upper')
  vdiffr::expect_doppelganger("binomial prob upper", p3)

  p4 <- vdist_binom_prob(10, 0.3, c(4, 6), type = 'interval')
  vdiffr::expect_doppelganger("binomial prob interval", p4)
})

test_that("output from vdist_binom_perc is as expected", {
  skip_on_cran()

  p5 <- vdist_binom_perc(10, 0.5, 0.05)
  vdiffr::expect_doppelganger("binomial perc lower", p5)

  p6 <- vdist_binom_perc(10, 0.5, 0.05, "upper")
  vdiffr::expect_doppelganger("binomial perc upper", p6)
})

test_that("output from vdist_chisquare_plot is as expected", {
  skip_on_cran()

  p7 <- vdist_chisquare_plot()
  vdiffr::expect_doppelganger("chisquare plot 1", p7)

  p7a <- vdist_chisquare_plot(xaxis_range = 35)
  vdiffr::expect_doppelganger("chisquare plot 1a", p7a)

  p8 <- vdist_chisquare_plot(df = 5)
  vdiffr::expect_doppelganger("chisquare plot 2", p8)

  p9 <- vdist_chisquare_plot(df = 5, normal = TRUE)
  vdiffr::expect_doppelganger("chisquare plot 3", p9)
})

test_that("output from vdist_chisquare_perc is as expected", {
  skip_on_cran()

  p10 <- vdist_chisquare_perc(0.165, 8, 'lower')
  vdiffr::expect_doppelganger("chisquare perc lower", p10)

  p11 <- vdist_chisquare_perc(0.22, 13, 'upper')
  vdiffr::expect_doppelganger("chisquare perc upper", p11)
})

test_that("output from vdist_chisquare_prob is as expected", {
  skip_on_cran()

  p12 <-  vdist_chisquare_prob(13.58, 11, 'lower')
  vdiffr::expect_doppelganger("chisquare prob lower", p12)

  p13 <- vdist_chisquare_prob(15.72, 13, 'upper')
  vdiffr::expect_doppelganger("chisquare prob upper", p13)
})

test_that("output from vdist_f_plot is as expected", {
  skip_on_cran()

  p14 <- vdist_f_plot()
  vdiffr::expect_doppelganger("f plot 1", p14)

  p15 <- vdist_f_plot(6, 10, normal = TRUE)
  vdiffr::expect_doppelganger("f plot 2", p15)
})

test_that("output from vdist_f_perc is as expected", {
  skip_on_cran()

  p16 <- vdist_f_perc(0.95, 3, 30, 'lower')
  vdiffr::expect_doppelganger("f perc lower", p16)

  p17 <- vdist_f_perc(0.125, 9, 35, 'upper')
  vdiffr::expect_doppelganger("f perc upper", p17)
})

test_that("output from vdist_f_prob is as expected", {
  skip_on_cran()

  p18 <- vdist_f_prob(2.35, 5, 32)
  vdiffr::expect_doppelganger("f prob lower", p18)

  p19 <- vdist_f_prob(1.5222, 9, 35, type = "upper")
  vdiffr::expect_doppelganger("f prob upper", p19)
})

test_that("output from vdist_normal_plot is as expected", {
  skip_on_cran()

  p20 <- vdist_normal_plot()
  vdiffr::expect_doppelganger("normal plot 1", p20)

  p21 <- vdist_normal_plot(mean = 2, sd = 0.6)
  vdiffr::expect_doppelganger("normal plot 2", p21)
})

test_that("output from vdist_normal_perc is as expected", {
  skip_on_cran()

  p22 <- vdist_normal_perc(0.95, mean = 2, sd = 1.36)
  vdiffr::expect_doppelganger("normal perc lower", p22)

  p23 <- vdist_normal_perc(0.95, mean = 2, sd = 1.36, type = 'both')
  vdiffr::expect_doppelganger("normal perc both", p23)

  p24 <- vdist_normal_perc(0.3, mean = 2, sd = 1.36, type = 'upper')
  vdiffr::expect_doppelganger("normal perc upper", p24)

})

test_that("output from vdist_normal_prob is as expected", {
  skip_on_cran()

  p25 <- vdist_normal_prob(3.78, mean = 2, sd = 1.36)
  vdiffr::expect_doppelganger("normal prob lower", p25)

  p26 <- vdist_normal_prob(3.43, mean = 2, sd = 1.36, type = 'upper')
  vdiffr::expect_doppelganger("normal prob upper", p26)

  p27 <- vdist_normal_prob(c(-1.74, 1.83), type = 'both')
  vdiffr::expect_doppelganger("normal prob both", p27)
})

test_that("output from vdist_t_plot is as expected", {
  skip_on_cran()

  p28 <-  vdist_t_plot()
  vdiffr::expect_doppelganger("t plot 1", p28)

  p29 <- vdist_t_plot(6)
  vdiffr::expect_doppelganger("t plot 2", p29)

  p30 <- vdist_t_plot(df = 8)
  vdiffr::expect_doppelganger("t plot 3", p30)
})

test_that("output from vdist_t_perc is as expected", {
  skip_on_cran()

  p31 <- vdist_t_perc(probs = 0.95, df = 4, type = 'lower')
  vdiffr::expect_doppelganger("t perc lower", p31)

  p32 <- vdist_t_perc(probs = 0.35, df = 4, type = 'upper')
  vdiffr::expect_doppelganger("t perc upper", p32)

  p33 <- vdist_t_perc(probs = 0.69, df = 7, type = 'both')
  vdiffr::expect_doppelganger("t perc both", p33)
})

test_that("output from vdist_t_prob is as expected", {
  skip_on_cran()

  p34 <- vdist_t_prob(2.045, 7, 'lower')
  vdiffr::expect_doppelganger("t prob lower", p34)

  p35 <- vdist_t_prob(0.945, 7, 'upper')
  vdiffr::expect_doppelganger("t prob upper", p35)

  p36 <- vdist_t_prob(1.445, 7, 'interval')
  vdiffr::expect_doppelganger("t prob both", p36)

  p37 <- vdist_t_prob(1.6, 7, 'both')
  vdiffr::expect_doppelganger("t prob interval", p37)
})








