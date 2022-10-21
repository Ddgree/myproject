
create table myboard(
		no number primary key,
		writer varchar2(20),
		passwd varchar2(20),
		subject varchar2(50),
		content varchar2(100),
		readcount number,
		register date );
	  
create sequence myboard_seq;

select*from myboard;

insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);
insert into myboard values(myboard_seq.nextval, '동구리', 1234, '게시글증식', '우로라라라ㅏ아ㅏㅇ라ㅏ아아랑라라라라랄앙', 0, sysdate);

select count(*) from myboard;