/*
    常量定义示例
*/
DECLARE
    c_salary_rate CONSTANT NUMBER(7,2) := 0.25;--定义加薪常量
    v_salary NUMBER(7,2);
BEGIN
    SELECT sal*(1+c_salary_rate) INTO v_salary FROM emp WHERE empno = &empno;
    --输出屏幕消息
    DBMS_OUTPUT.put_line('加薪后的薪资'||v_salary);
END;
/
