#位类型
#BIT


CREATE TABLE test_bit1(
f1 BIT,
f2 BIT(5)
);

INSERT INTO test_bit1(f1,f2)
VALUES(1,31);#在添加时可以输入10进制的

SELECT * FROM test_bit1;


SELECT t.`f2`+0 FROM test_bit1 t;#加0，就是10进制的显示


