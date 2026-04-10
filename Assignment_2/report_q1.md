  GNU nano 7.2                                                            report_q1.md
# Assignment 2 Question 1

* Issue: #1
* Pull Request: #2

---

## Step01: Create new branch
Created a new branch `Question01` to add my name and my student ID to README file without affecting the `main` branch.

* **Git Commands:**
`git switch -c Question01`

## Step02: My first commit
Added my name to `README.md` as the first step of the task.

* **Git Commands**
`git add README.md`
`git commit -m "Q1: Add my name" -m "Add my name in README.md to identification"`

* **Commit ID** `[1687e95]`

## Step03: My second commit
Added my student ID to `README.md` to fulfill the task described in the Issue.

* **Git Commands**
`echo "my student ID is R13621207" >> README.md`
`git add README.md`
`git commit -m "Q1: Add my student ID" -m "Add my student ID in README.md to identification"`

* **Commit ID** `[1f59f1b]`
