/*
	调用函数简化程序代码
*/
DECLARE
	--定义员工职位变量
	v_job VARCHAR2(100);
	--定义员工编号变量
	v_empno VARCHAR2(20);
	--定义员工名称变量
	v_ename VARCHAR2(60);
	v_ratio NUMBER(7,2);
	CURSOR c_emp IS SELECT job,empno,ename FROM c##scott.emp FOR UPDATE;
BEGIN
	--打开游标
	OPEN c_emp;
	LOOP
		FETCH c_emp INTO v_job,v_empno,v_ename;
		EXIT WHEN c_emp%NOTFOUND;
		--调用函数
		v_ratio := getaddsalaryratio(v_job);
		UPDATE c##scott.emp SET sal = sal*(1+v_ratio) WHERE CURRENT OF c_emp;
		--显示完成信息
		DBMS_OUTPUT.put_line('已经为员工'||v_empno||':'||v_ename||'成功加薪!');
	END LOOP;
	--关闭游标
	CLOSE c_emp;
EXCEPTION
	WHEN others THEN
		DBMS_OUTPUT.put_line('没有找到员工数据!');
END;
/
