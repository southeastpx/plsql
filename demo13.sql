/*
	使用FOR循环打印九九乘法表
*/
DECLARE
	--外层循环变量
	v_number1 NUMBER(3);
	--内层循环变量
	v_number2 NUMBER(3);
BEGIN
	FOR v_number1 IN 1 .. 9 
	LOOP
		--内层循环
		FOR v_number2 IN 1 .. v_number1
		LOOP 
			--打印口诀内容
			DBMS_OUTPUT.put(v_number1||'*'||v_number2||'='||v_number1*v_number2||'  ');
		END LOOP;
		--输出换行
		DBMS_OUTPUT.put_line('');
	END LOOP;
END;
/
