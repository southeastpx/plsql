/*
    ��%ROWTYPE����ı��������
*/
DECLARE 
    v_emp emp%ROWTYPE;
BEGIN
    v_emp.empno := 8000;
    v_emp.ename := '������';
    v_emp.job := '����';
    v_emp.mgr := 7902;
    v_emp.hiredate := date'2010-12-13';
    v_emp.sal := 9000;
    v_emp.deptno := 20;
    INSERT INTO emp VALUES v_emp;
END;
/
