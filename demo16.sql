/*
	为emp表定义触发器
*/
--创建保存加薪记录的表
CREATE TABLE c##scott.raisesalarylog
(
	empno NUMBER(10) NOT NULL PRIMARY KEY,--员工编号
	raisedate DATE,--加薪日期
	originalSal NUMBER(10,2),--加薪前日期
	raiseSal NUMBER(10,2)--加薪后日期
);
/

--定义触发器
CREATE OR REPLACE TRIGGER c##scott.raisesalarychange
--定义AFTER触发器
AFTER UPDATE OF sal
ON c##scott.emp
--行级触发器
FOR EACH ROW
DECLARE
	--定义记录个数变量
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
