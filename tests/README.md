Tests and Coverage
================
22 December, 2022 20:36:43

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| whereami                            |    36.49     |
| [R/counter.R](../R/counter.R)       |     7.89     |
| [R/print.R](../R/print.R)           |    41.38     |
| [R/whereami.R](../R/whereami.R)     |    50.00     |
| [R/zzz.R](../R/zzz.R)               |    50.00     |
| [R/thisfile.R](../R/thisfile.R)     |    51.22     |
| [R/breadcrumb.R](../R/breadcrumb.R) |    68.18     |
| [R/utils.R](../R/utils.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                        | n |  time | error | failed | skipped | warning |
| :------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: |
| [test-counter.R](testthat/test-counter.R)   | 1 | 0.013 |     0 |      0 |       0 |       0 |
| [test-source.R](testthat/test-source.R)     | 3 | 0.079 |     0 |      0 |       0 |       0 |
| [test-thisfile.R](testthat/test-thisfile.R) | 4 | 0.635 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                | context               | test                            | status | n |  time |
| :-------------------------------------------------- | :-------------------- | :------------------------------ | :----- | -: | ----: |
| [test-counter.R](testthat/test-counter.R#L7)        | counter functionality | counter flow: no counter exists | PASS   | 1 | 0.013 |
| [test-source.R](testthat/test-source.R#L7)          | source functionality  | source calls: direct call       | PASS   | 1 | 0.013 |
| [test-source.R](testthat/test-source.R#L11)         | source functionality  | source calls: path expand       | PASS   | 1 | 0.056 |
| [test-source.R](testthat/test-source.R#L15)         | source functionality  | source calls: print             | PASS   | 1 | 0.010 |
| [test-thisfile.R](testthat/test-thisfile.R#L9)      | thisfile              | thisfile works with source      | PASS   | 1 | 0.006 |
| [test-thisfile.R](testthat/test-thisfile.R#L17)     | thisfile              | thisfile works with Rscript     | PASS   | 1 | 0.304 |
| [test-thisfile.R](testthat/test-thisfile.R#L25)     | thisfile              | thisfile works with R           | PASS   | 1 | 0.307 |
| [test-thisfile.R](testthat/test-thisfile.R#L32_L36) | thisfile              | thisfile works with knitr       | PASS   | 1 | 0.018 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |                                                                                                                                                                                                                                                                  |
| :------- | :---------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.2.2 (2022-10-31)  |                                                                                                                                                                                                                                                                  |
| Platform | x86\_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/whereami/commit/da63d0ac8f7fa721758edd075728ebc5828332ea/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.1 LTS            |                                                                                                                                                                                                                                                                  |
| Language | C                             |                                                                                                                                                                                                                                                                  |
| Timezone | UTC                           |                                                                                                                                                                                                                                                                  |

| Package  | Version |
| :------- | :------ |
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.1     |

</details>

<!--- Final Status : pass --->
