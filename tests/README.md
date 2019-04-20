Tests and Coverage
================
20 April, 2019 11:59:31

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| whereami                            |     2.22     |
| [R/breadcrumb.R](../R/breadcrumb.R) |     0.00     |
| [R/print.R](../R/print.R)           |     0.00     |
| [R/whereami.R](../R/whereami.R)     |     0.00     |
| [R/counter.R](../R/counter.R)       |     8.70     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                        | n |  time | error | failed | skipped | warning |
| :------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| [test-whereami.R](testthat/test-whereami.R) | 7 | 0.122 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                            | context               | test                                    | status | n |  time |
| :---------------------------------------------- | :-------------------- | :-------------------------------------- | :----- | -: | ----: |
| [test-whereami.R](testthat/test-whereami.R#L7)  | counter functionality | counter flow: no counter exists         | PASS   | 1 | 0.014 |
| [test-whereami.R](testthat/test-whereami.R#L13) | counter functionality | counter flow: initial                   | PASS   | 1 | 0.024 |
| [test-whereami.R](testthat/test-whereami.R#L17) | counter functionality | counter flow: check counter was created | PASS   | 1 | 0.059 |
| [test-whereami.R](testthat/test-whereami.R#L21) | counter functionality | counter flow: counter name              | PASS   | 1 | 0.002 |
| [test-whereami.R](testthat/test-whereami.R#L25) | counter functionality | counter flow: counter bump              | PASS   | 1 | 0.020 |
| [test-whereami.R](testthat/test-whereami.R#L29) | counter functionality | counter flow: counter state             | PASS   | 1 | 0.002 |
| [test-whereami.R](testthat/test-whereami.R#L34) | counter functionality | counter flow: reset                     | PASS   | 1 | 0.001 |

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
