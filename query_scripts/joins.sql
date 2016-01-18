USE hr_db;

SELECT
	locations.LOCATION_ID,
	departments.DEPARTMENT_NAME,
	locations.STREET_ADDRESS, locations.CITY, locations.STATE_PROVINCE,
	countries.COUNTRY_NAME
FROM locations
	JOIN countries ON locations.COUNTRY_ID = countries.COUNTRY_ID
	JOIN departments ON locations.LOCATION_ID = departments.LOCATION_ID;

SELECT
	employees.FIRST_NAME, employees.LAST_NAME, employees.DEPARTMENT_ID,
	departments.DEPARTMENT_NAME
FROM employees
	JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;

SELECT
	employees.FIRST_NAME, employees.LAST_NAME,
    jobs.JOB_TITLE,
    employees.DEPARTMENT_ID,
	departments.DEPARTMENT_NAME
FROM employees
	JOIN jobs ON employees.JOB_ID = jobs.JOB_ID
	JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
    JOIN locations ON locations.LOCATION_ID = departments.LOCATION_ID
		WHERE locations.CITY = 'London';

SELECT
	departments.DEPARTMENT_NAME, COUNT(employees.DEPARTMENT_ID)
FROM employees
	JOIN departments ON departments.DEPARTMENT_ID = employees.DEPARTMENT_ID
		GROUP BY DEPARTMENT_NAME;

SELECT
	FIRST_NAME, LAST_NAME, HIRE_DATE
FROM employees
	WHERE HIRE_DATE > (SELECT HIRE_DATE FROM employees WHERE LAST_NAME = 'Jones')
