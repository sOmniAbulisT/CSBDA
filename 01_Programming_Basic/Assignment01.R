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


