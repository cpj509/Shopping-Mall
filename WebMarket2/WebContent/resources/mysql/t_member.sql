--DB 검색
show databases;

--t_member 테이블 생성
create table t_member(
	id int not null auto_increment,
	name varchar(20) not null,
	passwd varchar(20) not null,
	primary key(id)
)default charset=utf8;

select * from t_member;

--회원 추가
insert into t_member values(1, 'Bill', 'b1234');
insert into t_member values(2, '이강', 'c1234');