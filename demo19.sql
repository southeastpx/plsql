/*
	ʹ���α����������ʾԱ������
*/
DECLARE
	--����Ա������������
	TYPE emp_table IS TABLE OF VARCHAR2(10) INDEX BY BINARY_INTEGER;
	--�������������ͱ���
	emplist emp_table;
	--�����α�����
	CURSOR empcursor IS SELECT ename FROM emp;
BEGIN
	--����α�û�д򿪣�����α�
	IF NOT empcursor%ISOPEN THEN
		OPEN empcursor;
	END IF;
	--���α�������ȡ���е�Ա������
	FETCH empcursor BULK COLLECT INTO emplist;
	--ʹ��FORѭ����ʾ���е�Ա������
	FOR i IN 1 .. emplist.COUNT
	LOOP
		DBMS_OUTPUT.put_line('Ա�����ƣ�'||emplist(i));
	END LOOP;
	--�ر��α�
	CLOSE empcursor;
END;
/
