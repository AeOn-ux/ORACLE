-- ddl 테이블 생성, 수정, 삭제 할 때 명령어

-- 테이블 생성
create table member(
id varchar2(100) primary key,
pw VARCHAR2(100),
name varchar2(50)
);

-- dml 테이블 안에 데이터 추가, 수정, 삭제, 검색할 때 명령어
-- 테이블의 데이터 추가 - insert
insert into member (id, pw, name) values(
'aaa','1111','홍길동'
);

-- bbb, 2222, 유관순
insert into member (id, pw, name) values(
'bbb','2222','유관순'
);

-- ccc, 3333, 이순신
insert into member (id, pw, name) values(
'ccc','3333','이순신'
);

-- ddd, 4444, 김 구
insert into member (id, pw, name) values(
'ddd','4444','김 구'
);

-- eee, 5555, 강감찬
insert into member (id, pw, name) values(
'eee','5555','강감찬'
);

insert into member(id,pw,name) values(
'fff','6666','김유신'
);

insert into member(id,pw,name) values(
'ggg','7777','홍길자'
);


-- 삭제
delete member where id='aaa';

-- 임시저장만 됨.
-- commit : 저장 완료
commit;

-- 되돌리기. 단, commit 전에만 가능.
rollback;

-- 테이블의 데이터 검색 - select
select id, pw, name from member;

-- 테이블의 데이터 수정 - update
update member set pw = '7777' where id = 'aaa';

select * from member;

-- 테이블의 타입 확인
desc member;

delete member;

-- select 검색, insert 추가, update 수정, delete 삭제
-- commit, rollback을 해야 임시저장에서 실제 저장이 된다.

drop table member;

COMMIT;

-- 테이블 생성 create
create table student (
sno number(4) primary key, -- 중복 불가, null 불가
name VARCHAR2(100), -- 한글 3byte, 영어 2byte
kor number(3), -- 4,1 -> 정수3자리, 소수1자리
eng number(3),
math number(3),
total number(3),
avg number(5,2)
);

desc student;

desc employees;

-- select, insert, update, delete commit, rollback
-- insert into 테이블명(모든 컬럼) values (값)
-- insert input 테이블명 values(모든값);
insert into student (sno,name,kor,eng,math,total,avg)
values(
1,'홍길동',100,100,100,300,100
);

insert into student values(
2,'유관순',90,90,90,270,90
);

insert into student values( -- primary key :중복불가, null 불가
3,'이순신',80,80,80,240,80
);

commit;


-- select 컬럼명 from 테이블명
select sno,name,kor,eng,math,total,avg from student;
select sno,name,total from student;
select * from student;

-- update 테이블명 set 수정할 컬럼 = 값 where 컬러=값
update student set name = '홍길영' where sno=1;
update student set name = '홍길동';

-- delete 테이블명 where 컬러=값
delete student where sno=3;

select * from student;
commit;
rollback;

select employee_id, emp_name from employees;
select * from employees where employee_id>197;


-------------------------------------------------
--delete table명 where col=값
delete student where sno=3;
delete student;

--현재 tab에 존재하는 table 확인
select * from tab;
select * from student;
desc student;

--table 변경(alter)
--col 추가 alter add
alter table student add sdate date;

--col 컬럼 삭제 alter drop
alter table student drop column sdate;

--col 컬럼 수정: alter modify
alter table student modify name varchar2(1000);
alter table student modify name varchar2(90);
alter table student modify name varchar2(5);--입력된 데이터 크기 아래로 변경불가


----------------------------------------------------------
-------------------------------------------------------
-- [ ddl ]
-- 테이블 생성 create
create table student (
sno number(4) primary key, -- 중복불가,null불가
name varchar2(100), -- 한글 3byte
kor number(3),  -- 4,1 -> 정수3자리, 소수1자리
eng number(3),
math number(3),
total number(3),
avg number(5,2)
);
-- 테이블 삭제 drop
drop table member;
-- 테이블 변경 alter
-- 추가 alter add
alter table student add sdate date;
-- 컬럼삭제 - alter drop
alter table student drop column sdate;
-- 컬럼수정 alter modify
alter table student modify name varchar2(1000);
alter table student modify name varchar2(90);
alter table student modify name varchar2(5); -- 입력된 데이터 크기 아래로 변경불가
------------------------------------------------------------
-- [ dml ]
-- select-검색, insert-추가, update-수정, delete-삭제
-- insert into 테이블명 (모든컬럼) values ( 값 )
-- insert into 테이블명 values(모든값);
-- commit, rollback을 해야 임시저장에서 실제저장이 됨.
insert into student (sno,name,kor,eng,math,total,avg)
values (
1,'홍길동',100,100,100,300,100
);
insert into student values(
2,'유관순',90,90,90,270,90,sysdate
);
insert into student values(
3,'이순신',80,80,80,240,80,sysdate
);
-- select 컬럼명 from 테이블명
select sno,name,kor,eng,math,total,avg from student;
select sno,name,total from student;
select * from student;
-- update 테이블명 set 수정할컬럼=값 where 컬럼=값
update student set name = '홍길영' where sno=1;
update student set name='홍길동' where sno=1;
-- delete 테이블명 where 컬럼=값
delete student where sno = 3;
delete student;
-----------------------------------
select employee_id,emp_name from employees;
select * from employees where employee_id>200;
-- 현재 존재하는 테이블 확인
select * from tab;
-- 테이블 안에 항목컬럼 타입
desc student;


