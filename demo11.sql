/*
	plsql��������ʾ��
*/
DECLARE
	--�����������
	v_deptname VARCHAR2(10);
	--ʹ��plslq���Ͷ����������
	v_loopcounter BINARY_INTEGER;
	--�����¼����
	TYPE t_employee IS RECORD(
		empno VARCHAR2(7),
		ename NUMBER(20),
		job VARCHAR2(20)
	);
	--�����¼���ͱ���
	v_employee t_employee;
	--�����α�����
	TYPE csor IS REF CURSOR;
	--����������ƶ�Ĭ��ֵ
	v_data DATE NOT NULL DEFAULT SYSDATE;
BEGIN
	DBMS_OUTPUT.put_line('��ǰ���ڣ�'||v_data);
END;
/
