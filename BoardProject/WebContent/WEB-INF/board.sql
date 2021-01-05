create table board(
	bno number primary key,
	bdate date default sysdate,
	bcount number,
	writer varchar2(25 byte),
	content varchar2(500 byte),
	blike number,
	bhate number,
    constraint fk_writer foreign key (writer) references member(id)
)

create table board_comment(
	cno number primary key,
	bno number,
	content varchar2(25 byte),
	cdate date default sysdate,
	writer varchar2(25 byte),
	blike number,
	bhate number,
	constraint fk_bno foreign key(bno) references board(bno),
	constraint fk_writer2 foreign key(writer) references member(id)
)

alter table board_comment modify(blike default 0);
alter table board_comment modify(bhate default 0);
alter table board_comment rename column blike to clike;
alter table board_comment rename column bhate to chate;

alter table board modify(blike default 0);
alter table board modify(bhate default 0);

--시퀀스 생성
create sequence bno_seq start with 1 nomaxvalue;
create sequence cno_seq start with 1 nomaxvalue;

select * from user_sequences;

ALTER TABLE BOARD ADD TITLE VARCHAR2(50 BYTE);
select sysdate from dual;

SELECT BNO_SEQ.NEXTVAL FROM DUAL;
drop sequence bno_seq;
create sequence bno_seq start with 1 nomaxvalue;