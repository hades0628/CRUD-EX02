create table tbl_board(
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer VARCHAR2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_board add CONSTRAINT pk_board primary key(bno);

create SEQUENCE seq_board;

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval,'테스트 제목','테스트 내용', 'user00');

commit;

select * from tbl_board;

select seq_board.currval from dual;# CRUD-EX02
