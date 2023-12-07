#定点数

#DECIMAL(M,D),DEC,NUMERIC，M+2字节，有效范围由M和D决定
#使用 DECIMAL(M,D) 的方式表示高精度小数。其中，M被称为精度，D被称为标度。0<=M<=65，
#0<=D<=30，D<M。例如，定义DECIMAL（5,2）的类型，表示该列取值范围是-999.99~999.99。

#见课件

#举例：

CREATE TABLE test_decimal1(
f1 DECIMAL,
f2 DECIMAL(5,2)
);

SELECT * FROM test_decimal1;

INSERT INTO test_decimal1(f1)
VALUES(123),(123.54);#对于123.54，默认的DECIMAL(10,0)，没有小数，就进行舍入

INSERT INTO test_decimal1(f2)
VALUES(123),(123.546);#123.00,123.55有舍入




