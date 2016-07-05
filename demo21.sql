/*
    变量定义示例
*/
DECLARE 
    v_empname VARCHAR2(20);--定义员工名称
    v_deptname VARCHAR2(20);--定义部门名称
    v_hiredate DATE NOT NULL := SYSDATE;--定义入职日期
    v_empno INT NOT NULL DEFAULT 7369;--定义员工编号
BEGIN
    NULL;
END;
/
