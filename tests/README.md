Tests and Coverage
================
27 October, 2019 14:13:53

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                              | Coverage (%) |
| :---------------------------------- | :----------: |
| whereami                            |    28.36     |
| [R/breadcrumb.R](../R/breadcrumb.R) |     0.00     |
| [R/counter.R](../R/counter.R)       |     8.22     |
| [R/print.R](../R/print.R)           |    41.38     |
| [R/whereami.R](../R/whereami.R)     |    44.74     |
| [R/thisfile.R](../R/thisfile.R)     |    46.34     |
| [R/utils.R](../R/utils.R)           |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                        |  n |  time | error | failed | skipped | warning | icon |
| :------------------------------------------ | -: | ----: | ----: | -----: | ------: | ------: | :--- |
| [test-console.R](testthat/test-console.R)   |  2 | 0.005 |     0 |      0 |       0 |       0 |      |
| [test-counter.R](testthat/test-counter.R)   | 12 | 0.074 |     0 |      0 |       0 |       0 |      |
| [test-source.R](testthat/test-source.R)     |  3 | 0.061 |     0 |      0 |       0 |       0 |      |
| [test-thisfile.R](testthat/test-thisfile.R) |  4 | 0.011 |     0 |      0 |       3 |       0 | 🔶    |

<details open>

<summary> Show Detailed Test Results
</summary>

| file                                                | context               | test                                    | status  | n |  time | icon |
| :-------------------------------------------------- | :-------------------- | :-------------------------------------- | :------ | -: | ----: | :--- |
| [test-console.R](testthat/test-console.R#L8)        | console functionality | console functionality: class            | PASS    | 1 | 0.002 |      |
| [test-console.R](testthat/test-console.R#L12)       | console functionality | console functionality: value            | PASS    | 1 | 0.003 |      |
| [test-counter.R](testthat/test-counter.R#L7)        | counter functionality | counter flow: no counter exists         | PASS    | 1 | 0.000 |      |
| [test-counter.R](testthat/test-counter.R#L13)       | counter functionality | counter flow: initial                   | PASS    | 1 | 0.030 |      |
| [test-counter.R](testthat/test-counter.R#L17)       | counter functionality | counter flow: check counter was created | PASS    | 1 | 0.001 |      |
| [test-counter.R](testthat/test-counter.R#L21)       | counter functionality | counter flow: counter name              | PASS    | 1 | 0.001 |      |
| [test-counter.R](testthat/test-counter.R#L25)       | counter functionality | counter flow: counter bump              | PASS    | 1 | 0.020 |      |
| [test-counter.R](testthat/test-counter.R#L29)       | counter functionality | counter flow: counter state             | PASS    | 2 | 0.002 |      |
| [test-counter.R](testthat/test-counter.R#L34)       | counter functionality | counter flow: cat\_whereami             | PASS    | 1 | 0.018 |      |
| [test-counter.R](testthat/test-counter.R#L38_L39)   | counter functionality | counter flow: multiple counter states   | PASS    | 1 | 0.001 |      |
| [test-counter.R](testthat/test-counter.R#L43)       | counter functionality | counter flow: multiple counter names    | PASS    | 1 | 0.001 |      |
| [test-counter.R](testthat/test-counter.R#L48)       | counter functionality | counter flow: reset item                | PASS    | 1 | 0.000 |      |
| [test-counter.R](testthat/test-counter.R#L53)       | counter functionality | counter flow: reset all                 | PASS    | 1 | 0.000 |      |
| [test-source.R](testthat/test-source.R#L7)          | source functionality  | source calls: direct call               | PASS    | 1 | 0.014 |      |
| [test-source.R](testthat/test-source.R#L11)         | source functionality  | source calls: path expand               | PASS    | 1 | 0.015 |      |
| [test-source.R](testthat/test-source.R#L15)         | source functionality  | source calls: print                     | PASS    | 1 | 0.032 |      |
| [test-thisfile.R](testthat/test-thisfile.R#L7)      | thisfile              | thisfile works with source              | SKIPPED | 1 | 0.001 | 🔶    |
| [test-thisfile.R](testthat/test-thisfile.R#L13)     | thisfile              | thisfile works with Rscript             | SKIPPED | 1 | 0.000 | 🔶    |
| [test-thisfile.R](testthat/test-thisfile.R#L21)     | thisfile              | thisfile works with R                   | SKIPPED | 1 | 0.000 | 🔶    |
| [test-thisfile.R](testthat/test-thisfile.R#L31_L35) | thisfile              | thisfile works with knitr               | PASS    | 1 | 0.010 |      |

| Failed | Warning | Skipped |
| :----- | :------ | :------ |
| 🛑      | ⚠️      | 🔶       |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.6.1 (2019-07-05)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS Mojave 10.14.5                |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.2.1   |
| covr     | 3.3.0   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : skipped/warning --->
