/*
	ʹ��˳��ṹ����Ա������
*/
DECLARE
	--�������
	v_sal1 NUMBER;
	v_sal2 NUMBER;
	v_sumsal NUMBER;
BEGIN
	--��ѯ���Ϊ7369��Ա��н��
	SELECT sal INTO v_sal1 FROM emp WHERE empno = '7369';
	--��ѯ���Ϊ7788��Ա��н��
	SELECT sal INTO v_sal2 FROM emp WHERE empno = '7788';
	--���ܹ���
	v_sumsal := v_sal1 + v_sal2;
	--������
	DBMS_OUTPUT.put_line('Ա�����Ϊ7369��7788�Ĺ����ܺ�Ϊ��'||v_sumsal);
END;
/