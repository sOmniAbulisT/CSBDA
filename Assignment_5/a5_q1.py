DEGREE_ARGS = ["C", "F", "K"]
ABSOLUTE_ZERO_C = -273.15
ABSOLUTE_ZERO_F = -459.67


def convert_f_to_c(temp_f):
    return (temp_f - 32) * 5 / 9


def convert_c_to_f(temp_c):
    return temp_c * 9 / 5 + 32


def convert_f_to_others(to_degree, temp_f):
    if to_degree == "C":
        answer = convert_f_to_c(temp_f)
    elif to_degree == "K":
        answer = convert_f_to_c(temp_f) - ABSOLUTE_ZERO_C
    else:
        raise ValueError(f"Unsupported target degree: {to_degree}")
    return answer


def convert_c_to_others(to_degree, temp_c):
    if to_degree == "F":
        answer = convert_c_to_f(temp_c)
    elif to_degree == "K":
        answer = temp_c - ABSOLUTE_ZERO_C
    else:
        raise ValueError(f"Unsupported target degree: {to_degree}")
    return answer


def convert_k_to_others(to_degree, temp_k):
    if to_degree == "F":
        answer = convert_c_to_f(temp_k + ABSOLUTE_ZERO_C)
    elif to_degree == "C":
        answer = temp_k + ABSOLUTE_ZERO_C
    else: 
        raise ValueError(f"Unsupported target degree: {to_degree}")
    return answer


def check_absolute_zero(from_degree, temperature):
    if (
        (from_degree == "K" and temperature < 0)
        or (from_degree == "C" and temperature < ABSOLUTE_ZERO_C)
        or (from_degree == "F" and temperature < ABSOLUTE_ZERO_F)
    ):
        raise ValueError(
            f"Temperature {temperature:.2f} {from_degree} is less than absolute zero!"
        )
    return True


def a5_q1(from_degree, to_degree, temperature):

    if from_degree not in DEGREE_ARGS:
        raise ValueError(f"from_degree ({from_degree}) is not a valid degree")
    if to_degree not in DEGREE_ARGS:
        raise ValueError(f"to_degree ({to_degree}) is not a valid degree")
    if from_degree == to_degree:
        raise ValueError(
            f"from_degree ({from_degree}) is equal to_degree ({to_degree})"
        )

    try:
        check_absolute_zero(from_degree, temperature)
    except (ValueError, TypeError) as e:
        print(f"Invalid temperature inouts: {e}")
        return None

    if from_degree == "F":
        answer = convert_f_to_others(to_degree, temperature)
    elif from_degree == "C":
        answer = convert_c_to_others(to_degree, temperature)
    elif from_degree == "K":
        answer = convert_k_to_others(to_degree, temperature)

    return answer
