/*
	使用游标和索引表显示员工名称
*/
DECLARE
	--定义员工名称索引表
	TYPE emp_table IS TABLE OF VARCHAR2(10) INDEX BY BINARY_INTEGER;
	--定义索引表类型变量
	emplist emp_table;
	--定义游标类型
	CURSOR empcursor IS SELECT ename FROM emp;
BEGIN
	--如果游标没有打开，则打开游标
	IF NOT empcursor%ISOPEN THEN
		OPEN empcursor;
	END IF;
	--从游标结果中提取所有的员工名称
	FETCH empcursor BULK COLLECT INTO emplist;
	--使用FOR循环显示所有的员工名称
	FOR i IN 1 .. emplist.COUNT
	LOOP
		DBMS_OUTPUT.put_line('员工名称：'||emplist(i));
	END LOOP;
	--关闭游标
	CLOSE empcursor;
END;
/
