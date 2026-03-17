# =====================================================
# Question 1: Temperature Converter (Python version)
# Function: a1_q1(value, degree)
# Description: Convert between Celsius and Fahrenheit
# =====================================================

import math

def a1_q1(temperature, degree):
    if degree == "C":
        answer = (temperature - 32) * 5 / 9  # F to C
    elif degree == "F":
        answer =  temperature * 9 / 5 + 32  # C to F
    else:
        print("Please choose 'C' or 'F' for degree. ")
    return int(answer)

# --- Test Examples ---
# Example 1: 100°C -> 212°F
print(a1_q1(100, degree="F")) 

# Example 2: 32°F -> 0°C
print(a1_q1(32, degree="C"))

# =====================================================
# Question 2: List Operations (Python version)
# Input: A list with 5 numbers
# Output: A list with 4 calculated terms
# =====================================================

def a1_q2(input):
    if len(input) != 5:
        print("Error: input list must have exactly 5 elements. ")
    else:
        if input[4] == 0:
            print("Error: 5th element is zero. ")
        else:
            answer = [round(input[0]+input[1], 10), round(input[1]-input[2], 10), round(input[2]*input[3], 10), round(input[3]/input[4], 10)]
    return answer

#--- Test Examples ---
input_list = [10, 5, 2, 8, 4]
print(a1_q2(input_list))
# expected output: [15, 3, 16, 2.0]

# =====================================================
# Question 3: Alphabet Repeater (Python version)
# =====================================================

def a1_q3(char, rep):
    import string as st
    target = st.ascii_lowercase[char - 1]
    answer = target * rep
    return answer

# --- Test ---
print(a1_q3(1, 5))   # expected output: 'aaaaa'
print(a1_q3(3, 3))   # expected output: 'ccc'

# =======================================================
# Question 4: Max, Min, and Manual Sum (Python version)
# =======================================================

def a1_q4(numbers):
    max_num = max(numbers)
    min_num = min(numbers)
    sum_number = 0
    for i in range(len(numbers)):
        sum_number += numbers[i]
    answer = {"max": max_num, "min": min_num, "sum": sum_number}
    return answer

# --- Test ---
my_list = [1, 2, 3, 4, 5]
print(a1_q4(my_list))
# expected output: {'max': 5, 'min': 1, 'sum': 15}

# ================================================
# Question 5: Even/Odd Flitter (Python version)
# ================================================

def a1_q5(lower, upper, is_even):
    answer = []
    numbers = list(range(int(lower), int(upper)+1))
    for i in numbers:
        if is_even:
            if i % 2 == 0:
                answer.append(i)
        else:
            if i % 2 != 0:
                answer.append(i)
    return answer

# --- Test ---
print(a1_q5(lower=11, upper=22, is_even=True))
# expected output: [12, 14, 16, 18, 20, 22]
