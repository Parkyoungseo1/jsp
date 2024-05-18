show tables;

create table board(
	idx int not null auto_increment,		/* 게시글의 고유번호*/
	mid varchar(20) not null,						/* 게시글 올린이 아이디 */
	nickName varchar(20) not null, 			/* 게시글 올린이 닉네임 */
	title varchar(100) not null,  			/* 게시글 제목 */
	content text not null, 							/* 글 내용 */
	readNum int default 0, 							/* 글 조회수 */
	hostIp varchar(40) not null, 				/* 글 올린이 IP */
	openSw char(2) default 'OK',        /* 게시글 공개여부(OK:공개, NO:비공개) */
	wDate datetime default now(),				/* 글쓴 날짜 */
	good int default 0,									/* '좋아요' 클릭 횟수 누적 */
	complaint char(2) default 'NO',			/* 신고글 유무(신고당한글 :OK, 정상글: NO) */
	primary key(idx),										/* 기본키 : 고유번호 */
	foreign key(mid) references member(mid)
);
drop table board;
desc board;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','즐거운 게시판생활이 되세요.',default,'192.168.50.68',default,default,default);

/* 댓글 연습하기 */
create table boardReply(
	idx int not null auto_increment, /* 댓글 고유번호*/
	boardIdx int not null,  /* 원본글(부모글)의 고유번호-외래키로 지정*/
	mid varchar(20) not null, /* 댓글 올린이의 아이디*/
	nickName varchar(20) not null, /* 댓글 올린이의 닉네임*/
	wDate datetime default now(), /* 댓글 올린 날짜/시간*/
	hostIp varchar(50) not null, /* 댓글 올린 PC의 고유 IP */
	content text not null, /* 댓글 내용 */
	primary key(idx),
	foreign key(boardIdx) references board(idx)
	on update cascade
	on delete restrict
);
desc boardReply;

insert into boardReply values (default, 5, 'hkd1234', '홍장군', default, '192.168.50.12', '글을 참조하겠습니다.');
insert into boardReply values (default, 9, 'hkd1234', '홍장군', default, '192.168.50.12', '다녀갑니다.');
insert into boardReply values (default, 10, 'hkd1234', '홍장군', default, '192.168.50.12', '멋진글이군요.');

select * from boardReply;

select * from board;
select * from board where idx =9;  /*현재글*/
select idx,title from board where idx >9 order by idx limit 1;  /*다음글*/
select idx,title from board where idx <9 order by idx desc limit 1;  /*이전글*/

-- 시간으로 비교해서 필드에 값 저장하기
select *, timestampdiff(hour, wDate, now()) as hour_diff from board;

-- 날짜 비교해서 필드에 값 저장하기
select *, datediff(wDate, now()) as date_diff from board;

