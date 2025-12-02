create table mem2 as select * from member;

select * from mem2;

-- primary key 등록
-- constraint : 별칭
alter table mem2 add constraint pk_mem2_id primary key(id);
-- 데이터 : 자료집합, 정보 : 우용한 자료
-- 무결성 제약조건 : 데이터 입력 시 잘못된 데이터의 입력을 제약
-- primary key, foreign key, not null, unique, check

-- 테이블 생성시 primary key 등록 방법
create table mem3(
id varchar2(100) primary key,
pw varchar2(100)
);

-- 테이블 생성 foreign key 등록
-- 다른 테이블의 primary key로 등록이 되어야 foreign key로 등록 가능
create table board4(
bno number (4) primary key,
btitle varchar2(1000) not null,
bcontent clob,
id varchar2(100),
constraint fk_board4_mem2_id foreign key(id) references mem2(id)
);

select * from board;
-- foreign key 수정
create table board3 as select * from board;
alter table board3 add constraint fk_board3_mem2_id foreign key(id) references mem2(id);

-- foriegn key삭제
alter table board3 drop constraint fk_board3_mem2_id;

select * from board3;

insert into board3 values(
board_seq.nextval,'제목입니다','내용입니다','aaa',board_seq.currval,0,0,0,'1.jpg',sysdate
);

select board_seq.nextval from dual;

select * from board3;
select * from mem2 where id='aaa';

delete mem2 where id='aaa';

select * from board3 where id='aaa';

delete board3 where id='aaa';

-------------------------
-- 부모키 삭제시 foreign key키 등록된 데이터 모두 삭제
alter table board3 
add constraint fk_board3_mem2_id foreign key(id) references mem3(id)
on delete cascade;

-- 부모키 삭제시 foreign key키 등록된 id null 처리
alter table board3 
add constraint fk_board3_mem2_id foreign key(id) references mem3(id)
on delete set null;

--------------------------------------------------------------------------
create table stuscore2 as select * from stuscore;

select * from stuscore2;



alter table stuscore2 add event date;
alter table stuscore2 add rank nvarchar2(1);
alter table stuscore2 add leader nvarchar2(2);
alter table stuscore2 modify sdate invisible;
alter table stuscore2 modify leader invisible;
alter table stuscore2 modify event invisible;
alter table stuscore2 modify sdate visible;
alter table stuscore2 modify leader visible;
alter table stuscore2 modify event visible;

-- case when : 조건이 같은 경우에 실행(비교연산자 활용 가능)


order by sno;
select * from stuscore2;
alter table stuscore2 add event sdate;
alter table stuscore2 add rank nvarchar2(1);
alter table stuscore2 add leader nvarchar2(2);


-- 'class'칼럼을 1개 추가
alter table stuscore2 add class varchar2(100);
-- 1~10까지 1번,번,3번......10반, 기타 컬럼에 추가하시오.
select sno,
case when sno between 1 and 10 then '1반'
when sno between 11 and 20 then '2반'
when sno between 21 and 30 then '3반'
when sno between 31 and 40 then '4반'
when sno between 41 and 50 then '5반'
when sno between 51 and 60 then '6반'
when sno between 61 and 70 then '7반'
when sno between 71 and 80 then '8반'
when sno between 81 and 90 then '9반'
when sno between 91 and 100 then '10반'
else '기타'
end as class
from stuscore2;

update stuscore2 set class = (
case when sno between 1 and 10 then '1반'
when sno between 11 and 20 then '2반'
when sno between 21 and 30 then '3반'
when sno between 31 and 40 then '4반'
when sno between 41 and 50 then '5반'
when sno between 51 and 60 then '6반'
when sno between 61 and 70 then '7반'
when sno between 71 and 80 then '8반'
when sno between 81 and 90 then '9반'
when sno between 91 and 100 then '10반'
else '기타'
end );

select sno,name,total from stuscore2;
select * from stuscore2;

select rank() over(order by total desc)from stuscore2;


-----------------------------------------------------------------

-- 그룹함수 max,min,avg,sum,count....
-- to_char(), to_number(),to_date()

select to_char(sum(kor),'9,999'),round(avg(kor),2),max(kor),min(kor),count(kor) from stuscore2;
select avg(kor) from stuscore2;
select max(kor) from stuscore2;
select min(kor) from stuscore2;
select count(kor) from stuscore2;

-- select name,max(kor) from stuscore2; -- 단일과 그룹컬럼은 같이 사용 불가
-- group by 단일컬럼이 올 수 있음
-- max(kor) 이름을 기준으로 최대 국어점수를 출력하시오.
select * from stuscore2;

