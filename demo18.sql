/*
	ʹ�ü�¼���ͻ�ȡԱ����Ϣ
*/
DECLARE
	--�����¼����
	TYPE emp_info_type IS RECORD(
		empname VARCHAR2(10),
		job VARCHAR2(9),
		sal NUMBER(7,2)
	);
	--������¼���͵ı���
	empinfo emp_info_type;
BEGIN
	--��ѯ���ݲ����浽��¼������
	SELECT ename,job,sal INTO empinfo FROM emp WHERE empno = &empno;
	--�����¼���ͱ����б����Ա����Ϣ
	DBMS_OUTPUT.put_line('Ա��������'||empinfo.empname||'ְλ��'||empinfo.job||'н�ʣ�'||empinfo.sal);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('û���ҵ���Ӧ������!');
END;
/
