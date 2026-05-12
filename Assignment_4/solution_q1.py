# Assignment 4, Question 1


import csv
from collections import defaultdict, Counter

INFILE_Q1 = "a4_table1.csv"
OUTFILE_SQL_Q1 = "autogen_q1.sql"


def import_data(infile):

    with open(infile, "r") as file:
        reader = csv.DictReader(file)
        data = list(reader)

    return data

# string formatting
def clean_string(name):
    name = name.replace("()", "")
    name = name.replace(" (", "(").replace(") ", ")")
    name = name.strip()
    name = " ".join(name.split())

    return name

# Establish college mapping table
college_map = {
    "College of liberal arts": 101, 
    "College of science": 102, 
    "College of social sciences": 103,
    "College of medicine": 104, 
    "College of engineering": 105, 
    "College of bio-resources and agriculture": 106, 
    "College of management": 107, 
    "College of public health": 108, 
    "College of electrical engineering and computer science": 109, 
    "College of law": 110, 
    "College of life science": 111, 
    "School of political science and economics": 112, 
    "International college": 113, 
    "College of design and innovation": 114, 
    "Graduate school of advanced technology": 115, 
    "Center for general education": 116, 
    "School of professional education and continuing studies": 117
}

override_college = {
    "agron5003": "College of bio-resources and agriculture", 
    "agron5002": "College of bio-resources and agriculture",
    "data5006": "College of electrical engineering and computer science", 
    "chem2020": "College of science", 
    "agron2002": "College of bio-resources and agriculture", 
    "ie5054": 'College of engineering', 
    "psy1007": 'College of science', 
    "csie5002":'College of electrical engineering and computer science', 
    "agron2013": 'College of bio-resources and agriculture', 
    "ls1011":'College of life science', 
}

override_name = {
    "agron2002": 'statistics', 
    "agron4003": 'tea cultivation science', 
    "agron5002": 'method of advanced biometrics (1)', 
    "agron5003": 'method of advanced biometrics (2)', 
    "math4006": 'calculus (1)', 
    "stat5004": 'theory of statistics (1)'
}

if __name__ == "__main__":
    data = import_data(INFILE_Q1)

    courses = defaultdict(list)
    for row in data:
        num = row["Course number"]
        row["Course name"] = clean_string(row["Course name"])
        courses[num].append(row)

    with open(OUTFILE_SQL_Q1, "w", encoding = "utf-8") as f:
        for num, records in sorted(courses.items()):
            names = [r["Course name"] for r in records]
            colleges = [r["Course in College"] for r in records]

            if num in override_name:
                best_name = override_name[num]
            else:
                name_counts = Counter(names).most_common()
                max_vote = name_counts[0][1]
                top_names = [n for n, c in name_counts if c == max_vote]
                best_name = max(top_names, key = len)

            if num in override_college:
                best_college = override_college[num]
            else:
                best_college = Counter(colleges).most_common(1)[0][0]

            if best_college in college_map:
                college_id = college_map[best_college]
                safe_name = best_name.replace("'", "''")

                sql = f"INSERT INTO CourseCatalog (CourseNumber, CourseName, CollegeId) VALUES ('{num}', '{safe_name}', {college_id});\n"
                f.write(sql)
            else:
                print(f"Warning: {num} {best_college}")