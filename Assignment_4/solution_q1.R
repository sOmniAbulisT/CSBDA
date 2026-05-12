# Assignment 4, Question 1

INFILE_Q1 <- "a4_table1.csv"
OUTFILE_SQL_Q1 <- "autogen_q1.sql"

import_data <- function(infile) {
  data <- read.table(infile, header = TRUE, sep = ",", stringsAsFactors = FALSE)
  data
}

# main function
main <- function() {
  data <- import_data(INFILE_Q1)
  data
}

main()
