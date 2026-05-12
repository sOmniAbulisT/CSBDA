# Assignment 4, Question 2

INFILE_Q2 <- "a4_table2.csv"
OUTFILE_SQL_Q2 <- "autogen_q2.sql"


import_data <- function(infile) {
  data <- read.table(infile, header = TRUE, sep = ",", stringsAsFactors = FALSE)
  data
}

# main function
main <- function() {
  data <- import_data(INFILE_Q2)
  data
}

main()
