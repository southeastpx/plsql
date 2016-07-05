/*
	Ϊemp���崥����
*/
--���������н��¼�ı�
CREATE TABLE c##scott.raisesalarylog
(
	empno NUMBER(10) NOT NULL PRIMARY KEY,--Ա�����
	raisedate DATE,--��н����
	originalSal NUMBER(10,2),--��нǰ����
	raiseSal NUMBER(10,2)--��н������
);
/

--���崥����
CREATE OR REPLACE TRIGGER c##scott.raisesalarychange
--����AFTER������
AFTER UPDATE OF sal
ON c##scott.emp
--�м�������
FOR EACH ROW
DECLARE
	--�����¼��������
	v_reccount INT;
BEGIN
	SELECT COUNT(*) INTO v_reccount FROM c##scott.raisesalarylog WHERE empno = :old.empno;
       	IF v_reccount = 0 THEN
		INSERT INTO c##scott.raisesalarylog VALUES(:old.empno,SYSDATE,:old.sal,:new.sal);
	ELSE
		UPDATE c##scott.raisesalarylog SET raisedate = SYSDATE,originalsal = :old.sal,raisesal = :new.sal WHERE empno = :old.empno;
	END IF;	
EXCEPTION 
	WHEN others THEN
		DBMS_OUTPUT.put_line(SQLERRM);
END;
/
