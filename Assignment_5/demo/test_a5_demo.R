# testthat::test_file("test_a5_demo.R")
library(testthat)

source("a5_demo.R")

test_that("test_basic", {
  actual <- plus_one(1)
  expected <- 2
  expect_equal(actual, expected)
})

test_that("test_decimal", {
  actual <- plus_one(1.234)
  expected <- 2.234
  expect_equal(actual, expected)
})

test_that("test_negative", {
  actual <- plus_one(-51)
  expected <- -50
  expect_equal(actual, expected)
})

test_that("test_large_number_fail", {
  actual <- plus_one(1e6)
  expected <- 1000000
  expect_equal(actual, expected)
})
