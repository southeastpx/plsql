/*
	使用CASE语句进行条件判断
*/
CREATE OR REPLACE FUNCTION getaddsalaryratio (p_job VARCHAR2) 
	RETURN NUMBER
AS
	v_ratio NUMBER(7,2);
BEGIN
	CASE p_job
	    WHEN 'CLERK' THEN
		v_ratio := 0.10;
	    WHEN 'SALESMAN' THEN
		v_ratio := 0.12;
	    WHEN 'MANAGER' THEN
		v_ratio := 0.15;
	END CASE;
	RETURN v_ratio;
END;
/