---------------------------------
------------------------------------------------------
-- [ ddl ]
-- 테이블 생성 create
create table student (
sno number(4) primary key, -- 중복불가,null불가
name varchar2(100), -- 한글 3byte
kor number(3),  -- 4,1 -> 정수3자리, 소수1자리
eng number(3),
math number(3),
total number(3),
avg number(5,2)
);
-- 테이블 삭제 drop
drop table member;
-- 테이블 변경 alter
-- 추가 alter add
alter table student add sdate date;
-- 컬럼삭제 - alter drop
alter table student drop column sdate;
-- 컬럼수정 alter modify
alter table student modify name varchar2(1000);
alter table student modify name varchar2(90);
alter table student modify name varchar2(5); -- 입력된 데이터 크기 아래로 변경불가
-- [ 테이블을 생성하면서 데이터 가져오기 ]
-- 테이블 복사 ( 데이터까지 복사 )
create table student2 as select * from student;
-- 테이블 복사 ( 테이블구조만 복사 )
create table student3 as select * from student where 1=2;
-- [ 테이블이 있으면서 데이터 가져오기 ]
-- student2,student 컬럼이 동일한 경우 데이터 가져오기
insert into student2 select * from student;
-- student3,student컬럼 개수가 다른 경우
insert into student3(sno,name,kor,eng,math,sdate) select sno,name,kor,eng,math,sdate from student;
------------------------------------------------------------
-- [ dml ]
-- select-검색, insert-추가, update-수정, delete-삭제
-- insert into 테이블명 (모든컬럼) values ( 값 )
-- insert into 테이블명 values(모든값);
-- commit, rollback을 해야 임시저장에서 실제저장이 됨.
insert into student (sno,name,kor,eng,math,total,avg)
values (
1,'홍길동',100,100,100,300,100
);
-- select 컬럼명 from 테이블명
select sno,name,kor,eng,math,total,avg from student;
select sno,name,total from student;
select * from student;
-- update 테이블명 set 수정할컬럼=값 where 컬럼=값
update student set name = '홍길영' where sno=1;
update student set name='홍길동' where sno=1;
-- delete 테이블명 where 컬럼=값
delete student where sno = 3;
delete student;
-----------------------------------
select employee_id,emp_name from employees;
select * from employees where employee_id>200;
-- 현재 존재하는 테이블 확인
select * from tab;
-- 테이블 안에 항목컬럼 타입
desc student;
--------------------------------
select * from student;
-- sysdate : 현재날짜,시간을 입력 / mysql - now()
update student set sdate = '2025-01-01';
update student set sdate = sysdate;
commit;
rollback;
select * from employees;
select manager_id from employees;
select distinct manager_id from employees;
select distinct manager_id from employees order by manager_id;
-- employees테이블 사원번호,사원이름,부서번호 를 출력하시오.
select * from employees;
select employee_id,emp_name,department_id from employees;
--student
select * from student;
-- 홍길동 -> 홍길순
update student set name='홍길순' where sno=1;
-- 날짜를 모두 2025-10-10 변경
update student set sdate='2025-10-10';
-- 3번 학생 삭제
delete student where sno=3;
-- 4,김구,70,70,70,210,70,현재날짜 입력
insert into student values(
4,'김구',70,70,70,210,70,sysdate
);
commit;
-----------------------------------------------
-- 타입 : number타입
-- 연산자 : 산술연산자 +,-,*,/
select sdate,sdate+100 from student;
select * from student;
--1
update student set kor = 90 where sno=1;
--2
update student set total=kor+eng+math,avg=(kor+eng+math)/3 where sno=1;
commit;
rollback;
select * from employees;
-- 월급(달러) * 1474
-- 별칭 기존컬럼명 as 변경컬럼명
select emp_name,salary,     salary*1474 as k_salary,    salary*1474*12 year_k_salary from employees;
delete student2;
commit;
alter table student3 drop column total;
alter table student3 drop column avg;
select * from student2;
select * from student3;


