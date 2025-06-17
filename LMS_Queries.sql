Use LMS;
#LMS Questions
#1. List All Courses with Their Category Names
#Question: Retrieve a list of courses along with the name of the category to which each course belongs.
Select * from Courses;
select * from content;
select * from Modules;
Select * from Categories;
Select Co.Course_name, Ca.Category_name from Courses as Co join categories As Ca
on Co.category_id = Ca.category_id;


#2. Count the Number of Courses in Each Category
#Question: For each category, count how many courses exist.
Select  Ca.category_name As " Category Name", count(Ca.category_name) "Course_Count" from Courses as Co join categories As Ca
on Co.category_id = Ca.category_id
Group by Ca.category_id;


#3. List All Students’ Full Names and Email Addresses
#Question: Retrieve the full names and email addresses for all users with the role 'student. '
Select First_name, last_name, Role,Email from user;

#4. Retrieve All Modules for a Specific Course Sorted by Module Order
#Question: For a given course (e.g., course_id = 1), list its modules sorted by their order.
Select * from courses;
Select * from modules;
Select C.Course_name, M.Module_name, M.Module_order from Courses as C Join Modules as M
On C.Course_id = M.course_id
order by module_order;

##5. List All Content Items for a Specific Module
#Question: Retrieve all content items for a specific module (for example, module_id = 2).
Select * From Content;
Select * from Modules;
Select C.Title as "Content Item", M.Module_Name
From Content as C join Modules as M
On C.Module_Id = M.Module_id;

#6. Find the Average Score for a Specific Assessment
#Question: Calculate the average score of submissions for a given assessment (e.g.,assessment_id = 1).
Select * From Assessments;
Select A.Assessment_Type, Avg(s.score) from assessments as a Join assessment_Submission As s
on A.Assessment_id = s.Assessment_id
Group by Assessment_Type;

#7. List All Enrollments with Student Names and Course Names
#Question: Retrieve a list of enrollments that shows the student’s full name, the course name, and the enrollment date.
Select * From user;
select * from Courses;
Select * From Enrollments;
Select U.First_Name, U.Last_name, C.Course_Name, E.Enrolled_At
From User as U join Courses as C Join Enrollments as E
On U.User_Id = E.User_Id and C.course_id = E.Course_id;

#8. Retrieve All Instructors’ Full Names
#Question: List the full names and email addresses of all users with the role 'instructor'.
select First_name, Last_name, Email, role from  User where role = "instructor";

#9. Count the Number of Assessment Submissions per Assessment
#Question: For each assessment, count how many submissions have been made.
select A.assessment_Id, A.assessment_name, Count(S.Submission_id) As Submission_Count
From Assessments as A left join Assessment_submission as S
On A.assessment_Id = S.assessment_Id
group by A.assessment_Id, A.assessment_name
order By Submission_Count desc;

#10. List the Top Scoring Submission for Each Assessment
#Question: Retrieve, for each assessment, the submission that achieved the highest score.
Select * From Assessments;
Select * From Assessment_Submission;
Select A.assessment_ID,A.assessment_name, Max(S.Score) as Maximum_Score 
from assessments as A Join Assessment_Submission As S
On A.Assessment_Id = S.Assessment_ID
Group By Assessment_Id
order By Maximum_Score desc;

#11. Retrieve Courses Created After a Specific Date
#Question: List courses that were created after '2023-04-01'.
select * from Courses;
select Course_name, date(Created_At) as Created_At from courses where Created_At > '2023-04-01';

#12. Find Students Who Have Not Submitted Any Assessments
#Question: Retrieve a list of students who do not have any records in the assessment_submission table.

select U.First_name,U.Last_name from User as U left Join Assessment_Submission As a
on U.User_id = A.user_id
where U.user_iD is Null;

#13. List the Content for Courses in the 'Programming' Category
#Question: Retrieve all content items for courses whose category is 'Programming'.

Select Ca.Category_name,Co.Course_name,C.Title as Content_Title, Row_Number() Over (Partition By Co.Course_name order by C.title) As "Number Of Content"
From Content As C join Modules as M join Courses as Co Join Categories as Ca
On C.Module_id = M.Module_id and M.Course_Id = Co.Course_id And Co.Category_Id = Ca.Category_Id
Where Ca.category_name = "Programming";

