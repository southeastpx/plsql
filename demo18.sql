/*
	使用记录类型获取员工信息
*/
DECLARE
	--定义记录类型
	TYPE emp_info_type IS RECORD(
		empname VARCHAR2(10),
		job VARCHAR2(9),
		sal NUMBER(7,2)
	);
	--声明记录类型的变量
	empinfo emp_info_type;
BEGIN
	--查询数据并保存到记录类型中
	SELECT ename,job,sal INTO empinfo FROM emp WHERE empno = &empno;
	--输出记录类型变量中保存的员工消息
	DBMS_OUTPUT.put_line('员工姓名：'||empinfo.empname||'职位：'||empinfo.job||'薪资：'||empinfo.sal);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('没有找到相应的数据!');
END;
/
