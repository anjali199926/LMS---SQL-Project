# LMS---SQL-Project
Designed and executed a relational database simulating an academic system. Wrote SQL queries for real-time performance reports.

## 🔍 Overview
This project focuses on analysing data from a Learning Management System (LMS) using SQL. It explores student enrolments, course structures, assessment results, and user behaviour. Queries are crafted to simulate real-world reporting needs and answer practical education-sector KPIs.

---

## ❓ Problem Statement
Learning platforms generate structured data across users, courses, modules, assessments, and enrolments. The objective of this project is to generate insights into:
- Course and content structure  
- Enrolment patterns across time and users  
- Assessment performance and submissions  
- User segmentation by role and activity  
- Content completeness and module hierarchy  

---

## 📁 Dataset Summary
The LMS database schema is relational and includes key academic entities:
- **Users** – students, instructors, admin with role types  
- **Courses** – high-level learning programs  
- **Modules** – course breakdown into learning units  
- **Content** – textual or video resources per module  
- **Assessments** – quizzes and tests per module  
- **Assessment Submissions** – user-level performance records  
- **Enrollments** – course registration data  

---

## 🧹 Data Cleaning Highlights
- Verified foreign key mappings across modules, content, and assessments  
- Handled NULLs in join operations (e.g., modules without content)  
- Used `LEFT JOIN`, `GROUP BY`, and `CASE` for missing entries and segmentation  
- Applied `ROW_NUMBER()` and `AVG()` to support ranking and performance metrics  

---

## 📊 Analysis Summary

This project answers **25 structured business questions** typically asked by academic administrators, instructors, or data analysts managing a Learning Management System. The queries are grouped into core analytical themes:

### 🎓 Course & Category Analysis
- Q1: Courses with categories  
- Q2: Number of courses per category  
- Q11: Recently created courses  
- Q25: Courses without any enrolments

### 📘 Content & Structure Insights
- Q4: Ordered modules per course  
- Q5: Content items under modules  
- Q13: Content for 'Programming' category  
- Q14: Modules with no content  
- Q19: Course → Module → Content hierarchy

### 👥 User & Role Management
- Q3: Student contact list  
- Q8: Instructors by name and email  
- Q23: User-role overview  
- Q17: Enrolments per user

### 📝 Enrollment & Participation
- Q7: Student enrolments with course names  
- Q15: Enrolment count per course  
- Q21: Enrolments during May 2023

### 📊 Assessment & Performance Metrics
- Q6: Average score for an assessment  
- Q9: Submission volume per assessment  
- Q10: Highest scoring submissions  
- Q16: Course-level average scores  
- Q18: Top-performing assessments  
- Q20: Number of assessments per course  
- Q24: *(Optional)* Passing percentage per assessment

### 📑 Submission Gaps & Exceptions
- Q12: Students with no submissions  
- Q22: Full trace of submission details

---

## 🚀 How to Use
1. Set up MySQL or any compatible SQL client  
2. Load the LMS schema using the provided SQL scripts  
3. Run the practice queries to generate insights  
4. Optional: Extend the project into BI dashboards using Power BI or Tableau

---

## 💡 Skills Demonstrated
- Relational data modelling and schema navigation  
- SQL expertise: `JOIN`, `GROUP BY`, `CTEs`, `Window Functions`, filtering  
- Analytical problem solving based on realistic LMS scenarios  
- Domain understanding of learning platforms
