drop table member_detail;

drop table member;

create table member
(
	id varchar2(16),
	name varchar2(20) not null,
	pass varchar2(16) not null,
	emailid varchar2(20),
	emaildomain varchar2(30),
	joindate date default sysdate,
	constraint member_id_pk primary key(id) 
);

create table member_detail
(
	id varchar2(16),
	tel1 varchar2(3),
	tel2 varchar2(4),
	tel3 varchar2(4),
	zipcode varchar2(5),
	address varchar2(100),
	address_detail varchar2(100),
	constraint member_detail_id_fk foreign key(id) references member(id)
);