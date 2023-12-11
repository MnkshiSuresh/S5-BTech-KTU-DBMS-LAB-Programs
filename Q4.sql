--Create a PL/SQL package that consist of a procedure to add a new employee and a function to calculate annual bonus.

CREATE TABLE employee(id NUMBER PRIMARY KEY,name VARCHAR2,salary NUMBER);

CREATE OR REPLACE PACKAGE emp_package AS
PROCEDURE add_emp(v_id IN NUMBER,v_name IN VARCHAR2,v_salary IN NUMBER);
FUNCTION annual_bonus(v_id IN NUMBER) RETURN NUMBER;
END emp_package;
/

CREATE OR REPLACE PACKAGE BODY emp_package AS
PROCEDURE add_emp(v_id IN NUMBER,v_name IN VARCHAR2,v_salary IN NUMBER) IS
BEGIN
INSERT INTO employee(id,name,salary) VALUES(v_id,v_name,v_salary);
COMMIT;
dbms_output.put_line('successfully added a row');
END add_emp;

FUNCTION annual_bonus(v_id IN NUMBER) RETURN NUMBER IS
base_salary NUMBER;
annual_bonus NUMBER;
BEGIN
SELECT salary INTO base_salary FROM employee WHERE v_id=id;
annual_bonus := base_salary * 0.15;
RETURN annual_bonus;

EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN NULL;
WHEN OTHERS THEN
RETURN NULL;
END annual_bonus;

END emp_package;
/



BEGIN
emp_package.add_emp(1,'meenu',2000);
emp_package.add_emp(2,'manu',4800);
END;
/
DECLARE
    bonus NUMBER;
BEGIN
bonus := emp_package.annual_bonus(2);
dbms_output.put_line('annual bonus: '||bonus);
END;
/

SELECT * FROM employee;
