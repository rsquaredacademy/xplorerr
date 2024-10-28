Tests and Coverage
================
05 October, 2018 14:00:44

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                                    | Coverage (%) |
|:----------------------------------------------------------|:------------:|
| rfm                                                       |     58.63    |
| [R/rfm-launch-shiny-app.R](../R/rfm-launch-shiny-app.R)   |     0.00     |
| [R/rfm-plots.R](../R/rfm-plots.R)                         |     0.00     |
| [R/rfm-segment.R](../R/rfm-segment.R)                     |     22.22    |
| [R/rfm-plots-data.R](../R/rfm-plots-data.R)               |     48.39    |
| [R/rfm-table-customer.R](../R/rfm-table-customer.R)       |     93.85    |
| [R/rfm-table-customer-2.R](../R/rfm-table-customer-2.R)   |     94.12    |
| [R/rfm-table-transaction.R](../R/rfm-table-transaction.R) |     95.00    |
| [R/utils.R](../R/utils.R)                                 |    100.00    |

<br>

Unit Tests
----------

Unit Test summary is created using the [testthat](https://github.com/r-lib/testthat) package.

|                  | file                                          |    n|  time|  error|  failed|  skipped|  warning|
|------------------|:----------------------------------------------|----:|-----:|------:|-------:|--------:|--------:|
| test-rfm-plots.R | [test-rfm-plots.R](testthat/test-rfm-plots.R) |    7|  0.02|      0|       0|        7|        0|
| test-rfm-table.R | [test-rfm-table.R](testthat/test-rfm-table.R) |    3|  0.41|      0|       0|        0|        0|
| test-utils.R     | [test-utils.R](testthat/test-utils.R)         |    6|  0.52|      0|       0|        0|        0|

<details open> <summary> Show Detailed Test Results </summary>

| file                                              | context          | test                                               | status  |    n|  time|
|:--------------------------------------------------|:-----------------|:---------------------------------------------------|:--------|----:|-----:|
| [test-rfm-plots.R](testthat/test-rfm-plots.R#L5)  | test-rfm-plots.R | output from rfm\_bar\_chart is as expected         | SKIPPED |    1|  0.00|
| [test-rfm-plots.R](testthat/test-rfm-plots.R#L16) | test-rfm-plots.R | output from rfm\_rf\_plot is as expected           | SKIPPED |    1|  0.00|
| [test-rfm-plots.R](testthat/test-rfm-plots.R#L27) | test-rfm-plots.R | output from rfm\_rm\_plot is as expected           | SKIPPED |    1|  0.02|
| [test-rfm-plots.R](testthat/test-rfm-plots.R#L38) | test-rfm-plots.R | output from rfm\_fm\_plot is as expected           | SKIPPED |    1|  0.00|
| [test-rfm-plots.R](testthat/test-rfm-plots.R#L50) | test-rfm-plots.R | output from rfm\_heatmap is as expected            | SKIPPED |    1|  0.00|
| [test-rfm-plots.R](testthat/test-rfm-plots.R#L62) | test-rfm-plots.R | output from rfm\_histograms is as expected         | SKIPPED |    1|  0.00|
| [test-rfm-plots.R](testthat/test-rfm-plots.R#L74) | test-rfm-plots.R | output from rfm\_order\_dist is as expected        | SKIPPED |    1|  0.00|
| [test-rfm-table.R](testthat/test-rfm-table.R#L16) | rfm\_table       | output from rfm\_table\_order is as expected       | PASS    |    1|  0.11|
| [test-rfm-table.R](testthat/test-rfm-table.R#L34) | rfm\_table       | output from rfm\_table\_customer is as expected    | PASS    |    1|  0.13|
| [test-rfm-table.R](testthat/test-rfm-table.R#L52) | rfm\_table       | output from rfm\_table\_customer\_2 is as expected | PASS    |    1|  0.17|
| [test-utils.R](testthat/test-utils.R#L7)          | test-utils.R     | output from bins is as expected                    | PASS    |    1|  0.00|
| [test-utils.R](testthat/test-utils.R#L15)         | test-utils.R     | output from bins\_lower is as expected             | PASS    |    1|  0.02|
| [test-utils.R](testthat/test-utils.R#L22)         | test-utils.R     | output from bins\_upper is as expected             | PASS    |    1|  0.01|
| [test-utils.R](testthat/test-utils.R#L37)         | test-utils.R     | output from rfm\_heatmap\_data is as expected      | PASS    |    1|  0.14|
| [test-utils.R](testthat/test-utils.R#L51)         | test-utils.R     | output from check\_levels is as expected           | PASS    |    1|  0.16|
| [test-utils.R](testthat/test-utils.R#L72)         | test-utils.R     | output from modify\_rfm is as expected             | PASS    |    1|  0.19|

</details>

<details> <summary> Session Info </summary>

| Field    | Value                            |
|:---------|:---------------------------------|
| Version  | R version 3.5.1 (2018-07-02)     |
| Platform | x86\_64-w64-mingw32/x64 (64-bit) |
| Running  | Windows &gt;= 8 x64 (build 9200) |
| Language | English\_India                   |
| Timezone | Asia/Calcutta                    |

| Package  | Version |
|:---------|:--------|
| testthat | 2.0.0   |
| covr     | 3.2.0   |
| covrpage | 0.0.59  |

</details>

<!--- Final Status : skipped/warning --->
