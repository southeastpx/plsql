/*
    ������������Ϳɼ���
*/
<<outer>>
DECLARE
    v_empname VARCHAR2(20);
BEGIN
    v_empname := '����';
    <<inner>>
    DECLARE
        v_empname VARCHAR(20);
    BEGIN
        v_empname := '����';
        --����ڲ��ı���
        DBMS_OUTPUT.put_line('�ڲ���Ա������'||v_empname);
        DBMS_OUTPUT.put_line('�����Ա������'||outer.v_empname);
    END;
    DBMS_OUTPUT.put_line('outerԱ������'||v_empname);
END;
/