-- 전체 평균, 
select avg(avg) from stuscore2;
-- 단일 컬럼과 그룹 컬럼은 함께 사용 불가.
select class avg(avg) from stuscore2;
-- 반별 평균
select class,avg(avg) from stuscore2
group by class;

-- 반별 평균 52.333333보다 낮은 반을 출력하시오.
-- 그룹 컬럼의 조건절은 where에서 사용할 수 없음.
-- 그룹 컬럼의 조건절은 having에 입력해야 함
select class,avg(avg) from stuscore2
group by class
having avg(avg)<=52.33;


-- department_id employee테이블
select salary, department_id from employees
order by department_id;

select department_id, sum(salary) from employees
group by department_id;

select avg(salary) from employees;

select department_id, sum(salary), avg(salary) from employees
group by department_id 
having avg(salary)>=6461
order by department_id;
-- 이중쿼리
select department_id, sum(salary), avg(salary) from employees
group by department_id 
having avg(salary)>=(select avg(salary) from employees)
order by department_id;

select sysdate,add_months(sysdate,6) from dual;
select hire_date,hire_date+100,add_months(hire_date,6) from employees;

---------------------------------

select distinct department_id from employees;

select count(*) from employees;



-- 조인:2개 테이블 사용
select count(*) from member,board; --10000
select count(*) from member; --100
select count(*) from board; --100

select * from employees,departments;
select department_id from employees;
select * from departments;
select department_id,department_name from departments;

select department_id from employees;

select emp_name,employees.department_id,department_name from employees,departments
where employees.department_id = departments.department_id;

select * from departments;
select emp_name,employees.department_id,department_name,parent_id from employees,departments
where employees.department_id = departments.department_id;

--cross join 100*100 = 10000
select * from employees,departments;

-- equi join : 동일한 컬럼이 존재할때
select * from employees,departments
where employees.department_id = departments.department_id;

-- 작성자 board :id
select id,bno,btitle from board;
-- member : id, 이름, 전화번호
select * from member;
-- join을 했을 경우, 공통 컬럼 외 다른 컬럼의 내용을 바꾸면 변경된 내용을 가지고 옴.
select member.id,name,phone,bno,btitle from member, board
where member.id = board.id;

update mem set name='길동스' where id='aaa';

select * from mem;
drop table mem;

create table mem as select * from member;
select * from mem;

delete mem where id not in('aaa','bbb','ccc','ddd','eee','fff','ggg','hhh','iii','jjj','kkk','lll','mmm');
alter table mem add nickname varchar2(100);

select pw,rpad(substr(pw,0,2),4,'*') from mem;
select name,substr(name,0,2)||'즈' from mem;
select name,concat(substr(name,0,2),'즈') from mem;

update mem set nickname=(
concat(substr(name,0,2),'즈')
);

select * from mem;
-- 순서
alter table mem modify phone invisible;
alter table mem modify email invisible;
alter table mem modify gender invisible;
alter table mem modify hobby invisible;
alter table mem modify phone visible;
alter table mem modify email visible;
alter table mem modify gender visible;
alter table mem modify hobby visible;
------------------------------------------------------
alter table board modify nicname visible;
alter table board drop column nicname;
select * from board;

select bno,btitle,bcontent,id,nicname from board;
alter table board add nicname varchar2(100);

select bno,btitle,bcontent, mem.id,nickname from board,mem
where mem.id = board.id;




-- 사원테이블 employees - emp_name,department_id,salary
-- ,부서테이블 departments - department_id,department_name
-- 사원 이름, 부서 번호, 부서 이름, 월급

select emp_name,salary, departments.department_id, department_name
from employees, departments where departments.department_id = employees.department_id;

-- 테이블 별칭 가능
select emp_name,salary, b.department_id, department_name
from employees a, departments b
where b.department_id = a.department_id;

select a.id,nickname,bno,btitle from mem a, board b
where a.id = b.id and a.id='aaa';

-- non equi join : 같은 컬럼이 없고 두 테이블을 조인하는 방법
select * from scoregrade;


create table scoregrade(
grade char(1),
lowgrade number(3),
highgrade number(3)
);

insert into scoregrade values('A',90,100);
insert into scoregrade values('B',80,89);
insert into scoregrade values('C',70,79);
insert into scoregrade values('D',60,69);
insert into scoregrade values('F',0,59);
commit;

