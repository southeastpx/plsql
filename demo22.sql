/* 
    ʹ�����ݿ�����Ϊ������ֵ
*/
DECLARE 
    v_empno emp.empno%type;
    v_ename emp.ename%type;
    v_hiredate emp.hiredate%type;
BEGIN
    SELECT empno,ename,hiredate INTO v_empno,v_ename,v_hiredate FROM emp WHERE empno = &empno;
    --�����������
    DBMS_OUTPUT.put_line('Ա����ţ�'||v_empno);
    DBMS_OUTPUT.put_line('Ա�����ƣ�'||v_ename);
    DBMS_OUTPUT.put_line('��Ӷ���ڣ�'||v_hiredate);
END;
/
