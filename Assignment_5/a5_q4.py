# Incorrect implementation
import math

def a5_q4(n):
    try:
        if not isinstance(n, list):
            raise TypeError("Input must be a list. ")
        if len(n) == 0:
            raise ValueError("Input list cannot be empty. ")
        max_num = max(n)
        min_num = min(n)
        sum_num = 0
        for i in range(len(n)):
            if not isinstance(n[i], (int, float)) or isinstance(n[i], bool):
                raise TypeError("All elements inside the list must be numbers. ")
            
            if math.isinf(n[i]):
                raise ValueError("List elements cannot be infinite values. ")

            sum_num += n[i]

    except(TypeError, ValueError) as e:
        raise ValueError(f"Invalid input provided: {e}")

    answer = {"max": max_num, "min": min_num, "sum": sum_num}
    return answer
