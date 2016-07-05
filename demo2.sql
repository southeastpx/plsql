/*
	ʹ�÷�֧�ṹΪԱ����н
*/
DECLARE
	--�����н��������
	c_manager CONSTANT NUMBER := 0.15;
	c_salesman CONSTANT NUMBER := 0.12;
	c_clerk CONSTANT NUMBER := 0.10;
	--����ְλ����
	v_job VARCHAR(100);
BEGIN
	--��ѯָ��Ա�������Ա����Ϣ
	SELECT job 
		INTO v_job 
	  FROM c##scott.emp 
	  WHERE empno = &empno1;
	--ִ�з�֧�ж�
	IF v_job = 'CLERK' THEN
		UPDATE c##scott.emp 
			SET sal = sal*(1+c_clerk)
		  WHERE empno = &empno1;
	ELSIF v_job = 'MANAGER' THEN
		UPDATE c##scott.emp
			SET sal=sal*(1+c_manager) 
		 WHERE empno = &empno1;
	ELSIF v_job = 'SALESMAN' THEN
		UPDATE c##scott.emp
			SET sal = sal*(1+c_salesman)
		 WHERE empno = &empno1;
	END IF;
	--��ʾ�����Ϣ
	DBMS_OUTPUT.put_line('�Ѿ�ΪԱ��'||&empno1||'�ɹ���н��');
EXCEPTION
	--����plsqlԤ�����쳣
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('û���ҵ�Ա������');
END;
/