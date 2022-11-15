delete from member where member_division= ;
delete from board where board_division='일반';
select * from member;
select * from reboard;
select * from seq;
select * from board;
delete from board; where board_division = '후기'; where reboard_bno =145 and reboard_rno=1;
select * from party;
insert into reboard values('테스트',145,reboard_no_seq.nextval,'ㅋㅋㅋㅋ재밌네요',sysdate );
insert into board values(board_no_seq.nextval,'zz','zz',sysdate,0,null,null,board_no_seq.nextval,'1234','일반');

alter table board drop column board_passwd;
delete from party where party_enddate='20221131'
select*from tab;
select * from partymanager;
select * from notice_subject;

insert into admin values('admin','1234');
delete from reboard; where notice_no=6;



/* 회원가입 */
CREATE TABLE member (
	member_id VARCHAR2(20) primary key, /* 아이디 */
	member_passwd VARCHAR2(20), /* 비번 */
	member_name VARCHAR2(20), /* 이름 */
	member_nickname VARCHAR2(20), /* 닉네임 */
	member_gender VARCHAR2(20), /* 성별 */
	member_phone VARCHAR2(20), /* 휴대전화 */
	member_age NUMBER, /* 나이 */
	member_email VARCHAR2(50), /* 이메일 */
	member_address VARCHAR2(20), /* 주소(지역) */
	member_file VARCHAR2(100), /* 프로필사진 */
	member_delok VARCHAR2(20) /* 삭제여부 */
);

/* 후기(게시판) */
CREATE TABLE board (
	board_no NUMBER primary key, /* 게시글 번호 */
	board_subject VARCHAR2(100), /* 제목 */
	board_content VARCHAR2(200), /* 내용 */
	board_date DATE, /* 작성일 */
	board_readcount NUMBER, /* 조회수 */
	board_file VARCHAR2(100), /* 첨부파일 */
	board_ref NUMBER, /* 글그룹번호 */
    board_level NUMBER, /* 글위치번호 */
    board_step NUMBER, /* 글순서 */
    board_id VARCHAR2(20) references member(member_id) on delete cascade /* 아이디 */
);




/* 후기댓글 */
CREATE TABLE reboard (
	reboard_subject VARCHAR2(100), /* 제목 */
	reboard_content VARCHAR2(200), /* 내용 */
	reboard_date DATE, /* 작성일 */
	reboard_id VARCHAR2(20), /* 아이디 */
	reboard_step NUMBER, /* 댓글순서 */
	reboard_no NUMBER references board(board_no) on delete cascade/* 게시글 번호 */
);

/* 파티방 */
CREATE TABLE party (
	party_no NUMBER primary key, /* 파티번호 */
	party_subject VARCHAR2(100), /* 제목 */
	party_address VARCHAR2(20), /* 주소(지역) */
	party_content VARCHAR2(200), /* 내용 */
	party_gender VARCHAR2(20), /* 성별 */
	party_age VARCHAR2(20), /* 나이 */
	party_date DATE, /* 작성일 */
	party_enddate VARCHAR2(30), /* 활동일 */
	party_count NUMBER, /* 참여인원 */
	party_max_count NUMBER, /* 참여총인원 */
	party_id VARCHAR2(20) references member(member_id) on delete cascade /* 아이디 */
);

/* 관리자 */
CREATE TABLE admin (
	admin_id VARCHAR2(20) Primary key, /* 관리자아이디 */
	admin_passwd VARCHAR2(20) /* 비번 */
);

/* 공지(게시판) */
CREATE TABLE notice (
	notice_no NUMBER NOT NULL, /* 게시글 번호 */
	notice_subject VARCHAR2(100), /* 제목 */
	notice_content VARCHAR2(200), /* 내용 */
	notice_date DATE, /* 날짜 */
	notice_readcount NUMBER, /* 조회수 */
	notice_file VARCHAR2(100), /* 첨부파일 */
	notice_admin_id VARCHAR2(20) /* 관리자아이디 */
);

/* 회원탈퇴 */
CREATE TABLE del_member (
	del_member_id VARCHAR2(20) Primary key, /* 아이디 */
	del_member_passwd VARCHAR2(20), /* 비번 */
	del_member_name VARCHAR2(20), /* 이름 */
	del_member_nickname VARCHAR2(20), /* 닉네임 */
	del_member_gender VARCHAR2(20), /* 성별 */
	del_member_phone VARCHAR2(20), /* 휴대전화 */
	del_member_age NUMBER, /* 나이 */
	del_member_email VARCHAR2(20), /* 이메일 */
	del_member_address VARCHAR2(20), /* 주소(지역) */
	del_member_file VARCHAR2(100), /* 프로필사진 */
	del_member_date DATE, /* 탈퇴일자 */
	del_member_delok VARCHAR2(20) /* 삭제여부 */
);

create sequence board_no_seq
                increment by 1 start with 1 nocache;

create sequence party_no_seq
                increment by 1 start with 1 nocache;
                
create sequence notice_no_seq
                increment by 1 start with 1 nocache;
                
select * from party where party_
select * from tab;

select * from party where party_address='서울';
select * from party where party_subject='안녕하세요';
select * from partymanager where member_id = 'test2' and ishost=1;
select * from party where party_no = 1323
select count(*) from party;

