import string
def a2_q2 (input: dict) -> dict:
    x = input["x"]
    y = input["y"]
    
    # The x-th letter is at index x-1
    target = string.ascii_lowercase[x - 1]

    answer = {
	"power_xy": x ** y, 
	"power_yx": y ** x, 
	"repeat_x_times": "x" * x, 
	"repeat_y_times": str(y) * y, 
	"xth_alphabet_repeat_y_times": target * y
    }

    return answer
