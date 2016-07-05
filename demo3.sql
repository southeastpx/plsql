/*
	使用循环结构为所有员工加薪
*/
DECLARE
	--定义加薪比例常量
	c_manager CONSTANT NUMBER := 0.15;
	c_salesman CONSTANT NUMBER := 0.12;
	c_clerk CONSTANT NUMBER := 0.10;
	--定义职位变量
	v_job VARCHAR(100);
	--定义员工编号变量
	v_empno VARCHAR(20);
	--定义员工名称变量
	v_ename VARCHAR(60);
	--定义游标变量
	CURSOR c_emp IS SELECT job,empno,ename FROM c##scott.emp FOR UPDATE;
BEGIN
	--打开游标
	OPEN c_emp;
	--循环游标
	LOOP
		FETCH c_emp INTO v_job,v_empno,v_ename;
		EXIT WHEN c_emp%NOTFOUND;
		IF v_job = 'CLERK' THEN
			UPDATE c##scott.emp 
				SET sal = sal*(1+c_clerk)
			  WHERE CURRENT OF c_emp;
		ELSIF v_job = 'MANAGER' THEN
			UPDATE c##scott.emp 
				SET sal = sal*(1+c_manager)
			  WHERE CURRENT OF c_emp;
		ELSE
			UPDATE c##scott.emp 
				SET sal = sal*(1+c_salesman)
			  WHERE CURRENT OF c_emp;
		END IF;
		--显示完成信息
		DBMS_OUTPUT.put_line('已经为员工'||v_empno||':'||v_ename||'成功加薪！');
	END LOOP;
	--关闭游标
	CLOSE c_emp;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('没有找到员工数据！');
END;
/