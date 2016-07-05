/*
	完整的plsql块，向dept表中增加一条记录
*/
DECLARE
	--定义记录数变量
	v_deptCount NUMBER(2);
	--定义部门编号，并赋值
	v_deptno NUMBER(2) := 60;
BEGIN
	SELECT COUNT(1) INTO v_deptCount FROM dept WHERE deptno = v_deptno;
	IF v_deptCount = 0 THEN
		INSERT INTO dept VALUES(v_deptno,'财务部','深圳');
		--写入屏幕信息
		DBMS_OUTPUT.put_line('成功插入部门资料!');
	ELSE
		DBMS_OUTPUT.put_line('该部门已经存在!');
	END IF;
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.put_line('插入部门资料失败!');
END;
/
