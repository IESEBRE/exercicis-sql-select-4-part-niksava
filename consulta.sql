-- 0.


-- 1.
SELECT L.LOCATION_ID, COUNT(D.DEPARTMENT_ID) AS NUM_DEPARTMENTS
FROM LOCATIONS L
LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
WHERE D.DEPARTMENT_ID IS NOT NULL
GROUP BY L.LOCATION_ID;

-- 2.
SELECT L.LOCATION_ID, COUNT(D.DEPARTMENT_ID) AS NUM_DEPARTMENTS
FROM LOCATIONS L
LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
GROUP BY L.LOCATION_ID;

-- 3.
SELECT L.LOCATION_ID, COUNT(D.DEPARTMENT_ID) AS NUM_DEPARTMENTS
FROM LOCATIONS L
LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
GROUP BY L.LOCATION_ID
HAVING COUNT(D.DEPARTMENT_ID) > 1;

-- 4.
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(E.EMPLOYEE_ID) AS NUM_EMPLOYEES, 
       SUM(E.SALARY) AS TOTAL_SALARY, AVG(E.SALARY) AS AVG_SALARY
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.LOCATION_ID
ORDER BY D.LOCATION_ID ASC, AVG(E.SALARY) DESC;

-- 5.
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(E.EMPLOYEE_ID) AS NUM_EMPLOYEES,
       SUM(E.SALARY) AS TOTAL_SALARY, AVG(E.SALARY) AS AVG_SALARY
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.LOCATION_ID
UNION ALL
SELECT 'NO DEPARTMENT' AS DEPARTMENT_NAME, NULL AS LOCATION_ID, 
       COUNT(E.EMPLOYEE_ID) AS NUM_EMPLOYEES, SUM(E.SALARY) AS TOTAL_SALARY, 
       AVG(E.SALARY) AS AVG_SALARY
FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID IS NULL;

-- 6.
SELECT c.country_name AS "Pais", COUNT(e.employee_id) AS "Número de empleats"
FROM countries c
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id
GROUP BY c.country_name
ORDER BY c.country_name;

-- 7.
SELECT c.country_name AS "Pais", COUNT(e.employee_id) AS "Número de empleats"
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id
LEFT JOIN departments d ON l.location_id = d.location_id
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY c.country_name
ORDER BY c.country_name;

-- 8.
SELECT 
    e.first_name || ' ' || e.last_name AS "Nom",
    TO_CHAR(e.hire_date, 'DD/MM/YY') AS "Data con Cap",
    m.first_name || ' ' || m.last_name AS "Cap",
    d.department_name AS "Departament del cap",
    j.job_title AS "Ocupació del cap"
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
LEFT JOIN departments d ON m.department_id = d.department_id
LEFT JOIN jobs j ON m.job_id = j.job_id
ORDER BY e.hire_date;
-- 9.
SELECT e.first_name || ' ' || e.last_name 
AS "Nom", TO_CHAR(jh.start_date, 'DD Month YYYY') 
AS "Data inici", TO_CHAR(jh.end_date, 'DD Month YYYY') 
AS "Data fi", d.department_name 
AS "Departament",j.job_title 
AS "Ocupació"
FROM job_history jh
JOIN employees e ON jh.employee_id = e.employee_id
JOIN jobs j ON jh.job_id = j.job_id
LEFT JOIN departments d ON e.department_id = d.department_id
ORDER BY jh.start_date, "Nom";

-- 10.

