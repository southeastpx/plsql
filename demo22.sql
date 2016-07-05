/* 
    使用数据库数据为变量赋值
*/
DECLARE 
    v_empno emp.empno%type;
    v_ename emp.ename%type;
    v_hiredate emp.hiredate%type;
BEGIN
    SELECT empno,ename,hiredate INTO v_empno,v_ename,v_hiredate FROM emp WHERE empno = &empno;
    --输出变量内容
    DBMS_OUTPUT.put_line('员工编号：'||v_empno);
    DBMS_OUTPUT.put_line('员工名称：'||v_ename);
    DBMS_OUTPUT.put_line('雇佣日期：'||v_hiredate);
END;
/
