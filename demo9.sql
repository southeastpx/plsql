/*
	ʹ��Ƕ�׿����͸��²��ű�
*/
DECLARE
	--�����¼������
	v_deptcount NUMBER(2);
	--���岿�ű�Ų���ֵ
	v_deptno NUMBER(2) := 78;
	v_deptname VARCHAR2(12);
BEGIN
	--�ڲ�Ƕ�׿�
	BEGIN
		SELECT dname INTO v_deptname FROM dept WHERE deptno = v_deptno;
		DBMS_OUTPUT.put_line('����ѯ�Ĳ�������Ϊ��'||v_deptname);
	END;
	--�ڲ�Ƕ�׿�
	DECLARE
		v_loc VARCHAR2(10) := '�����޺�';
	BEGIN
		--ִ�в������
		UPDATE dept SET loc = v_loc WHERE deptno = v_deptno;
		--д����Ļ��Ϣ
		DBMS_OUTPUT.put_line('���ڲ�Ƕ�׿��гɹ����²�������!');
	END;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		--�ڲ�Ƕ�׿�
		BEGIN
			INSERT INTO dept VALUES(v_deptno,'�з���','�Ϻ�');
			DBMS_OUTPUT.put_line('���쳣����Ƕ�׿��гɹ����벿����Ϣ!');
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.put_line(SQLERRM);
		END;
END;
/