/*
    CHAR类型定义示例
*/
DECLARE
    v_name CHAR(2 BYTE);
    v_name2 CHAR(2 CHAR);
    v_name3 CHAR;
    v_name4 CHAR(20);
BEGIN
    v_name := 'ab';--正确
    --v_name := '中国';--错误
    v_name2 := '中国';--正确
    v_name3 := 2;--正确
    v_name4 := 'THIS IS STRING';--正确
    DBMS_OUTPUT.put_line(LENGTH(v_name4));
END;
/
