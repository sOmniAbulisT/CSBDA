def a2_q4(nums):
    
    if len(nums) % 2 != 0:
        raise ValueError("The number of elements must be even")

    sort_nums = sorted(nums, reverse=True)

    group1 = []
    group2 = []
    sum1 = 0
    sum2 = 0

    for n in sort_nums:
        # if neither group is full
        if len(group1) < len(nums)//2 and len(group2) < len(nums)//2:
            if sum1 <= sum2:
                group1.append(n)
                sum1 += n
            else:
                group2.append(n)
                sum2 += n
        # if group1 is full, only group2 can be allocated
        elif len(group2) < len(nums)//2:
            group2.append(n)
            sum2 += n
        # if group2 is full, only group1 can be allocated
        else:
            group1.append(n)
            sum1 += n

    diff = abs(sum1-sum2)

    answer = {
        "group1": group1,
        "group2": group2,
        "diff": diff
    }
    return answer
