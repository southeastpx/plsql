/*
	���ú����򻯳������
*/
DECLARE
	--����Ա��ְλ����
	v_job VARCHAR2(100);
	--����Ա����ű���
	v_empno VARCHAR2(20);
	--����Ա�����Ʊ���
	v_ename VARCHAR2(60);
	v_ratio NUMBER(7,2);
	CURSOR c_emp IS SELECT job,empno,ename FROM c##scott.emp FOR UPDATE;
BEGIN
	--���α�
	OPEN c_emp;
	LOOP
		FETCH c_emp INTO v_job,v_empno,v_ename;
		EXIT WHEN c_emp%NOTFOUND;
		--���ú���
		v_ratio := getaddsalaryratio(v_job);
		UPDATE c##scott.emp SET sal = sal*(1+v_ratio) WHERE CURRENT OF c_emp;
		--��ʾ�����Ϣ
		DBMS_OUTPUT.put_line('�Ѿ�ΪԱ��'||v_empno||':'||v_ename||'�ɹ���н!');
	END LOOP;
	--�ر��α�
	CLOSE c_emp;
EXCEPTION
	WHEN others THEN
		DBMS_OUTPUT.put_line('û���ҵ�Ա������!');
END;
/