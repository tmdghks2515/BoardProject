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

alter table