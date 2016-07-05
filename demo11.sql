/*
	plsql变量定义示例
*/
DECLARE
	--定义标量类型
	v_deptname VARCHAR2(10);
	--使用plslq类型定义标量类型
	v_loopcounter BINARY_INTEGER;
	--定义记录类型
	TYPE t_employee IS RECORD(
		empno VARCHAR2(7),
		ename NUMBER(20),
		job VARCHAR2(20)
	);
	--定义记录类型变量
	v_employee t_employee;
	--定义游标类型
	TYPE csor IS REF CURSOR;
	--定义变量并制定默认值
	v_data DATE NOT NULL DEFAULT SYSDATE;
BEGIN
	DBMS_OUTPUT.put_line('当前日期：'||v_data);
END;
/
