/*
	使用嵌套块插入和更新部门表
*/
DECLARE
	--定义记录数变量
	v_deptcount NUMBER(2);
	--定义部门编号并赋值
	v_deptno NUMBER(2) := 78;
	v_deptname VARCHAR2(12);
BEGIN
	--内部嵌套块
	BEGIN
		SELECT dname INTO v_deptname FROM dept WHERE deptno = v_deptno;
		DBMS_OUTPUT.put_line('您查询的部门名称为：'||v_deptname);
	END;
	--内部嵌套块
	DECLARE
		v_loc VARCHAR2(10) := '深圳罗湖';
	BEGIN
		--执行插入操作
		UPDATE dept SET loc = v_loc WHERE deptno = v_deptno;
		--写入屏幕信息
		DBMS_OUTPUT.put_line('在内部嵌套块中成功更新部门资料!');
	END;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		--内部嵌套块
		BEGIN
			INSERT INTO dept VALUES(v_deptno,'研发部','上海');
			DBMS_OUTPUT.put_line('在异常处理嵌套块中成功插入部门信息!');
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.put_line(SQLERRM);
		END;
END;
/
