/*
    将%ROWTYPE定义的变量插入表
*/
DECLARE 
    v_emp emp%ROWTYPE;
BEGIN
    v_emp.empno := 8000;
    v_emp.ename := '张三峰';
    v_emp.job := '掌门';
    v_emp.mgr := 7902;
    v_emp.hiredate := date'2010-12-13';
    v_emp.sal := 9000;
    v_emp.deptno := 20;
    INSERT INTO emp VALUES v_emp;
END;
/
