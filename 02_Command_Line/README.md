# Module 2: Command Line Interface (CLI)
 
This module covers fundamental Linux terminal operations, file system management and how to efficiency process plain text biological data using piplines 
and redirection.

## 1. Navigation & File Operations

| Command | Description | Common Flags / Examples |
| :--- | :--- | :--- |
| `pwd` | Print working directory (current location) | `pwd` |
| `ls` | List files and directories | `ls -F` (Appends `/` to directories) |
| `cd` | Change directory | `cd ~` (Go to Home), `cd ..` (Move up one level) |
| `mkdir` | Make a new directory | `mkdir new_folder` |
| `touch` | Create an empty file | `touch new_file.txt` |
| `cp` | Copy a file | `cp old_file new_file` |
| `mv` | Move or rename a file | `mv old_name new_name` |
| `rm` | Remove a file ( No recycle bin!) | `rm file.txt` (Use `-r` to remove directories) |

## 2. Viewing Files

| Command | Description | Use Case |
| :--- | :--- | :--- |
| `cat` | Concatenate and print file content to standard output | Suitable for small files with few lines |
| `less` | View file content page by page | Suitable for large files (Press `q` to quit, use arrow keys to scroll) |
| `head` | Output the first part of a file | `head -n 5 file.txt` (Defaults to first 10 lines) |
| `tail` | Output the last part of a file | `tail -n 5 file.txt` (Defaults to last 10 lines) |

## 3. Data Processing & Pipelines

The true power of Linux lies in the ability to chain multiple simple commands together to form a powerful data processing pipeline.

* **Wildcards:**
    * `*`: Represents any number of characters (e.g., `*.md` matches all markdown files).
    * `?`: Represents a single character.
* **Redirection:**
    * `>`: Redirect output to a new file (**Overwrites** existing content).
    * `>>`: **Append** output to the end of a file.
* **Pipe:**
    * `|`: Use the output of the command on the left as the input for the command on the right (e.g., `wc * | sort`).

### Core Processing Commands

| Command | Description | Common Flags |
| :--- | :--- | :--- |
| `wc` | Word count (counts lines, words, and bytes) | `-l` (lines only), `-w` (words only) |
| `sort` | Sort lines of text files | `-n` (numeric sort), `-r` (reverse sort) |
| `cut` | Remove sections from each line of files | `-d ','` (set delimiter), `-f 2` (select second field/column) |
| `uniq` | Report or omit repeated lines | `-c` (count occurrences), `-i` (case-insensitive) |

## 4. WSL / System Tips

* **Terminate command (`Ctrl + C`):** Use this to forcibly terminate the current process when a command takes too long or the terminal is stuck (e.g., showing a `>` prompt).
* **Text Editor (`nano`):** A lightweight text editor built into the terminal (`Ctrl + O` to save/write out, `Ctrl + X` to exit).
