# Assignment 4, Question 2

import csv
from collections import defaultdict

INFILE_Q2 = "a4_table2.csv"
OUTFILE_SQL_Q2 = "autogen_q2.sql"

day_map = {
    "mon": 2, "monday": 2, 
    "tue": 3, "tuesday": 3, 
    "wed": 4, "wednesday": 4, 
    "thu": 5, "thursday": 5, 
    "fri": 6, "friday": 6
}

period_map = {
    "0": 1, "1": 2, "2": 3, "3": 4, "4": 5, 
    "5": 6, "6": 7, "7": 8, "8": 9, "9": 10, 
    "10": 11, "a": 12, "b": 13, "c": 14, "d": 15
}

def import_data(infile):

    with open(infile, "r") as file:
        reader = csv.DictReader(file)
        data = list(reader)

    return data


if __name__ == "__main__":
    data = import_data(INFILE_Q2)

    course_slots = defaultdict(list)

    for row in data:
        course_num = row["Course number"].strip()
        year = row["Year (20XX)"].strip()
        semester = row["Semester"].strip()
        credit = row["Credit"].strip()

        day_str = row["Day of the Week"].strip().lower()
        day_id = day_map.get(day_str)

        period_str = row["Period"].strip().lower()
        period_id = period_map.get(period_str)

        if day_id is None or period_id is None:
            print(f"Warning: {course_num} ({day_str} {period_str})")
            continue

        timeslot = (day_id - 1) * 15 + period_id

        key = (course_num, year, semester, credit)
        course_slots[key].append(timeslot)

    with open(OUTFILE_SQL_Q2, "w", encoding = "utf-8") as f:
        for key, slots in course_slots.items():
            course_num, year, semester, credit = key

            unique_slots = sorted(list(set(slots)))

            ts1 = unique_slots[0] if len(unique_slots) > 0 else "NULL"
            ts2 = unique_slots[1] if len(unique_slots) > 1 else "NULL"
            ts3 = unique_slots[2] if len(unique_slots) > 2 else "NULL"
            ts4 = unique_slots[3] if len(unique_slots) > 3 else "NULL"

            sql = f"INSERT INTO Course (CourseCatalogId, Year, Semester, Credit, TimeSlotOneId, TimeSlotTwoId, TimeSlotThreeId, TimeSlotFourId) SELECT CourseCatalogId, {year}, '{semester}', {credit}, {ts1}, {ts2}, {ts3}, {ts4} FROM CourseCatalog WHERE CourseNumber='{course_num}' LIMIT 1;\n"
            f.write(sql)