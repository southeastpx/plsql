/*
	����plsqlԤ�����쳣
*/
DECLARE
	v_ename VARCHAR2(30);
BEGIN
	--��ѯ���е�Ա������
	SELECT ename INTO v_ename FROM emp WHERE empno = &empno;
	DBMS_OUTPUT.put_line('Ա������Ϊ��'||v_ename);
EXCEPTION
	--�쳣ˢѡ��
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('û���ҵ���¼!');
	WHEN OTHERS THEN 
		DBMS_OUTPUT.put_line('����δ�����쳣!');
END;
/
