# Assignment 2 Question 4

## Initial Setup
* **Git Command:** `git rm a2_q4.R`, `git commit -m "Q4:..." -m "..."`, `git push origin main`
* **Commit ID:** `[4f3d037]`
* **Explanation:** Started Question 4 by choosing Python as the implementation language. Removed the R template file. 

## Basic Implement 
* **Git Command:** `git add a2_q4.py`, `git commit -m "Q4:..." -m "..."`, `git push origin main`
* **Commit ID:** `[6a92b04]`
* **Explanation:** I focused on the setting up the function structure and ensuring the return format matches

## Included missing 'diff' value in a2_q4 return dictionary
* **Git Command:**`nano a2_q4.py`, `git add a2_q4.py`, `git commit -m "Q4:..." -m "..."`, `git push origin main` 
* **Commit ID:**`[bc735cc]`
* **Explanation** I added the `diff` value to the return dictionary to ensure that all required metrices are returned correctly

## Simple middle-split
* **Git Command:**`nano a2_q4.py`, `git add a2_q4,py`, `git commit -m "Q4:..." -m "..."`, `git push origin main`
* **Commit ID:**`[aa0b63c]`
* **Explanation:** I used the simply list slicing to divide the input into `group1` and `group2`. 
* **Testing:**
  * For input `[1, 2, 3, 4, 5, 6, 7, 8]`, the output `{'group1': [1, 2, 3, 4], 'group2': [5, 6, 7, 8], 'diff': 16}`
  * For input `[4, 3, 0, 1, 5.5, 2]`, the output `{'group1': [4, 3, 0], 'group2': [1, 5.5, 2], 'diff': 1.5}`

## Sorting and middle-split 
* **Git Command:**`nano a2_q4.py`, `git add a2_q4.py`, `git commit -m "Q4:..." -m "..."`, `git push origin main`
* **Commit ID:** `[f60e64b]`
* **Explanation:** I added `sorted()` to the input list from smallest to largest. However, I observed that by splitting the sorted list at the midpoint, 
`group1` received all the smallest values and `group2` received all the largest values. 
* **Testing:**
  * For input `[1, 2, 3, 4, 5, 6]`, the output `{'group1': [1, 2, 3, 4], 'group2': [5, 6, 7, 8], 'diff':16}`
  * For input `[4, 3, 0, 1, 5.5, 2]`, the output `{'group1': [0, 1, 2], 'group2': [3, 4, 5.5], 'diff':9.5}`

## Interleaved distribution
* **Git Command:** `nano a2_q4.py`, `git add a2_q4.py`, `git commit -m "Q4:..." -m "..."`, `git push origin main`
* **Commit ID:** `[cd538d2]`
* **Explanation:** To minimize the difference between `group1` and `group2`. I implemented an interleaved distribution strategy. Firstly, 
I sorted the input numbers from smallest to largest. Then, I used Python's slices `[::2]` and `[1::2]` to assign values alternately, to `group1` and 
`group2`. This ensures that both groups receive a balanced mix of small and large values.
* **Testing:** During testing, I observed that the interleaved approach reduced the `diff` compared to a sorted middle-split.
  * For input `[1, 2, 3, 4, 5, 6, 7, 8]`, the output `{'group1': [1, 3, 5, 7], 'group2': [2, 4, 6, 8], 'diff': 4}`
  * For input `[4, 3, 0, 1, 5.5, 2]`, the output `{'group1': [0, 2, 4], 'group2': [1, 3, 5.5], 'diff': 3.5}`

## Snake distribution
* **Git Command:** `nano a2_q4.py`, `git add a2_q4.py`, `git commit -m "Q4:..." -m "..."`, `git push origin main`
* **Commit ID:**`[db84950]`
* **Explanation:**To further improve group balance, I implemented a strategy where the assignment of larger and smaller numbers from the sorted list 
alternates more symmetrically. 
* **Testing:**
  * For input `[1, 2, 3, 4, 5, 6, 7, 8]`, the output `{'group1': [8, 5, 4, 1], 'group2': [7, 6, 3, 2], 'diff': 0}`
  * For input `[4, 3, 0, 1, 5.5, 2]`, the output `{'group1': [5.5, 2, 1], 'group2': [4, 3, 0], 'diff': 1.5}`

## Dynamic distribution
* **Git Command:** `nano a2_q4.py`, `git add a2_q4.py`, `git commit -m "Q4:..." -m "..."`, `git push origin main`
* **Command ID:**`[ef1acf4]`
* **Explanation:**While the snake distribution improved the balance, it still failed to minimize the difference for certain inputs like Testing 2. 
To solve this, I adopted a dynamic approach. First, I sorted the list in descending order. Then, I iterated through the sorted numbers, 
dynamically assigning each number to the group with the smaller current total sum, while strictly enforcing that neither group exceeds half the total 
length.
* **Testing:**
  * For input `[1, 2, 3, 4, 5, 6, 7, 8]`, the output `{'group1': [8, 5, 4, 1], 'group2': [7, 6, 3, 2], 'diff': 0}`
  * For input `[4, 3, 0, 1, 5.5, 2]`, the output `{'group1': [5.5, 2, 0], 'group2': [4, 3, 1], 'diff': 0.5}`
