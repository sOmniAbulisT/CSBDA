# Module 3: Version Control with Git & GitHub

This module documents the core concepts and common commands of Git version control, used for tracking code changes and collaboration.

## 1. Configuration
When using Git for the first time, you must configure your user information. This information will be attached to every commit record.
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --list  # Check current configuration
```

## 2. The Daily Workflow 
This is the standard workflow most frequently used when developing scripts and writing notes:
```bash
git status         # Check current file status (red: untracked/modified, green: staged for commit)
git add .          # Add all changes in the current directory to the Staging Area
git commit -m "feat: add some scripts" # Commit changes with a descriptive message
git push origin main # Push local commits to the GitHub remote repository

``` 

## 3. History & Revert 
Lifesaving commands when code breaks or when you need to view past records:

```bash
git log            # View past commit history (press 'q' to exit)
git log --oneline  # View history in a concise, single-line format
git restore <file> # Discard changes in a specific file, reverting it to the last commit state
```

## 4. Branching
Operations to avoid affecting the stable main branch when developing new features or drafting new projects:
```bash
git branch                 # List all current branches
git branch <branch-name>   # Create a new branch
git checkout <branch-name> # Switch to a specific branch
git merge <branch-name>    # Merge changes from a specific branch into the current branch
```
