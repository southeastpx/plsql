/*
    CHAR���Ͷ���ʾ��
*/
DECLARE
    v_name CHAR(2 BYTE);
    v_name2 CHAR(2 CHAR);
    v_name3 CHAR;
    v_name4 CHAR(20);
BEGIN
    v_name := 'ab';--��ȷ
    --v_name := '�й�';--����
    v_name2 := '�й�';--��ȷ
    v_name3 := 2;--��ȷ
    v_name4 := 'THIS IS STRING';--��ȷ
    DBMS_OUTPUT.put_line(LENGTH(v_name4));
END;
/
