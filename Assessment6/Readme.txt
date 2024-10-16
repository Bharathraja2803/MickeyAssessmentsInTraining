Assessment 6

DB name: bharath_custom_view_db
Q1.
Module Name: BharathAssessment6NormalCustomViewConf
Table Names:
	bharath_employee
	bharath_department
	bharath_emp_department_mapping
	
Jsp Link: GET http://localhost:8080/Assessment6BharathNormalCustomViewConf/completeEmployeeDetails.jsp
Description: This will get the employee with department id details without any pre-defined criteria in xml
Insert Query:
	insert into bharath_employee (employee_id, emp_name, emp_email_id) values (10, 'bharath', 'bharath@gmail.com');
	insert into bharath_employee (employee_id, emp_name, emp_email_id) values (11, 'nandha', 'nandha@gmail.com');
	insert into bharath_employee (employee_id, emp_name, emp_email_id) values (12, 'vijay', 'vijay@gmail.com');
	insert into bharath_employee (employee_id, emp_name, emp_email_id) values (13, 'vinay', 'vinay@gmail.com');
	insert into bharath_employee (employee_id, emp_name, emp_email_id) values (14, 'kishore', 'kishore@gmail.com');
	insert into bharath_employee (employee_id, emp_name, emp_email_id) values (15, 'prashanth', 'prashanth@gmail.com');
	insert into bharath_employee (employee_id, emp_name, emp_email_id) values (16, 'murali', 'murali@gmail.com');


	insert into bharath_department (department_id, department_name) values (100, 'Sales');
	insert into bharath_department (department_id, department_name) values (101, 'Purchase');
	insert into bharath_department (department_id, department_name) values (102, 'Marketing');

	insert into bharath_emp_department_mapping (department_id, employee_id) values (101, 10);
	insert into bharath_emp_department_mapping (department_id, employee_id) values (100, 11);
	insert into bharath_emp_department_mapping (department_id, employee_id) values (102, 12);
	insert into bharath_emp_department_mapping (department_id, employee_id) values (100, 13);
	insert into bharath_emp_department_mapping (department_id, employee_id) values (101, 14);
	insert into bharath_emp_department_mapping (department_id, employee_id) values (101, 15);
	insert into bharath_emp_department_mapping (department_id, employee_id) values (102, 16);
	
	
Q2. 
Module Name: BharathAssessment6ContainsTemplate
Table Names:
	bharath_employee_contains_template
	bharath_department_contains_template
	bharath_emp_department_mapping_contains_template
Jsp Link: GET http://localhost:8080/Assessment6BharathContainsTemplate/employeeWithDepartment100.jsp
Description: This will display all the employees whose department Id is 100 which is pre-defined in xml file
Insert Query:
	insert into bharath_employee_contains_template (employee_id, emp_name, emp_email_id) values (10, 'bharath', 'bharath@gmail.com');
	insert into bharath_employee_contains_template (employee_id, emp_name, emp_email_id) values (11, 'nandha', 'nandha@gmail.com');
	insert into bharath_employee_contains_template (employee_id, emp_name, emp_email_id) values (12, 'vijay', 'vijay@gmail.com');
	insert into bharath_employee_contains_template (employee_id, emp_name, emp_email_id) values (13, 'vinay', 'vinay@gmail.com');
	insert into bharath_employee_contains_template (employee_id, emp_name, emp_email_id) values (14, 'kishore', 'kishore@gmail.com');
	insert into bharath_employee_contains_template (employee_id, emp_name, emp_email_id) values (15, 'prashanth', 'prashanth@gmail.com');
	insert into bharath_employee_contains_template (employee_id, emp_name, emp_email_id) values (16, 'murali', 'murali@gmail.com');


	insert into bharath_department_contains_template (department_id, department_name) values (100, 'Sales');
	insert into bharath_department_contains_template (department_id, department_name) values (101, 'Purchase');
	insert into bharath_department_contains_template (department_id, department_name) values (102, 'Marketing');

	insert into bharath_emp_department_mapping_contains_template (department_id, employee_id) values (101, 10);
	insert into bharath_emp_department_mapping_contains_template (department_id, employee_id) values (100, 11);
	insert into bharath_emp_department_mapping_contains_template (department_id, employee_id) values (102, 12);
	insert into bharath_emp_department_mapping_contains_template (department_id, employee_id) values (100, 13);
	insert into bharath_emp_department_mapping_contains_template (department_id, employee_id) values (101, 14);
	insert into bharath_emp_department_mapping_contains_template (department_id, employee_id) values (101, 15);
	insert into bharath_emp_department_mapping_contains_template (department_id, employee_id) values (102, 16);
	
Q3.
Module Name: BharathAssessment6DynamicCustomView
Table Names: 
	bharath_employee_dynamic
	bharath_emp_salarydetails_dynamic
Jsp Link: http://localhost:8080/Assessment6BharathDynamic
PostManLink: GET http://localhost:8080/Assessment6BharathDynamic/EmployeeWithSalaryLessThanUserInputServlet?salaryMaxRange=13000
Description: this will print the employee details who is getting salary less than user defined salary
Insert Query:
	insert into bharath_employee_dynamic (employee_id, emp_name, emp_email_id) values (10, 'bharath', 'bharath@gmail.com');
	insert into bharath_employee_dynamic (employee_id, emp_name, emp_email_id) values (11, 'nandha', 'nandha@gmail.com');
	insert into bharath_employee_dynamic (employee_id, emp_name, emp_email_id) values (12, 'vijay', 'vijay@gmail.com');
	insert into bharath_employee_dynamic (employee_id, emp_name, emp_email_id) values (13, 'vinay', 'vinay@gmail.com');
	insert into bharath_employee_dynamic (employee_id, emp_name, emp_email_id) values (14, 'kishore', 'kishore@gmail.com');
	insert into bharath_employee_dynamic (employee_id, emp_name, emp_email_id) values (15, 'prashanth', 'prashanth@gmail.com');
	insert into bharath_employee_dynamic (employee_id, emp_name, emp_email_id) values (16, 'murali', 'murali@gmail.com');


	insert into bharath_emp_salarydetails_dynamic (employee_id, salary) values (10, 12000);
	insert into bharath_emp_salarydetails_dynamic (employee_id, salary) values (11, 14000);
	insert into bharath_emp_salarydetails_dynamic (employee_id, salary) values (12, 13000);
	insert into bharath_emp_salarydetails_dynamic (employee_id, salary) values (13, 15000);
	insert into bharath_emp_salarydetails_dynamic (employee_id, salary) values (14, 17500);
	insert into bharath_emp_salarydetails_dynamic (employee_id, salary) values (15, 13200);
	insert into bharath_emp_salarydetails_dynamic (employee_id, salary) values (16, 17000);