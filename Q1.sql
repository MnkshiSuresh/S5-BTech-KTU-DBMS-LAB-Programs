--create a PL/SQL procedure that takes in a employees salary and updates it by 10%. Create a function that calculates the net salary by reducing 5% tax. (Create table and insert values if needed)

CREATE TABLE EMPLOYEES(employee_id NUMBER PRIMARY KEY,employee_name VARCHAR2(20),salary NUMBER);
INSERT INTO EMPLOYEES(employee_id,employee_name,salary) VALUES(1,'john','50000');
INSERT INTO EMPLOYEES(employee_id,employee_name,salary) VALUES(2,'manu','60000');
COMMIT;

CREATE OR REPLACE PROCEDURE new_salary(emp_id IN NUMBER) IS
original_salary NUMBER;
BEGIN
SELECT salary INTO original_salary
FROM EMPLOYEES
WHERE employee_id=emp_id;

UPDATE EMPLOYEES
SET salary= original_salary * 1.1
WHERE employee_id=emp_id;
COMMIT;
dbms_output.put_line('Salary updated successfully');
dbms_output.put_line('updated salary: '||original_salary * 1.1);
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('Employee not found');
WHEN OTHERS THEN
dbms_output.put_line('Error in updating salary' || SQLERRM);
END new_salary;
/

CREATE OR REPLACE FUNCTION calc_net_salary(emp_id IN NUMBER) RETURN NUMBER IS
gross_salary NUMBER;
net_salary NUMBER;
BEGIN
SELECT salary INTO gross_salary
FROM EMPLOYEES
WHERE employee_id=emp_id;

net_salary := gross_salary * 0.95;

RETURN net_salary;

EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN NULL;
WHEN OTHERS THEN
RETURN NULL;
END calc_net_salary;
/


CREATE OR REPLACE FUNCTION calc_net_salary(emp_id IN NUMBER) RETURN NUMBER IS
gross_salary NUMBER;
net_salary NUMBER;
BEGIN
SELECT salary INTO gross_salary
FROM EMPLOYEES
WHERE employee_id=emp_id;

net_salary := gross_salary * 0.95;

RETURN net_salary;

EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN NULL;
WHEN OTHERS THEN
RETURN NULL;
END calc_net_salary;
/

EXEC new_salary(2);
DECLARE
net_salary NUMBER;
BEGIN
net_salary := calc_net_salary(2);
dbms_output.put_line('Net salary: '|| net_salary);
END;
/

