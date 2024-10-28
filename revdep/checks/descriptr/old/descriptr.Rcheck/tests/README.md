Tests and Coverage
================
22 January, 2019 12:11:56

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                                | Coverage (%) |
| :---------------------------------------------------- | :----------: |
| descriptr                                             |    78.19     |
| [R/ds-launch-shiny-app.R](../R/ds-launch-shiny-app.R) |     0.00     |
| [R/zzz.R](../R/zzz.R)                                 |     5.56     |
| [R/ds-plots.R](../R/ds-plots.R)                       |    41.84     |
| [R/ds-freq-table.R](../R/ds-freq-table.R)             |    56.25     |
| [R/ds-freq-factor.R](../R/ds-freq-factor.R)           |    65.33     |
| [R/ds-freq-numeric.R](../R/ds-freq-numeric.R)         |    66.67     |
| [R/ds-cross-table.R](../R/ds-cross-table.R)           |    67.13     |
| [R/ds-multistats.R](../R/ds-multistats.R)             |    71.43     |
| [R/ds-screener.R](../R/ds-screener.R)                 |    71.64     |
| [R/ds-group-summary.R](../R/ds-group-summary.R)       |    74.07     |
| [R/ds-freq-mult.R](../R/ds-freq-mult.R)               |    86.79     |
| [R/ds-mult-table.R](../R/ds-mult-table.R)             |    87.93     |
| [R/ds-utils.R](../R/ds-utils.R)                       |    91.77     |
| [R/ds-output.R](../R/ds-output.R)                     |    92.49     |
| [R/ds-auto-summary.R](../R/ds-auto-summary.R)         |    93.65     |
| [R/ds-describe.R](../R/ds-describe.R)                 |    97.86     |
| [R/ds-summary-stats.R](../R/ds-summary-stats.R)       |    98.48     |
| [R/dist-binomial.R](../R/dist-binomial.R)             |    100.00    |
| [R/dist-chisquare.R](../R/dist-chisquare.R)           |    100.00    |
| [R/dist-f.R](../R/dist-f.R)                           |    100.00    |
| [R/dist-normal.R](../R/dist-normal.R)                 |    100.00    |
| [R/dist-t.R](../R/dist-t.R)                           |    100.00    |
| [R/ds-cross-mult.R](../R/ds-cross-mult.R)             |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

|                      | file                                                  |  n |  time | error | failed | skipped | warning |
| -------------------- | :---------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| test-auto-summary.R  | [test-auto-summary.R](testthat/test-auto-summary.R)   | 14 | 13.33 |     0 |      0 |       0 |       0 |
| test-binom-dist.R    | [test-binom-dist.R](testthat/test-binom-dist.R)       |  3 | 11.81 |     0 |      0 |       0 |       0 |
| test-chi-dist.R      | [test-chi-dist.R](testthat/test-chi-dist.R)           |  3 |  8.64 |     0 |      0 |       0 |       0 |
| test-cross-table.R   | [test-cross-table.R](testthat/test-cross-table.R)     | 29 | 10.16 |     0 |      0 |       1 |       0 |
| test-describe.R      | [test-describe.R](testthat/test-describe.R)           | 97 | 12.70 |     0 |      0 |       0 |       0 |
| test-f-dist.R        | [test-f-dist.R](testthat/test-f-dist.R)               |  3 |  5.75 |     0 |      0 |       0 |       0 |
| test-freq-table.R    | [test-freq-table.R](testthat/test-freq-table.R)       | 16 |  0.41 |     0 |      0 |       2 |       0 |
| test-group-summary.R | [test-group-summary.R](testthat/test-group-summary.R) |  9 |  2.67 |     0 |      0 |       1 |       0 |
| test-multistats.R    | [test-multistats.R](testthat/test-multistats.R)       |  1 |  0.33 |     0 |      0 |       0 |       0 |
| test-normal-dist.R   | [test-normal-dist.R](testthat/test-normal-dist.R)     |  3 |  7.08 |     0 |      0 |       0 |       0 |
| test-output.R        | [test-output.R](testthat/test-output.R)               |  7 |  3.24 |     0 |      0 |       0 |       0 |
| test-plots.R         | [test-plots.R](testthat/test-plots.R)                 | 21 | 31.72 |     0 |      0 |       0 |       0 |
| test-screen.R        | [test-screen.R](testthat/test-screen.R)               | 14 |  1.05 |     0 |      0 |       0 |       0 |
| test-summary-stats.R | [test-summary-stats.R](testthat/test-summary-stats.R) |  3 |  1.54 |     0 |      0 |       0 |       0 |
| test-t-dist.R        | [test-t-dist.R](testthat/test-t-dist.R)               |  3 |  4.26 |     0 |      0 |       0 |       0 |
| test-utils.R         | [test-utils.R](testthat/test-utils.R)                 | 35 |  0.42 |     0 |      0 |       0 |       0 |