select * from seq;
select * from USER_CONSTRAINTS where table_name = 'PARTY';

alter table PARTY DISABLE CONSTRAINT SYS_C007053;
alter table PARTY ENABLE CONSTRAINT SYS_C007053;

insert into party values(800, '조기풋살 파티 모집합니다', '대전', '조기풋살 파티 모집합니다', '무관',
'33', sysdate, '20221119', 0, 5, 'test','n');
insert into party values(party_no_seq.nextval, '농구ㄱ', '부산', '용두산공원 밤농하실분', '남자',
'25', sysdate, '20221123', 0, 4, 'test2');
insert into party values(party_no_seq.nextval, '영화 같이 보실분', '대구', '티켓 한장 남아요 스윗남 대기중', '여자',
'27', sysdate, '20221224', 0, 1, 'sunchip');
insert into party values(party_no_seq.nextval, '롤 랭겜 돌릴분', '서울', '브론즈3 버스좀여... ', '무관',
'21', sysdate, '20221130', 0, 3, 'test1');
insert into party values(party_no_seq.nextval, '캣타워 공구팟', '서울', '해외구매하는데 배송비 아까워요;; 1인당 4개 구매 되니 총대 맵니다', '무관',
'35', sysdate, '20221105', 0, 3, 'denny');
insert into party values(party_no_seq.nextval, '사회인야구팀 만들어보실분', '광주', '성별, 경력, 나이 무관 즐기실 분 모아봐요 장비 있으면  더 환영!! 6명까지 밖에 모집 안돼서 일단 여기 모집 끝나면 글 다시 올릴게요', '무관',
'19', sysdate, '20221231', 0, 5, 'green');
insert into party values(party_no_seq.nextval, '양주서 골프 라운딩 하실 분', '경기', '서울 경기권 거주하시는 분 구해요', '무관',
'40', sysdate, '20221112', 0, 2, 'paul');

delete from party where party_content = '파티방 내용'
select * from PARTY.SYS_C007052

insert into party values(party_no_seq.nextval,'파티방 연습','지역', '파티방 내용', '성별', '나이', sysdate,
'20221227',9, 9, '홍길동')


select * from member;
select * from admin;
UPDATE party SET party_count = 0 WHERE party_count>0;
delete from party where party_subject = '안녕하세요';
delete from party where party_max_count > 5;
delete from party where party_count > 5;

ALTER TABLE party ADD delok VARCHAR(20);
select * from party;
select * from party where ;

delete from party where party_enddate = '12312';

insert into party values(party_no_seq.nextval,'삭제 된 파티방','광주', '파티방 내용', '성별', '20', sysdate,
'20221227',0, 5, 'test','n')
select * from party where party_enddate < TO_CHAR(SYSDATE, 'YYYYMMDD');

update party set delok = 'y' where delok = 'n' and party_enddate < TO_CHAR(SYSDATE, 'YYYYMMDD');

insert into member
     values('admin','1234',null,null,null,null,null,null,null,null,'y')
     
/* 회원탈퇴 */
CREATE TABLE del_member (
	del_member_id VARCHAR2(20) Primary key, /* 아이디 */
	del_member_passwd VARCHAR2(20), /* 비번 */
	del_member_name VARCHAR2(20), /* 이름 */
	del_member_nickname VARCHAR2(20), /* 닉네임 */
	del_member_gender VARCHAR2(20), /* 성별 */
	del_member_phone VARCHAR2(20), /* 휴대전화 */
	del_member_age NUMBER, /* 나이 */
	del_member_email VARCHAR2(20), /* 이메일 */
	del_member_address VARCHAR2(20), /* 주소(지역) */
	del_member_file VARCHAR2(100), /* 프로필사진 */
	del_member_date DATE, /* 탈퇴일자 */
	del_member_delok VARCHAR2(20) /* 삭제여부 */
);

create table partymanager
(
	member_id varchar2(20),
	party_no number ,
	ishost varchar2(20)
)
select * from party
select max(party_no) from party
select * from PARTYMANAGER;
insert into partymanager values('test',0,1)
delete from partymanager where member_id='test'
select party_no from party where party_subject = 'ㅋㅋㅋ'
/* 실행 안함 */
ALTER TABLE partymanager ADD CONSTRAINT member_id_fk
FOREIGN KEY(member_id) REFERENCES member(member_id);

delete from party
delete from PARTYMANAGER
select * from member where member_id = 'admin'

select * from partymanager

ALTER TABLE partymanager ADD CONSTRAINT party_no_fk
FOREIGN KEY(party_no) REFERENCES party(party_no);

ALTER TABLE partymanager DROP PRIMARY KEY DROP INDEX;
ALTER TABLE party DROP PRIMARY KEY;
select party_no from partymanager where member_id = "test"
select  from party where party_no = ()
delete from party where party_count = 5
delete from party where party_count > 5
select party_count from party where party_no = 792
select * from party where party_count < 0
delete from party where party_count < 0
select * from partymanager where member_id='test2'
select * from party order by party_no desc

select * from reboard where reboard_bno = 185 order by reboard_date desc

select * from (select * from member where member_delok='y') where member_id='test4' 