-------------------------------------
select * from student;

-- sysdate:현재날짜, 시간을 입력
update student set sdate = '2025-01-01';
update student set sdate = sysdate;

select * from employees;
select manager_id from employees;
select distinct manager_id from employees;
select distinct manager_id from employees order by maneger_id;


-- employees 테이블 사원번호, 사원이름, 부서번호 를 출력하시오.
* from employees;
select employee_id, emp_name, department_id from employees;

-- student
select * from student;
commit;



-- 홍길동 -> 홍길순
update student set name = '홍길순' where sno=1;

-- 날짜를 모두 2025-10-10 변경
update student set sdate = '2025-10-10';

-- 3번 학생 삭제
delete student where sno = 3;

-- 4,김구,70,70,70,210,70, 현재날짜 입력
insert into student values(
4,'김 구',70,70,70,210,70,sysdate
);
commit;
---------------------------------------------------------------
-- 타입 : number type
-- 연산자 : 산술연산자 +,-,*,/
select sdate, sdate+100 from student;

select * from student;
update student set kor = 90 where sno=1;
update student set total=kor+eng+math, avg=(kor+eng+math)/3 where sno=1;

commit;
rollback;

select * from employees;

-- 월급(달라) * 1474(미국)
select salary from employees;
-- 별칭 기존컬럼명 as 변경컬럼명
select emp_name, salary, salary*1474 as k_salary, salary*1474*12 year_k_salary from employees;

-- [테이블을 생성하는 동시에 데이터 가져오기]
-- 테이블 복사(데이터복사)
create table student2 as
select * from student;

-- 테이블 복사(테이블 구조만 복사)
create table student3 as
select * from student where 1=2;

-- [테이블이 있으면서 데이터 가져오기]
-- student2, student 컬럼이 동일한 경우 데이터 가져오기
insert into student2 select * from student;

-- student3, student 컬럼 개수가 다른 경우
insert into student3(sno,name,kor,eng,math,sdate) select sno, name, kor, eng, math, sdate, from student;

delete student2;
commit;

alter table student3 drop column total;
alter table student3 drop column avg;


select * from student2;
select * from student3;
----------------------------------------
desc student3;
alter table student3 add total number(3);
alter table student3 add avg number(5,2);

insert into student3 values(
1,'이재용',70,70,70,sysdate,210,70);


update student3 set total=kor+eng+math, avg=(kor+eng+math)/3;

select * from student3;

select * from employees;

-- null 값에 +,-,*,/ null값으로 변경됨.
-- null 값을 대체 nvl(컬럼 명,0)
select emp_name, salary, commission_pct,salary+(salary*commission_pct) as real_salary from employees;
select emp_name, salary,nvl(commission_pct,0),salary+(salary*nvl(commission_pct,0)) as real_salary from employees;

select commission_pct from employees;

-- 실제 연봉을 출력하시오.
select (salary+(salary*nvl(commission_pct,0)))*12 from employees;

select * from employees;
-- 부서번호 department_id 출력
select department_id from employees;
select distinct department_id from employees;

-- job_id 직급 중복제거 해서 출력하시오.
select distinct job_id from employees;

select * from jobs;

-------------------------------------------------
-- mem 테이블 - 날짜 포함, varchar2, number, data
create table zmember (
 id varchar2(100),
 pw varchar2(100),
 name varchar2(100),
 email varchar2(50),
 email_check number(1),
 zonecode number(5),
 address varchar2(100),
 phone char(13),
 phone_check number(1),
 tel char(13),
 birth date,
 birth_check number(1),
 business number(1)
);
select * from zmember;

alter table zmember modify zonecode char(5);

desc zmember;

insert into zmember values(
'aaa','1111','홍길동','aaa@naver.com',1,'00000','서울 강남구','010-1111-1111',
0,'02-1111-1111','2000-01-01',1,0
);
select * from zmember;
commit;



----------------------------------------------------------
-- seoul_stu
-- 학생 정보 테이블 작성하시오. 고등학생

create table seoul_stu(
stuno char(5), --s0001 학생고유번호
name varchar2(100), --이름
birth date,
phone char(13),
address varchar2(50),
enroll_date date,
write_date date
);

select * from high_sm;

insert into seoul_stu values(
'smnct','이민형','1999-08-02','010-1999-0802','서울',sysdate,sysdate
);

drop table seoul_stu;



update high_stu set class_no=127 where stuno='smnct';

----------------------------------------------------------------------------
create table uni_stu(
stuno char(5),
name varchar2(100),
major_code varchar2(100),
major_name varchar2(100),
major_date date,
college varchar2(100)
);

