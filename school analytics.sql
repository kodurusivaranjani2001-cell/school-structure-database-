-- Show all students in class1_students
select student_name from class1_students;
select *, student_name from class1_students;
select * from class1_students;
-- Display only female students from class3_students.
select student_name from class3_students
where gender='female';
-- for full details
select * from class3_students
where gender like '%female%';
-- List names and ages of all students in class4_students who are 10 years old.
select student_name,age from class4_students
where age=10;
-- Retrieve all staff names from teaching_staff.
 select name from teaching_staff;
-- Show all subjects taught by teaching staff.
select subject_name from  teaching_staff;
-- Find all male teachers from teaching_staff.
select name from teaching_staff 
where gender='male';
-- List all departments from nonteaching_staff.
select department from nonteaching_staff;
-- Show all non-teaching staff above 40 years old.
select name from nonteaching_staff
where age >40;
-- Display all students ordered by age (ascending).
select *
from (
select student_name,age  from class1_students
union all 
select student_name,age from class2_students
union all
select student_name,age from class3_students
union all 
select student_name,age from class4_students
union all 
select student_name, age from class5_students) as all_students
order  by age asc;
-- Show top 5 youngest students in class2_students.
select student_name
from class2_students
order by age asc 
limit 5;
-- Show all students in class5_students where age = 11.
select student_name from class5_students
where age = 11;
-- Get all teachers who teach either Maths or English.
select name from teaching_staff 
where subject_name = 'maths' or subject_name='english';

select name from teaching_staff 
 where subject_name in('english','maths');
-- Display all non-teaching staff except those in the “cleaning” department.
select name, department from nonteaching_staff
where department <> 'cleaning';
-- Find all students whose names start with ‘A’.
select student_name from  class1_students where student_name like 'A%' or student_name like 'a%'
union all
select student_name from class2_students where student_name like 'A%'
union all 
select student_name from  class3_students where student_name like 'A%'
union all
select student_name from  class4_students where student_name like 'A%'
union all 
select  student_name from  class5_students where  student_name like 'A%';
-- Find students whose names end with ‘a’.
select student_name from  class1_students where student_name like '%a' 
union all
select student_name from class2_students where student_name like '%a'
union all 
select student_name from  class3_students where student_name like '%a'
union all
select student_name from  class4_students where student_name like '%a'
union all 
select  student_name from  class5_students where  student_name like '%a';

select * from class1_students where left(student_name,2)='sh';

-- List all male students aged between 6 and 8.
select student_name from  class1_students where gender='male' and age between 6 and 8
union all
select student_name from class2_students where gender='male' and age between 6 and 8
union all 
select student_name from  class3_students where gender='male' and age between 6 and 8
union all
select student_name from  class4_students where gender='male' and age between 6 and 8
union all 
select  student_name from  class5_students where  gender='male' and age between 6 and 8;
-- Show all female students in class4 with age < 10.
select student_name from  class4_students where gender='female' and age <10;
-- Display teachers whose name length is more than 5 characters.
select name from teaching_staff where length(name)=5;
-- Find students with null or unpaid fee (paid_amount IS NULL).
select c1_students.student_name 
from s_students.class1_students c1_students
join s_fee.class1fee schoolfee
on c1_students.student_id=schoolfee.student_id
where schoolfee.paid_amount is  null or schoolfee.paid_amount = 'unpaid'
union all 
select c2_students.student_name 
from s_students.class2_students c2_students
join s_fee.class2fee schoolfee
on c2_students.student_id=schoolfee.student_id
where schoolfee.paid_amount is  null or schoolfee.paid_amount = 'unpaid'
union all 
select c3_students.student_name 
from s_students.class3_students c3_students
join s_fee.class3fee schoolfee
on c3_students.student_id=schoolfee.student_id
where schoolfee.paid_amount is  null or schoolfee.paid_amount = 'unpaid'
union all 
select c4_students.student_name 
from s_students.class4_students c4_students
join s_fee.class4fee schoolfee
on c4_students.student_id=schoolfee.student_id
where schoolfee.paid_amount is  null or schoolfee.paid_amount = 'unpaid'
union all 
select c5_students.student_name 
from s_students.class5_students c5_students
join s_fee.class5fee schoolfee
on c5_students.student_id=schoolfee.student_id
where schoolfee.paid_amount is  null or schoolfee.paid_amount = 'unpaid';
-- Get all students with full payment done (balance = 0).
select student_name from s_students.class1_students c1_students
left join s_fee.class1fee c1fee
on c1_students.student_id=c1fee.student_id
where balance=0
union all 
select student_name from s_students.class2_students c2_students
left join s_fee.class2fee c2fee
on c2_students.student_id=c2fee.student_id
where balance=0
union all
select student_name from s_students.class3_students c3_students
left join s_fee.class3fee c3fee
on c3_students.student_id=c3fee.student_id
where balance=0
union all
select student_name from s_students.class4_students c4_students
left join s_fee.class4fee c4fee
on c4_students.student_id=c4fee.student_id
where balance=0
union all
select student_name from s_students.class5_students c5_students
left join s_fee.class5fee c5fee
on c5_students.student_id=c5fee.student_id
where balance=0;
# aggregations
-- Count total number of students in class1_students.
select coalesce(student_id,'total') as student_id,
count(*) as total_students
from class1_students
group by student_id
with rollup;
-- Count number of female students in class2.
select coalesce(student_id,'total') as student_id,
count(*) as total_student
from class2_students
where gender='female'
group by student_id
with rollup;

select count(*) as total_female_students
from class2_students
where gender='female';

-- Find the average age of students in class3.
select avg(age) as average_age_allstudents
from class3_students;

select round(avg(age),2) as avg_age_allstudents
from class3_students;
-- Show the total fee collected from class4fee.
select sum(paid_amount) as Tfeecollected
from class4fee;
-- Calculate total pending balance for each class (use class1fee–class5fee).










