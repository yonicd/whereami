Tests and Coverage
================
23 April, 2019 09:15:05

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

<table>

<thead>

<tr>

<th style="text-align:left;">

Object

</th>

<th style="text-align:center;">

Coverage (%)

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

whereami

</td>

<td style="text-align:center;">

33.03

</td>

</tr>

<tr>

<td style="text-align:left;">

[R/breadcrumb.R](../R/breadcrumb.R)

</td>

<td style="text-align:center;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

[R/counter.R](../R/counter.R)

</td>

<td style="text-align:center;">

21.74

</td>

</tr>

<tr>

<td style="text-align:left;">

[R/print.R](../R/print.R)

</td>

<td style="text-align:center;">

41.38

</td>

</tr>

<tr>

<td style="text-align:left;">

[R/whereami.R](../R/whereami.R)

</td>

<td style="text-align:center;">

43.24

</td>

</tr>

<tr>

<td style="text-align:left;">

[R/utils.R](../R/utils.R)

</td>

<td style="text-align:center;">

100.00

</td>

</tr>

</tbody>

</table>

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

<table>

<thead>

<tr>

<th style="text-align:left;">

file

</th>

<th style="text-align:right;">

n

</th>

<th style="text-align:right;">

time

</th>

<th style="text-align:right;">

error

</th>

<th style="text-align:right;">

failed

</th>

<th style="text-align:right;">

skipped

</th>

<th style="text-align:right;">

warning

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

[test-console.R](testthat/test-console.R)

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

0.020

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R)

</td>

<td style="text-align:right;">

11

</td>

<td style="text-align:right;">

0.110

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-source.R](testthat/test-source.R)

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

0.048

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

</tbody>

</table>

<details closed>

<summary> Show Detailed Test Results </summary>

<table>

<thead>

<tr>

<th style="text-align:left;">

file

</th>

<th style="text-align:left;">

context

</th>

<th style="text-align:left;">

test

</th>

<th style="text-align:left;">

status

</th>

<th style="text-align:right;">

n

</th>

<th style="text-align:right;">

time

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

[test-console.R](testthat/test-console.R#L9)

</td>

<td style="text-align:left;">

console functionality

</td>

<td style="text-align:left;">

console functionality: class

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.018

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-console.R](testthat/test-console.R#L13)

</td>

<td style="text-align:left;">

console functionality

</td>

<td style="text-align:left;">

console functionality: value

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.002

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L8)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: no counter exists

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.001

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L14)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: initial

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.036

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L18)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: check counter was created

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.001

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L22)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: counter name

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.002

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L26)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: counter bump

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.020

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L30)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: counter state

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.003

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L34)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: cat\_whereami

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.042

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L38)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: multiple counter states

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.001

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L42)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: multiple counter names

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.001

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L47)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: reset item

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.001

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-counter.R](testthat/test-counter.R#L52)

</td>

<td style="text-align:left;">

counter functionality

</td>

<td style="text-align:left;">

counter flow: reset all

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.002

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-source.R](testthat/test-source.R#L8)

</td>

<td style="text-align:left;">

source functionality

</td>

<td style="text-align:left;">

source calls: direct call

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.015

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-source.R](testthat/test-source.R#L12)

</td>

<td style="text-align:left;">

source functionality

</td>

<td style="text-align:left;">

source calls: path expand

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.015

</td>

</tr>

<tr>

<td style="text-align:left;">

[test-source.R](testthat/test-source.R#L16)

</td>

<td style="text-align:left;">

source functionality

</td>

<td style="text-align:left;">

source calls: print

</td>

<td style="text-align:left;">

PASS

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0.018

</td>

</tr>

</tbody>

</table>

</details>

<details>

<summary> Session Info </summary>

<table>

<thead>

<tr>

<th style="text-align:left;">

Field

</th>

<th style="text-align:left;">

Value

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Version

</td>

<td style="text-align:left;">

R version 3.5.1 (2018-07-02)

</td>

</tr>

<tr>

<td style="text-align:left;">

Platform

</td>

<td style="text-align:left;">

x86\_64-apple-darwin15.6.0 (64-bit)

</td>

</tr>

<tr>

<td style="text-align:left;">

Running

</td>

<td style="text-align:left;">

macOS 10.14.4

</td>

</tr>

<tr>

<td style="text-align:left;">

Language

</td>

<td style="text-align:left;">

en\_US

</td>

</tr>

<tr>

<td style="text-align:left;">

Timezone

</td>

<td style="text-align:left;">

America/New\_York

</td>

</tr>

</tbody>

</table>

<table>

<thead>

<tr>

<th style="text-align:left;">

Package

</th>

<th style="text-align:left;">

Version

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

testthat

</td>

<td style="text-align:left;">

2.0.1

</td>

</tr>

<tr>

<td style="text-align:left;">

covr

</td>

<td style="text-align:left;">

3.2.1

</td>

</tr>

<tr>

<td style="text-align:left;">

covrpage

</td>

<td style="text-align:left;">

0.0.70

</td>

</tr>

</tbody>

</table>

</details>

<!--- Final Status : pass --->