insert into uni_stu values(
's0001','홍길동','com','컴퓨터공학과','2000/01/01','공과대학'
);
insert into uni_stu values(
's0002','유관순','com','컴퓨터공학과','2000/01/01','공과대학'
);
insert into uni_stu values(
's0003','이순신','com','컴퓨터공학과','2000/01/01','공과대학'
);
insert into uni_stu values(
's0004','강감찬','com','컴퓨터공학과','2000/01/01','공과대학'
);
insert into uni_stu values(
's0005','김구','com','컴퓨터공학과','2000/01/01','공과대학'
);
insert into uni_stu values(
's0006','김유신','math','수학과','2000/01/01','인문대학'
);
select * from uni_stu;

create table major_collect(
major_code varchar2(100), --primary key: 중복불가,null불가
major_name varchar2(100),
major_date date,
college varchar2(100)
);
insert into major_collect values(
'math','수학과','2000/01/01','인문대학'
);
insert into major_collect values(
'com','컴퓨터공학과','2000/01/01','공과대학'
);

select * from major_collect;
select * from uni_stu;

select stuno, name, uni_stu.major_code, major_name, major_date, college
from uni_stu, major_collect
where uni_stu.major_code = major_collect.major_code;


alter table uni_stu drop column major_name;
alter table uni_stu drop column major_date;
alter table uni_stu drop column college;

--------------------------------------
--------------------------------------
create table seoul_grade(
stuno char(5),
grade1 number(1), --학년
grade1_no number(2), --학반
class1_no number(3) --반번호
);
insert into seoul_grade values(
's0001',1,1,1
);
insert into seoul_grade values(
's0001',2,2,2
);
insert into seoul_grade values(
's0001',3,3,3
);

create table seoul_stu(
stuno char(5), --s0001 학생고유번호
name varchar2(100), --이름
birth date,
phone char(13),
address varchar2(50),
enroll_date date,
write_date date
);


insert into seoul_stu values(
's0001','이민형','1999-08-02','010-1999-0802','서울',sysdate,sysdate
);

select * from seoul_grade;
select * from seoul_stu;
commit;

select seoul_stu.stuno,name,birth,phone,address,enroll_date,write_date,
grade1, grade1_no, class1_no
from seoul_stu, seoul_grade
where seoul_stu.stuno = seoul_grade.stuno;

---------------------------------------------------

-- where절 : 조건절 =, !=, <>(다르다) , >=, <=, >, <, and, or
-- where 컬럼 연산자 비교값
select * from employees where department_id = 30 or department_id = 50;
select * from employees where department_id in(30,50);
select * from employees where department_id = 30 and manager_id = 100;
select * from employees where department_id <> 30;

-- 월급이 5000$ 이상인 사원을 출력하시오.
select * from employees where salary>=5000;
select * from employees where salary in(5000,6000,7000);
select * from employees where salary not in (5000,6000,7000);

select emp_name,salary, salary*12 from emoloyees
where salary*12 >= 200000;
desc employees;
select employee_id,emp_name,salary from employees where salary<=4000;

--------------------- 입사일
select hire_date from employees;
select hire_date from employees where hire_date+100 >= '2025/01/01';

select hire_date, hire_date+100 from employees;

select email, hire_date from employees where hire_date >= '2007-06-01';

select salary from employees where salary>=7000 and salary<=7500;

-- 등가비교 between a and b
select salary from employees where salary between 7000 and 7500;

-- not between a and b
select salary from employees where salary < 7000 or salary > 7500;
select salary from employees where salary not between 7000 and 7500;


select hire_date from employees;
desc employees;
select employee_id, emp_name, department_id, hire_date 
from employees where hire_date between '2005/01/01' and '2007/12/31';
select employee_id, emp_name, department_id, hire_date 
from employees where hire_date>='2005/01/01' and hire_date<= '2007/12/31';



----------------------------------
-- 상품관리 테이블을 작성해보세요
create table product(
pr_id number(10),
pr_name varchar2(100),
category varchar2(100),
price number(8,2),
red_date date
);

select * from product;

insert into product values(
'11111','sofa','living','500000','2025-12-31'
);
insert into product values(
'11112','tv','living','880000','2025-12-31'
);
insert into product values(
'11113','bed','living','900000','2025-12-31'
);
insert into product values(
'11114','table','living','50000','2025-12-31'
);
insert into product values(
'11115','chair','living','250000','2025-12-31'
);
insert into product values(
'11116','fish','food','80000','2025-11-28'
);
insert into product values(
'11117','cake','food','45000','2025-11-28'
);
insert into product values(
'11118','beef','food','100000','2025-11-28'
);
insert into product values(
'11119','pasta','food','21000','2025-11-28'
);
insert into product values(
'11120','potato','food','8000','2025-11-28'
);