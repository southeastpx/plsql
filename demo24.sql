/*
    使用%ROWTYPE定义游标类型的变量
*/
DECLARE
    CURSOR emp_cursor IS SELECT empno,ename,job,sal,hiredate FROM emp;
    v_emp emp_cursor%ROWTYPE;
BEGIN
   OPEN emp_cursor;
   LOOP
    FETCH emp_cursor INTO v_emp;
    EXIT WHEN emp_cursor%NOTFOUND;
    --输出游标内容
    DBMS_OUTPUT.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||TO_CHAR(v_emp.hiredate,'YYYY-MM-DD'));
   END LOOP;
    --关闭游标
    CLOSE emp_cursor;
END;
/
