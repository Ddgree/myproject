select * from tab;

select * from party;
select count(*) from party;

select * from seq;
select * from USER_CONSTRAINTS where table_name = 'PARTY';

alter table PARTY DISABLE CONSTRAINT SYS_C007053;
alter table PARTY ENABLE CONSTRAINT SYS_C007053;

insert into party values(2, '파티방제목2', '지역2', '파티방 내용', '남자',
'25', sysdate, '20221025', 3, 5, 'admin');
insert into party values(3, '파티방제목3', '지역3', '파티방 내용', '남자',
'25', sysdate, '20221025', 3, 5, 'admin');
insert into party values(4, '파티방제목4', '지역4', '파티방 내용', '남자',
'25', sysdate, '20221025', 3, 5, 'admin');
insert into party values(5, '파티방제목5', '지역5', '파티방 내용', '남자',
'25', sysdate, '20221025', 3, 5, 'admin');
insert into party values(6, '파티방제목6', '지역6', '파티방 내용', '남자',
'25', sysdate, '20221025', 3, 5, 'admin');
insert into party values(7, '파티방제목7', '지역7', '파티방 내용', '남자',
'25', sysdate, '20221025', 3, 5, 'admin');
insert into party values(8, '파티방제목8', '지역8', '파티방 내용', '남자',
'25', sysdate, '20221025', 3, 5, 'admin');

delete from party where party_content = '파티방 내용'

insert into party values(party_no_seq.nextval,'파티방 연습','지역', '파티방 내용', '성별', '나이', sysdate,
'20221227',9, 9, '홍길동')
