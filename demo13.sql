/*
	ʹ��FORѭ����ӡ�žų˷���
*/
DECLARE
	--���ѭ������
	v_number1 NUMBER(3);
	--�ڲ�ѭ������
	v_number2 NUMBER(3);
BEGIN
	FOR v_number1 IN 1 .. 9 
	LOOP
		--�ڲ�ѭ��
		FOR v_number2 IN 1 .. v_number1
		LOOP 
			--��ӡ�ھ�����
			DBMS_OUTPUT.put(v_number1||'*'||v_number2||'='||v_number1*v_number2||'  ');
		END LOOP;
		--�������
		DBMS_OUTPUT.put_line('');
	END LOOP;
END;
/
