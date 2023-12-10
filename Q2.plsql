--Define a trigger in PL/SQL that automatically updates last modified column with current timestamp whenever a row modified in a specific table. (Create table and insert values if needed to explain)

CREATE  TABLE eg_table(id NUMBER PRIMARY KEY,data VARCHAR2(100),last_modified TIMESTAMP);
INSERT INTO eg_table(id,data,last_modified) VALUES(1,'data1',NULL);
INSERT INTO eg_table(id,data,last_modified) VALUES(2,'data2',NULL);
COMMIT;

CREATE OR REPLACE TRIGGER updation BEFORE UPDATE ON eg_table FOR EACH ROW
BEGIN
:NEW.last_modified := CURRENT_TIMESTAMP;
END updation;
/

UPDATE eg_table SET data='updated data' WHERE id=1;
SELECT * FROM eg_table;
