/*
	创建函数封装业务逻辑
*/
CREATE OR REPLACE FUNCTION getaddsalaryratio (p_job VARCHAR2)
	RETURN NUMBER
AS
	v_result NUMBER(7,2);
BEGIN
	IF p_job = 'CLREK' THEN
		v_result := 0.10;
	ELSIF p_job = 'SALESMAN' THEN
		v_result := 0.12;
	ELSIF p_job = 'MANAGER' THEN
		v_result := 0.15;
	END IF;
	RETURN v_result;
END;
/
