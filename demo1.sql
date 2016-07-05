/*
	使用顺序结构计算员工工资
*/
DECLARE
	--定义变量
	v_sal1 NUMBER;
	v_sal2 NUMBER;
	v_sumsal NUMBER;
BEGIN
	--查询编号为7369的员工薪资
	SELECT sal INTO v_sal1 FROM emp WHERE empno = '7369';
	--查询编号为7788的员工薪资
	SELECT sal INTO v_sal2 FROM emp WHERE empno = '7788';
	--汇总工资
	v_sumsal := v_sal1 + v_sal2;
	--输出结果
	DBMS_OUTPUT.put_line('员工编号为7369和7788的工资总和为：'||v_sumsal);
END;
/