-- scoregrade,stuscore 2개 테이블을 조인해서 grade 등급을 입력
-- 같은 컬럼이 존재하지 않음
select grade,lowgrade,highgrade from scoregrade;
select sno,name,kor,eng,math,total,avg,sdate from stuscore;
-- stuscore avg 컬럼을 scoregrade lowgrade,highgrade 범위를 조회해서 grade 추가
select name, avg,grade from stuscore a, scoregrade b
where avg between lowgrade and highgrade;

-- 월급을 가지고 직급을 추가하려고 합니다
-- salgrade : grade,lowgrade,highgrade
-- salgrade 20000-50000 대표,13000부사장,10000부장,8000과장,6000대리, 그 외 사원
-- '대표','부사장','부장','과장','대리','사원'
select emp_name,salary from employees order by salary desc;
create table salgrade(
grade varchar2(50),
lowgrade number(5),
highgrade number(5)
);
insert into salgrade values('대표',20000,50000);
insert into salgrade values('부사장',13000,19999);
insert into salgrade values('부장',10000,12999);
insert into salgrade values('과장',8000,9999);
insert into salgrade values('대리',6000,7999);
insert into salgrade values('사원',0,5999);

select * from salgrade;
select * from salgrade;
select emp_name,salary from employees order by salary desc;

select emp_name, salary, b.grade from employees a, salgrade b
where salary between lowgrade and highgrade order by salary desc;

-- case whem
select emp_name,salary,
case when salary between 20000 and 50000 then '대표'
when salary between 13000 and 19999 then '부사장'
when salary between 10000 and 12999 then '부장'
when salary between 8000 and 9999 then '과장'
when salary between 6000 and 7999 then '대리'
else '사원'
end as grade
from employees;

select * from mem;
select * from stuscore2;
alter table stuscore2 drop column rank;
alter table stuscore2 drop column leader;

--stuscore2 테이블 scoregrade테이블 조인해서 grade 학점을 출력하시오.
select * from stuscore2;
select * from scoregrade;

select a.*,grade from stuscore2 a, scoregrade;

select name,avg,grade from stuscore2,scoregrade
where avg between lowgrade and highgrade;
-- grade 컬럼을 추가해서 조인해서 나온 결과를 입력하시오.
alter table stuscore2 add grade varchar2(1);

update stuscore2 set grade=(
select grade from stuscore2.scoregrade
where avg between lowgrade and highgrade);


---------------------------------------------------------
-------------([순번 출력하는 방법])----------------------------------------------
select * from member;
select rownum,a.* from member a;
select rownum,a.* from employees a;
select * from board
order by bno;
create table board2 as select * from board;
select * from board2
where bno between 21 and 30
order by bno
;
--[rownum]
select rownum,a.* from board2 a
where rownum between 1 and 20
order by bno
;
select * from
(
select rownum rnum,a.* from
(select * from board2 order by bno asc) a
)
where rnum between 11 and 20
;
select rownum rnum,a.* from
(select * from board2 order by bno asc) a
;-- bno로 정렬된
select * from board2 order by bno asc
;--board2를 bno순으로 정렬
delete board2 where bno=4;
delete board2 where bno=7;
delete board2 where bno=11;
delete board2 where bno=12;
delete board2 where bno=15;
delete board2 where bno=22;
delete board2 where bno=25;
delete board2 where bno=40;
--row_number()
select *
from(
select row_number()over(order by bno asc) rnum,a.*
from board2 a
);

select row_number()over(order by bno asc) rnum,a.*
from board2 a
;--row_number()로 정렬된 table
select * from board2;
-----------------------------------------------------------

create table board2 as select * from board;

select rownum,a.* from board2 a
where rownum between 1 and 20
order by bno;

select rownum rnum,a.* from board2 a
order by bno asc;

-- select rownum rnum,a.* from(테이블명)

select rownum rnum,a.* from 
(select * from board2 order by bno asc) a
where rownum between 11 and 20;

-- rownum 함수
select * from
(select rownum rnum,a.* from 
(select * from board2 order by bno asc) a)
where rownum between 11 and 20;


--이중쿼리
select * from
(
select rownum rnum,a.* from 
(select * from board2 order by bno asc) a
)
where rownum between 11 and 20;

-- row_number()
select * from
(select row_number() over(order by bno asc) rnum,a.* from board2 a)
where rnum between 11 and 20;

select rownum,a. * from stuscore a;
select rownum, a. * from member a;

select row_number() over(order by id) rnum,a.* from member a;
