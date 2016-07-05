/*
	ʹ��ѭ���ṹΪ����Ա����н
*/
DECLARE
	--�����н��������
	c_manager CONSTANT NUMBER := 0.15;
	c_salesman CONSTANT NUMBER := 0.12;
	c_clerk CONSTANT NUMBER := 0.10;
	--����ְλ����
	v_job VARCHAR(100);
	--����Ա����ű���
	v_empno VARCHAR(20);
	--����Ա�����Ʊ���
	v_ename VARCHAR(60);
	--�����α����
	CURSOR c_emp IS SELECT job,empno,ename FROM c##scott.emp FOR UPDATE;
BEGIN
	--���α�
	OPEN c_emp;
	--ѭ���α�
	LOOP
		FETCH c_emp INTO v_job,v_empno,v_ename;
		EXIT WHEN c_emp%NOTFOUND;
		IF v_job = 'CLERK' THEN
			UPDATE c##scott.emp 
				SET sal = sal*(1+c_clerk)
			  WHERE CURRENT OF c_emp;
		ELSIF v_job = 'MANAGER' THEN
			UPDATE c##scott.emp 
				SET sal = sal*(1+c_manager)
			  WHERE CURRENT OF c_emp;
		ELSE
			UPDATE c##scott.emp 
				SET sal = sal*(1+c_salesman)
			  WHERE CURRENT OF c_emp;
		END IF;
		--��ʾ�����Ϣ
		DBMS_OUTPUT.put_line('�Ѿ�ΪԱ��'||v_empno||':'||v_ename||'�ɹ���н��');
	END LOOP;
	--�ر��α�
	CLOSE c_emp;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.put_line('û���ҵ�Ա�����ݣ�');
END;
/