# ==========================================
# Question 1: Temperature Converter
# Goal: Practice function arguments and logic
# ==========================================

a1_q1 <- function(temperature, degree) {
  if(degree == "C"){
    answer <- (temperature - 32) * 5 / 9 # F to C
  }else if (degree == "F"){
    answer <- temperature * 9 / 5 + 32  # C to F
  }else{
    stop("Please choose 'C' or 'F' to degree. ")
  }
  return(answer)
}

# --- Test Cases ---
a1_q1(100, degree="F") # Expected: 212
a1_q1(32, degree="C")  # Expected: 0

# ==========================================
# Question 2: Vector Operations (R)
# Note: R uses 1-based indexing
# ==========================================

a1_q2 <- function(input) {
  if(length(input) != 5){
    stop("The input must include 5 elements. ")
  }else{
    if(input[5] == 0){
      stop("5th element cannot be zero. ")
    }else{
      answer <- c(input[1]+input[2], input[2]-input[3], input[3]*input[4], input[4]/input[5])
    }
  }
  return(answer)
}

# --- Test ---
input_vec <- c(10, 5, 2, 8, 4)
print(a1_q2(input_vec))
# Expected output: 15 3 16 2

# ==========================================
# Question 3: Alphabet Repeater (R)
# Note: R has built-in 'letters' vector (1-based)
# ==========================================

a1_q3 <- function(char, rep) {
  target <- letters[char]
  answer <- rep(target, times = rep) |>
    paste0(collapse = "")
  return(answer)
}

# --- Test ---
print(a1_q3(1, 5))   # [1] "aaaaa"
print(a1_q3(26, 2))  # [1] "zz"

# ==========================================
# Question 4: Max, Min, and Manual Sum (R)
# Restriction: NO sum() function allowed
# Output: A list with names: max, min, sum
# ==========================================

a1_q4 <- function(numbers) {
  max_value <- max(numbers)
  min_value <- min(numbers)
  sum_value <- 0
  for(i in seq_len(length(numbers))){
    sum_value <- sum_value + numbers[i]
  }
  answer <- list(max = max_value, min = min_value, sum = sum_value)
  return(answer)
}

# --- Test ---
my_vec <- c(1, 2, 3, 4, 5)
print(a1_q4(my_vec))
# Expected output: $max [1] 5  $min [1] 1  $sum [1] 15

# ==========================================
# Question 5: Even/Odd Filter (R)
# Logic: Vectorized filtering is more R-like
# ==========================================

a1_q5 <- function(lower, upper, is_even) {
  answer <- c()
  numbers <- ceiling(lower):floor(upper)
  for(i in seq_along(numbers)){
    if(is_even){
      if(numbers[i] %% 2 == 0){
        answer <- c(answer, numbers[i])
      }
    }else{
      if(numbers[i] %% 2 != 0){
        answer <- c(answer, numbers[i])
      }
    }
  }
  return(answer)
}

# --- Test ---
print(a1_q5(lower=11, upper=22, is_even=TRUE))
# Expected output: 12 14 16 18 20 22
