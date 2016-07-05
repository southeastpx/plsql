/*
	员工加薪管理包代码
*/
--包规范定义
CREATE OR REPLACE PACKAGE empsalary
AS 
	--执行实际的加薪动作
	PROCEDURE addempsalary(p_ratio NUMBER,p_empno NUMBER);
	--加薪比例函数
	FUNCTION getaddempsalaryratio(p_job VARCHAR2) RETURN NUMBER;
	--使用CASE语句得到加薪比例
	FUNCTION getaddsalaryratiocase(p_job VARCHAR2) RETURN NUMBER;
END empsalary;
/
--包体定义
CREATE OR REPLACE PACKAGE BODY empsalary
AS 
	PROCEDURE addempsalary(p_ratio NUMBER,p_empno NUMBER) 
	AS 
	BEGIN
		IF p_ratio>0 THEN
			UPDATE c##scott.emp SET sal=sal*(1+p_ratio) WHERE empno=p_empno;
		END IF;
		--提示加薪成功
		DBMS_OUTPUT.put_line('加薪成功!');
	END;

	--获取加薪比例的函数
	FUNCTION getaddempsalaryratio(p_job VARCHAR2) RETURN NUMBER
	AS
		v_ratio NUMBER(7,2);
	BEGIN
		IF p_job = 'CLERK' THEN 
			v_ratio := 0.10;
		ELSIF p_job = 'SALESMAN' THEN
			v_ratio := 0.12;
		ELSIF p_job = 'MANAGER' THEN
			v_ratio := 0.15;
		END IF;
		RETURN v_ratio;
	END;

	--使用case获取加薪比例
	FUNCTION getaddsalaryratiocase(p_job VARCHAR2) RETURN NUMBER
	AS
		v_ratio NUMBER(7,2);
	BEGIN
		CASE p_job 
			WHEN 'CLEAK' THEN
				v_ratio := 0.10;
			WHEN 'SALESMAN' THEN
				v_ratio := 0.12;
			WHEN 'MANAGER' THEN
				v_ratio := 0.15;	
		END CASE;
		RETURN v_ratio;
	END;
	
END empsalary;
/
