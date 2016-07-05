/*
	创建为员工加薪的过程
*/
CREATE OR REPLACE PROCEDURE addempsalary (p_ratio NUMBER,p_empno NUMBER)
AS
BEGIN
	IF p_ratio >0 THEN
		UPDATE c##scott.emp SET sal = sal*(1+p_ratio) WHERE empno = p_empno;
	END IF;
	--提示加薪成功
	DBMS_OUTPUT.put_line('加薪成功!');
END;
/
