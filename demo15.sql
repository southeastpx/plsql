/*
	Ա����н���������
*/
--���淶����
CREATE OR REPLACE PACKAGE empsalary
AS 
	--ִ��ʵ�ʵļ�н����
	PROCEDURE addempsalary(p_ratio NUMBER,p_empno NUMBER);
	--��н��������
	FUNCTION getaddempsalaryratio(p_job VARCHAR2) RETURN NUMBER;
	--ʹ��CASE���õ���н����
	FUNCTION getaddsalaryratiocase(p_job VARCHAR2) RETURN NUMBER;
END empsalary;
/
--���嶨��
CREATE OR REPLACE PACKAGE BODY empsalary
AS 
	PROCEDURE addempsalary(p_ratio NUMBER,p_empno NUMBER) 
	AS 
	BEGIN
		IF p_ratio>0 THEN
			UPDATE c##scott.emp SET sal=sal*(1+p_ratio) WHERE empno=p_empno;
		END IF;
		--��ʾ��н�ɹ�
		DBMS_OUTPUT.put_line('��н�ɹ�!');
	END;

	--��ȡ��н�����ĺ���
	FUNCTION getaddempsalaryratio(p_job VARCHAR2) RETURN NUMBER
	AS
		v_ratio NUMBER(7,2);
	BEGIN
		IF p_job = 'CLERK' THEN 
			v_ratio := 0.10;
		ELSIF p_job = 'SALESMAN' THEN
			v_ratio := 0.12;
		ELSIF p_job = 'MANAGER' THEN
			v_ratio := 0.15;
		END IF;
		RETURN v_ratio;
	END;

	--ʹ��case��ȡ��н����
	FUNCTION getaddsalaryratiocase(p_job VARCHAR2) RETURN NUMBER
	AS
		v_ratio NUMBER(7,2);
	BEGIN
		CASE p_job 
			WHEN 'CLEAK' THEN
				v_ratio := 0.10;
			WHEN 'SALESMAN' THEN
				v_ratio := 0.12;
			WHEN 'MANAGER' THEN
				v_ratio := 0.15;	
		END CASE;
		RETURN v_ratio;
	END;
	
END empsalary;
/
