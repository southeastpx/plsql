/*	
	使用动态sql实现数据处理
*/
DECLARE
	--保存sql语句的变量
	v_sqlstr VARCHAR2(200);
	--保存临时字段值的变量
	v_id INT;
	v_name VARCHAR2(100);
BEGIN
	--在嵌套块中先删除要创建的临时表
	BEGIN
		v_sqlstr := 'DROP TABLE temptalbe';
		EXECUTE IMMEDIATE v_sqlstr;
	EXCEPTION
		WHEN others THEN
			NULL;
	END;
	v_sqlstr := 'CREATE TABLE temptable (id INT NOT NULL PRIMARY KEY,tmpname VARCHAR2(100))';
	EXECUTE IMMEDIATE v_sqlstr;
	--向新创建的临时表中插入数据
	v_sqlstr := 'INSERT INTO temptable VALUES(10,''临时名称1'')';
	EXECUTE IMMEDIATE v_sqlstr;
	--检索临时表数据，
	v_sqlstr := 'SELECT * FROM temptalbe WHERE id=:tempId';
	EXECUTE IMMEDIATE v_sqlstr INTO v_id,v_name USING &1;
	--输出表中的信息
	DBMS_OUTPUT.put_line(v_id||' '||v_name);
END;
/