<details open>

<summary> Show Detailed Test Results
</summary>

| file                                                          | context            | test                                                       | status  |  n | time |
| :------------------------------------------------------------ | :----------------- | :--------------------------------------------------------- | :------ | -: | ---: |
| [test-auto-summary.R](testthat/test-auto-summary.R#L7)        | test-auto-summary  | ds\_auto\_summary throws errors as expected                | PASS    |  2 | 2.18 |
| [test-auto-summary.R](testthat/test-auto-summary.R#L12)       | test-auto-summary  | ds\_auto\_group\_summary throws errors as expected         | PASS    |  4 | 3.72 |
| [test-auto-summary.R](testthat/test-auto-summary.R#L19)       | test-auto-summary  | ds\_auto\_freq\_table throws errors as expected            | PASS    |  2 | 1.85 |
| [test-auto-summary.R](testthat/test-auto-summary.R#L24)       | test-auto-summary  | ds\_auto\_cross\_table throws errors as expected           | PASS    |  3 | 2.80 |
| [test-auto-summary.R](testthat/test-auto-summary.R#L94)       | test-auto-summary  | output from ds\_auto\_summary is as expected               | PASS    |  1 | 1.42 |
| [test-auto-summary.R](testthat/test-auto-summary.R#L124)      | test-auto-summary  | output from ds\_auto\_group\_summary is as expected        | PASS    |  1 | 1.00 |
| [test-auto-summary.R](testthat/test-auto-summary.R#L168)      | test-auto-summary  | output from ds\_auto\_cross\_table is as expected          | PASS    |  1 | 0.36 |
| [test-binom-dist.R](testthat/test-binom-dist.R#L4)            | binom\_dist        | dist\_binom\_plot throws the appropriate warning           | PASS    |  1 | 6.67 |
| [test-binom-dist.R](testthat/test-binom-dist.R#L8)            | binom\_dist        | dist\_binom\_prob throws the appropriate warning           | PASS    |  1 | 3.06 |
| [test-binom-dist.R](testthat/test-binom-dist.R#L12)           | binom\_dist        | dist\_binom\_perc throws the appropriate warning           | PASS    |  1 | 2.08 |
| [test-chi-dist.R](testthat/test-chi-dist.R#L4)                | chi-dist           | dist\_chi\_plot throws the appropriate warning             | PASS    |  1 | 0.21 |
| [test-chi-dist.R](testthat/test-chi-dist.R#L8)                | chi-dist           | dist\_chi\_prob throws the appropriate warning             | PASS    |  1 | 5.19 |
| [test-chi-dist.R](testthat/test-chi-dist.R#L12)               | chi-dist           | dist\_chi\_perc throws the appropriate warning             | PASS    |  1 | 3.24 |
| [test-cross-table.R](testthat/test-cross-table.R#L6)          | ds\_cross\_table   | output from ds\_cross\_table matches expected results      | PASS    | 21 | 0.79 |
| [test-cross-table.R](testthat/test-cross-table.R#L51)         | ds\_cross\_table   | ouput from plot.ds\_cross\_table matches expected output   | SKIPPED |  1 | 0.01 |
| [test-cross-table.R](testthat/test-cross-table.R#L72)         | ds\_cross\_table   | ds\_cross\_table throws appropriate error                  | PASS    |  3 | 3.29 |
| [test-cross-table.R](testthat/test-cross-table.R#L81)         | ds\_cross\_table   | output from ds\_twoway\_table is as expected               | PASS    |  1 | 0.19 |
| [test-cross-table.R](testthat/test-cross-table.R#L87)         | ds\_cross\_table   | ds\_twoway\_table throws appropriate error                 | PASS    |  3 | 5.88 |
| [test-describe.R](testthat/test-describe.R#L4)                | describe           | output from ds\_tailobs match expected result              | PASS    |  2 | 0.16 |
| [test-describe.R](testthat/test-describe.R#L10)               | describe           | ds\_tailobs returns the appropriate error                  | PASS    |  5 | 0.09 |
| [test-describe.R](testthat/test-describe.R#L19)               | describe           | output from ds\_rindex match expected result               | PASS    |  4 | 0.14 |
| [test-describe.R](testthat/test-describe.R#L27)               | describe           | ds\_rindex returns the appropriate error                   | PASS    |  3 | 0.09 |
| [test-describe.R](testthat/test-describe.R#L34)               | describe           | output from ds\_skewness matches expected result           | PASS    |  6 | 0.11 |
| [test-describe.R](testthat/test-describe.R#L44)               | describe           | ds\_skewness returns the appropriate error                 | PASS    |  2 | 0.05 |
| [test-describe.R](testthat/test-describe.R#L50)               | describe           | output from ds\_kurtosis matches expected result           | PASS    |  6 | 0.27 |
| [test-describe.R](testthat/test-describe.R#L60)               | describe           | ds\_kurtosis returns the appropriate error                 | PASS    |  2 | 0.04 |
| [test-describe.R](testthat/test-describe.R#L66)               | describe           | ds\_css matches `Sum Sq` from anova                        | PASS    |  6 | 0.63 |
| [test-describe.R](testthat/test-describe.R#L76)               | describe           | ds\_css returns the appropriate error                      | PASS    |  2 | 0.04 |
| [test-describe.R](testthat/test-describe.R#L82)               | describe           | output from ds\_cvar matches the expected result           | PASS    |  2 | 0.08 |
| [test-describe.R](testthat/test-describe.R#L88)               | describe           | ds\_cvar returns the appropriate error                     | PASS    |  2 | 0.10 |
| [test-describe.R](testthat/test-describe.R#L94)               | describe           | output from ds\_mode matches the expected result           | PASS    |  6 | 0.54 |
| [test-describe.R](testthat/test-describe.R#L104)              | describe           | ds\_mode returns the appropriate error                     | PASS    |  2 | 0.02 |
| [test-describe.R](testthat/test-describe.R#L110)              | describe           | output from ds\_range matches the expected result          | PASS    |  6 | 0.11 |
| [test-describe.R](testthat/test-describe.R#L120)              | describe           | ds\_range returns the appropriate error                    | PASS    |  2 | 0.01 |
| [test-describe.R](testthat/test-describe.R#L126)              | describe           | output from ds\_mdev matches the expected result           | PASS    |  6 | 0.13 |
| [test-describe.R](testthat/test-describe.R#L136)              | describe           | output from ds\_mdev matches the expected result           | PASS    |  2 | 0.01 |
| [test-describe.R](testthat/test-describe.R#L141)              | describe           | ds\_mdev returns the appropriate error                     | PASS    |  2 | 0.02 |
| [test-describe.R](testthat/test-describe.R#L147)              | describe           | output from ds\_hmean matches the expected output          | PASS    |  3 | 0.06 |
| [test-describe.R](testthat/test-describe.R#L153)              | describe           | ds\_hmean throws the appropriate error                     | PASS    |  2 | 0.01 |
| [test-describe.R](testthat/test-describe.R#L159)              | describe           | output from ds\_gmean matches the expected output          | PASS    |  3 | 0.05 |
| [test-describe.R](testthat/test-describe.R#L166)              | describe           | ds\_gmean throws the appropriate error                     | PASS    |  2 | 0.02 |
| [test-describe.R](testthat/test-describe.R#L174)              | describe           | output from ds\_measures\_location is as expected          | PASS    |  1 | 0.54 |
| [test-describe.R](testthat/test-describe.R#L182)              | describe           | output from ds\_measures\_location is as expected          | PASS    |  1 | 0.27 |
| [test-describe.R](testthat/test-describe.R#L189)              | describe           | ds\_measures\_location throws appropriate errors           | PASS    |  1 | 1.06 |
| [test-describe.R](testthat/test-describe.R#L196)              | describe           | ds\_measures\_location throws appropriate errors           | PASS    |  1 | 1.28 |
| [test-describe.R](testthat/test-describe.R#L204)              | describe           | output from ds\_measures\_variation is as expected         | PASS    |  1 | 0.11 |
| [test-describe.R](testthat/test-describe.R#L212)              | describe           | output from ds\_measures\_variation is as expected         | PASS    |  1 | 0.06 |
| [test-describe.R](testthat/test-describe.R#L219)              | describe           | ds\_measures\_variation throws appropriate errors          | PASS    |  1 | 0.97 |
| [test-describe.R](testthat/test-describe.R#L226)              | describe           | ds\_measures\_variation throws appropriate errors          | PASS    |  1 | 0.82 |
| [test-describe.R](testthat/test-describe.R#L234)              | describe           | output from ds\_measures\_symmetry is as expected          | PASS    |  1 | 0.04 |
| [test-describe.R](testthat/test-describe.R#L242)              | describe           | output from ds\_measures\_symmetry is as expected          | PASS    |  1 | 0.03 |
| [test-describe.R](testthat/test-describe.R#L249)              | describe           | ds\_measures\_symmetry throws appropriate errors           | PASS    |  1 | 0.80 |
| [test-describe.R](testthat/test-describe.R#L256)              | describe           | ds\_measures\_symmetry throws appropriate errors           | PASS    |  1 | 0.72 |
| [test-describe.R](testthat/test-describe.R#L264)              | describe           | output from ds\_percentiles is as expected                 | PASS    |  1 | 0.11 |
| [test-describe.R](testthat/test-describe.R#L272)              | describe           | output from ds\_percentiles is as expected                 | PASS    |  1 | 0.08 |
| [test-describe.R](testthat/test-describe.R#L279)              | describe           | ds\_percentiles throws appropriate errors                  | PASS    |  1 | 0.75 |
| [test-describe.R](testthat/test-describe.R#L286)              | describe           | ds\_percentiles throws appropriate errors                  | PASS    |  1 | 0.82 |
| [test-describe.R](testthat/test-describe.R#L294)              | describe           | output from ds\_extreme\_obs is as expected                | PASS    |  1 | 0.04 |
| [test-describe.R](testthat/test-describe.R#L301)              | describe           | ds\_extreme\_obs throws appropriate errors                 | PASS    |  1 | 0.76 |
| [test-describe.R](testthat/test-describe.R#L307)              | describe           | ds\_extreme\_obs throws appropriate errors                 | PASS    |  1 | 0.66 |
| [test-f-dist.R](testthat/test-f-dist.R#L5)                    | f-dist             | dist\_f\_plot throws the appropriate warning               | PASS    |  1 | 1.85 |
| [test-f-dist.R](testthat/test-f-dist.R#L9)                    | f-dist             | dist\_f\_prob throws the appropriate warning               | PASS    |  1 | 2.23 |
| [test-f-dist.R](testthat/test-f-dist.R#L13)                   | f-dist             | dist\_f\_perc throws the appropriate warning               | PASS    |  1 | 1.67 |
| [test-freq-table.R](testthat/test-freq-table.R#L5)            | freq\_table        | output from ds\_freq\_table matches expected results       | PASS    |  6 | 0.27 |
| [test-freq-table.R](testthat/test-freq-table.R#L15)           | freq\_table        | output from ds\_freq\_table plot is as expected            | SKIPPED |  1 | 0.00 |
| [test-freq-table.R](testthat/test-freq-table.R#L24)           | freq\_table        | output from ds\_freq\_cont matches expected result         | PASS    |  8 | 0.14 |
| [test-freq-table.R](testthat/test-freq-table.R#L35)           | freq\_table        | output from ds\_freq\_table plot is as expected            | SKIPPED |  1 | 0.00 |
| [test-group-summary.R](testthat/test-group-summary.R#L14)     | ds\_group\_summary | output from ds\_group\_summary matches the expected result | PASS    |  6 | 0.57 |
| [test-group-summary.R](testthat/test-group-summary.R#L40_L43) | ds\_group\_summary | ds\_group\_summary throws the appropriate error            | PASS    |  2 | 2.10 |
| [test-group-summary.R](testthat/test-group-summary.R#L52)     | ds\_group\_summary | output from ds\_group\_summary plot is as expected         | SKIPPED |  1 | 0.00 |
| [test-multistats.R](testthat/test-multistats.R#L8)            | multistats         | output from multistats is as expected                      | PASS    |  1 | 0.33 |
| [test-normal-dist.R](testthat/test-normal-dist.R#L4)          | normal-dist        | dist\_norm\_plot throws the appropriate warning            | PASS    |  1 | 2.25 |
| [test-normal-dist.R](testthat/test-normal-dist.R#L8)          | normal-dist        | dist\_norm\_prob throws the appropriate warning            | PASS    |  1 | 2.31 |
| [test-normal-dist.R](testthat/test-normal-dist.R#L12)         | normal-dist        | dist\_norm\_perc throws the appropriate warning            | PASS    |  1 | 2.52 |
| [test-output.R](testthat/test-output.R#L41)                   | print              | output from print\_cross matches expected output           | PASS    |  1 | 0.21 |
| [test-output.R](testthat/test-output.R#L70)                   | print              | output from print\_screener matches expected output        | PASS    |  1 | 0.15 |
| [test-output.R](testthat/test-output.R#L91)                   | print              | output from print\_fcont matches the expected result       | PASS    |  1 | 0.33 |
| [test-output.R](testthat/test-output.R#L109)                  | print              | output from freq\_table matches the expected result        | PASS    |  1 | 0.19 |
| [test-output.R](testthat/test-output.R#L137)                  | print              | output from group\_summary matches the expected result     | PASS    |  1 | 0.95 |
| [test-output.R](testthat/test-output.R#L210)                  | print              | output from print\_ftable2 matches the expected result     | PASS    |  1 | 0.74 |
| [test-output.R](testthat/test-output.R#L300)                  | print              | output from print\_cross2 matches the expected result      | PASS    |  1 | 0.67 |
| [test-plots.R](testthat/test-plots.R#L7)                      | test-plots         | ds\_plot\_scatter throws errors as expected                | PASS    |  3 | 3.18 |
| [test-plots.R](testthat/test-plots.R#L13)                     | test-plots         | ds\_plot\_histogram throws errors as expected              | PASS    |  2 | 2.04 |
| [test-plots.R](testthat/test-plots.R#L18)                     | test-plots         | ds\_plot\_density throws errors as expected                | PASS    |  2 | 1.83 |
| [test-plots.R](testthat/test-plots.R#L23)                     | test-plots         | ds\_plot\_bar throws errors as expected                    | PASS    |  2 | 2.20 |
| [test-plots.R](testthat/test-plots.R#L28)                     | test-plots         | ds\_plot\_box\_single throws errors as expected            | PASS    |  2 | 2.83 |
| [test-plots.R](testthat/test-plots.R#L33)                     | test-plots         | ds\_plot\_bar\_stacked throws errors as expected           | PASS    |  3 | 6.53 |
| [test-plots.R](testthat/test-plots.R#L39)                     | test-plots         | ds\_plot\_bar\_grouped throws errors as expected           | PASS    |  3 | 6.70 |
| [test-plots.R](testthat/test-plots.R#L45)                     | test-plots         | ds\_plot\_box\_group throws errors as expected             | PASS    |  4 | 6.41 |
| [test-screen.R](testthat/test-screen.R#L9)                    | ds\_screener       | output from ds\_screener matches the expected result       | PASS    | 13 | 0.27 |
| [test-screen.R](testthat/test-screen.R#L48)                   | ds\_screener       | ds\_screener throws the appropriate error                  | PASS    |  1 | 0.78 |
| [test-summary-stats.R](testthat/test-summary-stats.R#L7)      | test-summary-stats | output from ds\_summary is as expected                     | PASS    |  1 | 0.05 |
| [test-summary-stats.R](testthat/test-summary-stats.R#L13)     | test-summary-stats | ds\_summary\_stats throws appropriate errors               | PASS    |  2 | 1.49 |
| [test-t-dist.R](testthat/test-t-dist.R#L4)                    | t-dist             | dist\_t\_plot throws the appropriate warning               | PASS    |  1 | 0.95 |
| [test-t-dist.R](testthat/test-t-dist.R#L8)                    | t-dist             | dist\_t\_prob throws the appropriate warning               | PASS    |  1 | 1.74 |
| [test-t-dist.R](testthat/test-t-dist.R#L12)                   | t-dist             | dist\_t\_perc throws the appropriate warning               | PASS    |  1 | 1.57 |
| [test-utils.R](testthat/test-utils.R#L4)                      | utils              | output from formatc matches the expected result            | PASS    |  2 | 0.05 |
| [test-utils.R](testthat/test-utils.R#L10)                     | utils              | output from formatl matches the expected result            | PASS    |  2 | 0.06 |
| [test-utils.R](testthat/test-utils.R#L16)                     | utils              | output from formatr matches the expected result            | PASS    |  1 | 0.02 |
| [test-utils.R](testthat/test-utils.R#L21)                     | utils              | output from formats matches the expected result            | PASS    |  1 | 0.01 |
| [test-utils.R](testthat/test-utils.R#L26)                     | utils              | output from formatnc matches the expected result           | PASS    |  1 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L31)                     | utils              | output from format\_gap matches the expected result        | PASS    |  1 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L36)                     | utils              | output from formatol matches the expected result           | PASS    |  2 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L42)                     | utils              | output from l matches the expected result                  | PASS    |  3 | 0.04 |
| [test-utils.R](testthat/test-utils.R#L49)                     | utils              | output from percent matches the expected result            | PASS    |  2 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L55)                     | utils              | output from formata matches the expected result            | PASS    |  1 | 0.04 |
| [test-utils.R](testthat/test-utils.R#L60)                     | utils              | output from formatas matches the expected result           | PASS    |  1 | 0.01 |
| [test-utils.R](testthat/test-utils.R#L65)                     | utils              | output from formatter\_freq matches the expected result    | PASS    |  1 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L72)                     | utils              | output from row\_pct matches the expected result           | PASS    |  1 | 0.02 |
| [test-utils.R](testthat/test-utils.R#L79)                     | utils              | output from col\_pct matches the expected result           | PASS    |  1 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L84)                     | utils              | output from formatter matches the expected result          | PASS    |  1 | 0.01 |
| [test-utils.R](testthat/test-utils.R#L89)                     | utils              | output from fround matches the expected result             | PASS    |  1 | 0.02 |
| [test-utils.R](testthat/test-utils.R#L94)                     | utils              | output form xmm matches the expected result                | PASS    |  1 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L98)                     | utils              | output from seql matches the expected result               | PASS    |  1 | 0.01 |
| [test-utils.R](testthat/test-utils.R#L102)                    | utils              | output form xmmp matches the expected result               | PASS    |  2 | 0.02 |
| [test-utils.R](testthat/test-utils.R#L107)                    | utils              | output from seqlp matches the expected result              | PASS    |  2 | 0.02 |
| [test-utils.R](testthat/test-utils.R#L113)                    | utils              | output form xmn matches the expected result                | PASS    |  1 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L117)                    | utils              | output from seqln matches the expected result              | PASS    |  1 | 0.01 |
| [test-utils.R](testthat/test-utils.R#L123)                    | utils              | output from intervals matches expected result              | PASS    |  1 | 0.02 |
| [test-utils.R](testthat/test-utils.R#L128_L131)               | utils              | output from freq matches the expected result               | PASS    |  1 | 0.00 |
| [test-utils.R](testthat/test-utils.R#L135)                    | utils              | output from stat\_uss matches the expected result          | PASS    |  1 | 0.01 |
| [test-utils.R](testthat/test-utils.R#L140)                    | utils              | output from div\_by matches the expected result            | PASS    |  1 | 0.05 |
| [test-utils.R](testthat/test-utils.R#L144)                    | utils              | output from uss is as expected                             | PASS    |  1 | 0.00 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                            |
| :------- | :------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)     |
| Platform | x86\_64-w64-mingw32/x64 (64-bit) |
| Running  | Windows \>= 8 x64 (build 9200)   |
| Language | English\_India                   |
| Timezone | Asia/Calcutta                    |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.1   |
| covr     | 3.2.1   |
| covrpage | 0.0.59  |

</details>

<!--- Final Status : skipped/warning --->
