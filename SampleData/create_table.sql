create table Dept (
    id tinyint unsigned not null auto_increment,
    pid tinyint unsigned not null default 0 comment '상위부서id',
    dname varchar(31) not null comment '부서명',
    PRIMARY KEY (id)
);

create table Emp (
    id smallint unsigned not null auto_increment,
    ename varchar(31) not null comment '사원명',
    dept tinyint unsigned not null default 0 comment '부서id',
    salary int unsigned not null default 0 comment '급여',
    PRIMARY KEY (id),
    FOREIGN KEY (dept) REFERENCES Dept(id)
);

# 부서에 대한 데이터 입력 : 실무에서 사용하는 예제로 상위부서와 하위부서로 데이터 입력
insert into Dept (pid, dname) values (0, '임원');
insert into Dept (pid, dname) values (1, '총무');
insert into Dept (pid, dname) values (1, '영업');
insert into Dept (pid, dname) values (1, '인사');
insert into Dept (pid, dname) values (2, '총무1팀');
insert into Dept (pid, dname) values (2, '총무2팀');
insert into Dept (pid, dname) values (3, '영업1팀');
insert into Dept (pid, dname) values (3, '영업2팀');
insert into Dept (pid, dname) values (4, '인사1팀');
insert into Dept (pid, dname) values (4, '인사2팀');

select d1.dname as 상위부서, d2.*
from Dept d1 inner join Dept d2 on d1.id = d2.pid;


