/*
	������plsql�飬��dept��������һ����¼
*/
DECLARE
	--�����¼������
	v_deptCount NUMBER(2);
	--���岿�ű�ţ�����ֵ
	v_deptno NUMBER(2) := 60;
BEGIN
	SELECT COUNT(1) INTO v_deptCount FROM dept WHERE deptno = v_deptno;
	IF v_deptCount = 0 THEN
		INSERT INTO dept VALUES(v_deptno,'����','����');
		--д����Ļ��Ϣ
		DBMS_OUTPUT.put_line('�ɹ����벿������!');
	ELSE
		DBMS_OUTPUT.put_line('�ò����Ѿ�����!');
	END IF;
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.put_line('���벿������ʧ��!');
END;
/
