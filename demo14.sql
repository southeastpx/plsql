/*
	����ΪԱ����н�Ĺ���
*/
CREATE OR REPLACE PROCEDURE addempsalary (p_ratio NUMBER,p_empno NUMBER)
AS
BEGIN
	IF p_ratio >0 THEN
		UPDATE c##scott.emp SET sal = sal*(1+p_ratio) WHERE empno = p_empno;
	END IF;
	--��ʾ��н�ɹ�
	DBMS_OUTPUT.put_line('��н�ɹ�!');
END;
/