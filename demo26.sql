/*
    ��������ʾ��
*/
DECLARE
    c_salary_rate CONSTANT NUMBER(7,2) := 0.25;--�����н����
    v_salary NUMBER(7,2);
BEGIN
    SELECT sal*(1+c_salary_rate) INTO v_salary FROM emp WHERE empno = &empno;
    --�����Ļ��Ϣ
    DBMS_OUTPUT.put_line('��н���н��'||v_salary);
END;
/
