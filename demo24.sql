/*
    ʹ��%ROWTYPE�����α����͵ı���
*/
DECLARE
    CURSOR emp_cursor IS SELECT empno,ename,job,sal,hiredate FROM emp;
    v_emp emp_cursor%ROWTYPE;
BEGIN
   OPEN emp_cursor;
   LOOP
    FETCH emp_cursor INTO v_emp;
    EXIT WHEN emp_cursor%NOTFOUND;
    --����α�����
    DBMS_OUTPUT.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||TO_CHAR(v_emp.hiredate,'YYYY-MM-DD'));
   END LOOP;
    --�ر��α�
    CLOSE emp_cursor;
END;
/
