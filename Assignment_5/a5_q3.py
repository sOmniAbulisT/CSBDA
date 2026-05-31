import string


def a5_q3(char, rep):
    try:
        if not isinstance(char, int) or not isinstance(rep, int):
            raise TypeError("Both 'char' and 'rep' must be integers. ")
        if not (1 <= char <= 26):
            raise ValueError("'char' must be between 1 and 26. ")
        if not (1 <= rep <= 50):
            raise ValueError("'rep' must be between 1 and 50. ")
    except (TypeError, ValueError) as e:
        raise ValueError(f"Invalid input provided: {e}")
    
    char_c = string.ascii_lowercase[char - 1]
    answer = char_c * rep
    return answer
