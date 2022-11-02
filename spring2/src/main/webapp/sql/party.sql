select * from tab;

select * from party;
select count(*) from party;

select * from seq;
select * from USER_CONSTRAINTS where table_name = 'PARTY';

alter table PARTY DISABLE CONSTRAINT SYS_C007053;
alter table PARTY ENABLE CONSTRAINT SYS_C007053;

insert into party values(party_no_seq.nextval, '조기풋살 파티 모집합니다', '대전', '조기풋살 파티 모집합니다', '무관',
'33', sysdate, '20221119', 0, 5, 'test');
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

insert into party values(party_no_seq.nextval,'파티방 연습','지역', '파티방 내용', '성별', '나이', sysdate,
'20221227',9, 9, '홍길동')

select * from member;
select * from admin;

delete from party where party_subject = '작성자test()';
delete from party where party_max_count > 5;
delete from party where party_count > 5;