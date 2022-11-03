select * from reboard;

select*from notice;
select * from notice_file;
select * from notice_subject;

insert into admin values('admin','1234');
delete from notice where notice_no=6;



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

<<<<<<< HEAD
=======
select * from member;
select * from admin;
>>>>>>> origin/kyungmin1025
