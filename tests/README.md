Tests and Coverage
================
22 April, 2019 11:14:22

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| whereami                            |    25.56     |
| [R/breadcrumb.R](../R/breadcrumb.R) |     0.00     |
| [R/counter.R](../R/counter.R)       |    21.74     |
| [R/print.R](../R/print.R)           |    25.00     |
| [R/whereami.R](../R/whereami.R)     |    41.18     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                      |  n |  time | error | failed | skipped | warning |
| :---------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-console.R](testthat/test-console.R) |  2 | 0.013 |     0 |      0 |       0 |       0 |
| [test-counter.R](testthat/test-counter.R) | 11 | 0.077 |     0 |      0 |       0 |       0 |
| [test-source.R](testthat/test-source.R)   |  3 | 0.048 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                          | context               | test                                    | status | n |  time |
| :-------------------------------------------- | :-------------------- | :-------------------------------------- | :----- | -: | ----: |
| [test-console.R](testthat/test-console.R#L9)  | console functionality | console functionality: class            | PASS   | 1 | 0.012 |
| [test-console.R](testthat/test-console.R#L13) | console functionality | console functionality: value            | PASS   | 1 | 0.001 |
| [test-counter.R](testthat/test-counter.R#L8)  | counter functionality | counter flow: no counter exists         | PASS   | 1 | 0.002 |
| [test-counter.R](testthat/test-counter.R#L14) | counter functionality | counter flow: initial                   | PASS   | 1 | 0.030 |
| [test-counter.R](testthat/test-counter.R#L18) | counter functionality | counter flow: check counter was created | PASS   | 1 | 0.001 |
| [test-counter.R](testthat/test-counter.R#L22) | counter functionality | counter flow: counter name              | PASS   | 1 | 0.002 |
| [test-counter.R](testthat/test-counter.R#L26) | counter functionality | counter flow: counter bump              | PASS   | 1 | 0.018 |
| [test-counter.R](testthat/test-counter.R#L30) | counter functionality | counter flow: counter state             | PASS   | 1 | 0.003 |
| [test-counter.R](testthat/test-counter.R#L34) | counter functionality | counter flow: cat\_whereami             | PASS   | 1 | 0.016 |
| [test-counter.R](testthat/test-counter.R#L38) | counter functionality | counter flow: multiple counter states   | PASS   | 1 | 0.001 |
| [test-counter.R](testthat/test-counter.R#L42) | counter functionality | counter flow: multiple counter names    | PASS   | 1 | 0.001 |
| [test-counter.R](testthat/test-counter.R#L47) | counter functionality | counter flow: reset item                | PASS   | 1 | 0.001 |
| [test-counter.R](testthat/test-counter.R#L52) | counter functionality | counter flow: reset all                 | PASS   | 1 | 0.002 |
| [test-source.R](testthat/test-source.R#L8)    | source functionality  | source calls: direct call               | PASS   | 1 | 0.013 |
| [test-source.R](testthat/test-source.R#L12)   | source functionality  | source calls: path expand               | PASS   | 1 | 0.016 |
| [test-source.R](testthat/test-source.R#L16)   | source functionality  | source calls: print                     | PASS   | 1 | 0.019 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.5.1 (2018-07-02)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS 10.14.4                       |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.1   |
| covr     | 3.2.1   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
