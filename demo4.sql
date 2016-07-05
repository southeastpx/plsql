/*
	创建员工对象
*/
--定义对象类型
CREATE OR REPLACE TYPE emp_obj AS OBJECT (
	empno NUMBER(4),
	ename VARCHAR2(10),
	job VARCHAR(9),
	sal NUMBER(7,2),
	deptno NUMBER(2)
	--加薪方法
	MEMBER PROCEDURE addsalary(radio NUMBER);
);
/

--定义对象体
CREATE OR REPLACE TYPE BODY emp_obj
AS 
	--实现对象方法
	MEMBER PROCEDURE addsalary (radio NUMBER)
	IS
	BEGIN
		sal := sal*(1+radio);
	END;
END;
/