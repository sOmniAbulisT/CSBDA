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
