/*
	使用分支结构为员工加薪
*/
DECLARE
	--定义加薪比例常量
	c_manager CONSTANT NUMBER := 0.15;
	c_salesman CONSTANT NUMBER := 0.12;
	c_clerk CONSTANT NUMBER := 0.10;
	--定义职位变量
	v_job VARCHAR(100);
BEGIN
	--查询指定员工编码的员工信息
	SELECT job 
		INTO v_job 
	  FROM c##scott.emp 
	  WHERE empno = &empno1;
	--执行分支判断
	IF v_job = 'CLERK' THEN
		UPDATE c##scott.emp 
			SET sal = sal*(1+c_clerk)
		  WHERE empno = &empno1;
	ELSIF v_job = 'MANAGER' THEN
		UPDATE c##scott.emp
			SET sal=sal*(1+c_manager) 
		 WHERE empno = &empno1;
	ELSIF v_job = 'SALESMAN' THEN
		UPDATE c##scott.emp
			SET sal = sal*(1+c_salesman)
		 WHERE empno = &empno1;
	END IF;
	--显示完成信息
	DBMS_OUTPUT.put_line('已经为员工'||&empno1||'成功加薪！');
EXCEPTION
	--处理plsql预定义异常
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('没有找到员工数据');
END;
/