#二进制类型
#存图片，音频，视频

#1.BINARY和VARBINARY(M)

CREATE TABLE test_binary1(
	f1 BINARY,
	f2 BINARY(3),
	# f3 VARBINARY,#VARBINARY声明时一定指明长度
	f4 VARBINARY(10)
);

INSERT INTO test_binary1(f1,f2)
VALUES('a','a');

INSERT INTO test_binary1(f1,f2)
VALUES('尚','尚');#失败




#2.BLOB类型