#14. Retrieve Modules That Have No Associated Content
#Question: List modules that do not have any content items linked to them.
select * from Modules;
Select * from Content;
Select M.Module_id, M.Module_name,C.Content_id, C.title From Modules as M left join Content as C
On M.Module_Id = C.Module_Id
WHERE c.content_id IS NULL;

#15. List Courses with the Total Number of Enrollments
#Question: For each course, display the course name along with the count of enrollments.
Select C.Course_id, C.Course_name, Count(E.Enrollment_id) As Total_Enrollments
From Courses As C left Join Enrollments as E
on C.course_id = E.course_Id
Group By C.Course_id, C.Course_name
Order by Total_Enrollments desc;

#16. Find the Average Assessment Submission Score for Each Course
#Question: Calculate the average score of all assessment submissions for each course
#by joining courses, modules, assessments, and submissions.

select 
	C.Course_name As Course_name ,
    round(avg(S.Score))  as Avg_score
From assessment_submission as S 
	join assessments as A 
	join modules as M 
	join courses as C
On s.assessment_id = a.assessment_id 
	and A.module_id = M.Module_id 
	and M.course_id = C.course_id
Group By C.course_id , c.course_name
Order by Avg_score desc;

#17. List Users with Their Number of Enrollments
#Question: Retrieve a list of all users along with the count of courses they are enrolled in.

Select U.User_id as Users, concat(U.First_name," ",U.Last_name) As User_name, Count(E.Enrollment_id) As Course_Count
from User as U left Join Enrollments as E
On U.User_id = E.user_id
Group By Users, User_name
Order By Course_count desc;

#18. Find the Assessment with the Highest Average Score
#Question: Identify the assessment that has the highest average submission score.

Select A.Assessment_name as assessment_name , round(Avg(S.score)) As avg_score
From assessments as A join assessment_submission as S
on A.assessment_id = s.assessment_id
group by a.assessment_id, assessment_name
Order by avg_score desc Limit 1;

#19. List Courses Along with Their Modules and Content in Hierarchical Order
#Question: Retrieve a hierarchical list that shows each course, its modules, and the
#content items within each module.

Select C.Course_name, M.Module_name, Co.Title as Content_title , 
row_number() Over (partition by M.Module_ID order by Co.title) As Content_number
From Courses as C Join Modules as M join content as Co
On C.course_id = M.Course_id and M.Module_id = Co.Module_id
Order By C.Course_name, M.Module_name, Content_number;


#20. Find the Total Number of Assessments Per Course
#Question: For each course, count the total number of assessments available by joining
#courses, modules, and assessments.

Select C.course_name, Count(A.Assessment_Id) as Total_assessments
From Courses as C join Modules as M join assessments as A
On C.Course_id = M.course_id and M.module_id = A.module_id
Group by C.course_id , C.course_name
order By total_assessments desc;


#21. List All Enrollments from May 2023
#Question: Retrieve all enrollment records where the enrollment date falls within May
#2023.

Select Enrollment_id, Enrolled_at from enrollments
where Month(enrolled_at) = 5;


#22. Retrieve Assessment Submission Details Along with Course and Student
#Information
#Question: For each assessment submission, display the submission details along with
#the corresponding course name, student name, and assessment name.
Select s.Submission_Id, C.Course_name, concat(U.first_name," ",U.last_name) as Full_Name, A.assessment_name
from Assessment_submission as S join user as U Join assessments as A join Modules As M join courses as C
on s.User_id = U.User_id and s.assessment_id = A.assessment_id 
and A.module_id = M.Module_id and M.course_id = C.course_id;


#23. List All Users with Their Roles
#Question: Retrieve a list of all users showing their full names and roles.

Select concat(First_name,' ',Last_name) As Full_Name, Role
from user;

#24. Find the Percentage of Passing Submissions for Each Assessment
#Question: Assuming a passing score is 60 or above, calculate the passing percentage
#for each assessment.

#Doubt.



#25. Find Courses That Do Not Have Any Enrollments
#Question: List the courses for which there are no enrollment records.

Select C.Course_name from courses as C Left Join enrollments as E
On c.course_id = E.course_id
where e.enrollment_Id is null;

