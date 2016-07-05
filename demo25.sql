/*
    变量的作用域和可见性
*/
<<outer>>
DECLARE
    v_empname VARCHAR2(20);
BEGIN
    v_empname := '张三';
    <<inner>>
    DECLARE
        v_empname VARCHAR(20);
    BEGIN
        v_empname := '李四';
        --输出内层块的变量
        DBMS_OUTPUT.put_line('内层块的员工名称'||v_empname);
        DBMS_OUTPUT.put_line('外层块的员工名称'||outer.v_empname);
    END;
    DBMS_OUTPUT.put_line('outer员工名称'||v_empname);
END;
/
