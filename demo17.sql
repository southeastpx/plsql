/*
	触发plsql预定义异常
*/
DECLARE
	v_ename VARCHAR2(30);
BEGIN
	--查询表中的员工名称
	SELECT ename INTO v_ename FROM emp WHERE empno = &empno;
	DBMS_OUTPUT.put_line('员工名称为：'||v_ename);
EXCEPTION
	--异常刷选起
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('没有找到记录!');
	WHEN OTHERS THEN 
		DBMS_OUTPUT.put_line('其他未处理异常!');
END;
/
