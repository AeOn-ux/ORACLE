select * from board;

select * from employees;

-- 날짜 함수는 +,-,<,>가 가능하다.
select sysdate from dual;
select sysdate-1,sysdate,sysdate+1 from dual; //어제오늘내일
select sysdate, sysdate+100 from dual; //100일뒤날짜
-- 비교 가능
select bdate from board where bdate>'2025/11/01';


-- 컬럼 합치기 - concat,||
select concat(btitle,bcontent) from board;
select btitle||bcontent from board;

select * from member;
select id||','||pw||','||name from member;
select id||','||pw||','||name as tel from member;

-- 현재일~입사일 가장 오래 근무한 사원 순으로 출력하시오.
select * from employees;
select emp_name,sysdate-hire_date from employees;
select emp_name,sysdate-hire_date from employees
order by sysdate-hire_date desc;

-- board 현재 게시글 날짜가 얼마나 지났는지 출력하시오.
select * from board;
select bno,bdate,round(sysdate-bdate)from board;
select trunc(sysdate-bdate,4) from board;

select * from stuscore;

-- 날짜함수 시간,오전오후,24시 출력
select to_char(sdate,'yyyy-mm-dd am hh24:mi:ss') from stuscore
order by sdate desc;

insert into stuscore values(
stuscore_seq.nextval,'이재명',80,81,88,80+81+88,(80+81+88)/3,sysdate
);

commit;

select hire_date from employees;

-- round:반올림 / month - 15일 이전 1, 15일 이후는 1개월 추가
select hire_date,round(hire_date,'month') from employees;
-- trunc:버림 / month 기준 : 해당 달 1일로 변경
select hire_date,trunc(hire_date,'month') from employees order by hire_date;

-- 요일기준 반올림 // 수요일 기준 이전이면 이전 일요일, 수요일 기준 이후면 이후 일요일.
select hire_date,round(hire_date,'month') from employees;
select bdate,round(bdate,'day') from board; --일주일을 기준


-- board 테이블에서 입력한 게시글 기준 해당 달 1일을 출력하시오.
select bdate,trunc(bdate,'month') from board;

-- 가입한 회원 9월달 생일자를 검색해서 생일쿠폰을 제공하시오.
select bno,bdate from board where bdate in(2024/09/,2025/09/nn);
-- 2024-12-01 ~ 2025-05-31 게시글을 찾으시오
select bno, bdate from board where bdate 
between '2024/12/01' and '2025/05/31'
order by bdate;
select bno,bdate, trunc(bdate,'month') from board where bdate
between '2024/12/01' and '2025/05/31' order by bdate;


select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board;
select bdate, trunc(bdate,'month') from board;
select bdate, trunc(bdate,'yyyy') from board;
select bdate, trunc(bdate,'mm') from board;
select bdate, to_char(trunc(bdate,'dd'),'yyyy-mm-dd hh:mi:ss') from board;

-- hh -> 분이 30분 이상이면 시간+1, 30분 미만이면 시간 삭제
select sdate from stuscore;

select name,to_char(sdate,'hh'), 
to_char(trunc(sdate,'hh'),'yyyy-mm-dd hh:mi:ss') from stuscore;


select sdate from stuscore;

select sysdate,sdate,
trunc(months_between(sysdate,sdate))||'개월' from stuscore
where months_between(sysdate,sdate) <= 1;

-- months_between 두 컬럼의 개월수를 확인
select sysdate,sdate,
trunc(months_between(sysdate,sdate))||'개월' from stuscore
where months_between(sysdate-1,sdate) =9;

-- add_moths:특정 개월수를 더한 날짜 확인
select name,sdate,add_months(sdate,6) from stuscore;

--------------------------------------------------
-- 문자열 함수 length:문자열 길이
select name,length(name) from stuscore;
select name,length(name),lengthhb(name) from stuscore;

-- substr:문자자르기(컬럼명, 시작위치, 개수)
select name,substr(name, 0, 2) from stuscore;

-- s1423,s2798 -> 숫자의 합을 구하시오.
select substr('s1423',2,4),substr('s2798',2,4) from dual;
select to_number(substr('s1423',2,4)),to_number(substr('s2798',2,4)) from dual;
select to_number(substr('s1423',2,4))+to_number(substr('s2798',2,4)) from dual;

select kor+eng from stuscore;


--instr함수
select name from member;
-- ni 포함되어 있는 이름을 출력하시오.
select name from member where name like '%ni%';
-- 위치점을 알려달라
select name, instr(name,'n') from member;

-- not은 !=, <>, ^=
select name, instr(name,'n') from member
where instr(name,'n') != 0;

-- trim함수 : 공백제거 ltrim,rtrim
select '                  abc   ' from dual;
select ltrim('                  abc   ') from dual; -- 왼쪽공백제거
select rtrim('                  abc   ') from dual; -- 오른쪽공백제거
select trim('                  abc   ') from dual;


-- 중간 공백 제거
select replace('           a       bc   ',' ','') from dual;
--replace 다른 문자로 대체
select replace('rove,rive,rife','r','l') from dual;
select name from member;
select name,replace(name,'r','l') from member;

select name,replace(name,'r','l')from member where name like '%r%';
select name,replace(name,'r','l')from member;


-----------------------------------------
select id,pw from member;
-- 비번 뒤에 두자리 가리기
select id,rpad(substr(pw,0,2),4,'*')as pw from member;

-- 두자리만 떼와줘
select substr(pw,0,2) from member;

select sysdate-1,sysdate,sysdate+1,sysdate-hire_date from employees;


drop table stu;
--------------------------------------
create table stu(
sno number(4),
name varchar2(100),
sdate date,
sdate2 date
);

insert into stu(sno,name,sdate) select sno,name,sdate from stuscore;

select * from stu;

commit;

-- sdate2 10년 후 날짜를 입력
select sno,name,sdate,add_months(sdate,120) from stu;
select sno,name,sdate,sdate2,add_months(sdate,120) from stu;
select add_months(sdate,120) from stu;

select * from stu;
-- 유관순 sdate2 오늘 날짜를 입력하시오.
update stu set sdate2=sysdate where name='유관순';

-- 데이터값 옮겨넣기
update stu a set sdate2 = (
select add_months(sdate,120) from stu b 
where a.sno = b.sno
);



select hire_date, last_day(hire_date) from employees;
select hire_date, trunc(hire_date,'month'),last_day(hire_date) from employees;

select sysdate,next_day(sysdate,'수요일') from dual;

select * from stuscore;

select sno,name,total,rank() over(order by total desc) from stuscore;

-----------------------------------------------------------
-- 형 변환 함수 to_char(), to_cumber(), to_date()
-- to)char() : 천단위표시
-- '000,000' : 빈공백 0으로 채움, '999,999' : 빈공백 공백으로 채움.
-- , 쉼표 : 천단위 표시, . 소수점자리
select salary, salary*12, salary*12*1473 from employees;

-- 12,000,000: 쉼표는 문자열
select salary, length(salary*12), to_char(salary*12,'$000,999'),
to_char(salary*12*1473,'L999,999,999.00') from employees;

-- to_char() : 문자열 함수 변환
-- to_char(컬럼,'yyyy-mm-dd hh24:mi:ss')
select sdate from stuscore;
select sdate, to_char(sdate,'yyyy-mm-dd hh24:mi:ss day') from stuscore;
select sdate, substr(sdate,4,2) from stuscore;

select * from member;
select phone, substr(phone,0,3), substr(phone,5,3), substr(phone,9,3)from member;

-- to date() 문자열을 날짜로 변경
-- 문자열을 날짜타입으로 변경하는 이유 : 날짜와 날짜 사이의 간격,날짜에 특정 날짜 더하기
select '20251127'+1,to_date('20251027','yyyymmdd') from dual;
select sysdate-to_date('20251027','yyyymmdd') from dual;
select add_months(to_date('20251027','yyyymmdd'),1) from dual;
select months_between(sysdate,to_date('20251027','yyyymmdd')) from dual;


-- to_number() 문자열을 숫자로 변경
select '20,000','30,000' from dual;
select to_number('20,000','99,999'),'30,000' from dual;
select to_number('20,000','99,999'),to_number(replace('30,000',',','')) from dual;
select '30000', to_number('30000') from dual;

select salary,to_char(salary*12,'999,999')
y_salary,to_char(salary*12*1743,'999,999,999') y_ksalary from employees;

----------------------------------------------------------------------------------------


-- 그룹함수, 단일함수와 함께 사용할 수 없음
select max(kor),min(eng),median(math),variance(kor),stddev(kor) from stuscore;
select avg(kor) from stuscore;
select count(kor) from stuscore;

select count(*) from stuscore;
select sum(salary) from employees;
select avg(salary) from employees;
select max(salary) from employees;
select emp_name,min(salary) from employees;
select sum(salary),avg(salary),max(salary),count(salary) 
from employees where department_id=50;

select max(salary) from employees where department_id = 50;

select emp_name from employees where department_id and salary=(
select max(salary) from employees where department_id = 50;
);

select emp_name from employees where department_id = 50 and salary=8200;

select max(salary) from employees;

select emp_name from employees where salary=24000;
select emp_name from employees where salary=(select max(salary) from employees);


-- 평균 월급
select avg(salary) from employees;
-- 평균 월급보다 높은 사원을 출력하시오.
select emp_name,salary 
from employees where salary>=(select avg(salary) from employees);
select count(emp_name)
from employees where salary>=(select avg(salary) from employees);

-- stuscore에서 국어점수가 평균 이상인 사람이 몇명인지 출력하시오.
select * from stuscore;
select avg(kor) from stuscore;
select count(name)
from stuscore where kor>=(select avg(kor) from stuscore);


-- count(*)
select count(*) from employees; --107
select count(emp_name) from employees; --107
select count(manager_id) from employees; --106
-- null값이 있으면 count에 포함 안됨.

-- null값 출력
select manager_id from employees;
select manager_id from employees where manager_id as null;

------------------------------------------------------------------
-- stuscore테이블 total컬럼을 비교해서
-- 입력한 점수보다 합계점수가 높은 학생이 몇명인지 출력하시오.\

select * from stuscore;
select count(total) from stuscore where total>=270;





-- 527-***-1397 처럼 중간을 특정 문자를 출력하시오.
select phone from member;
select phone, substr(phone,0,3), substr(phone,5,3), substr(phone,9,4)from member;

select phone, substr(phone,5,3)||'***'||substr(phone,9,4) from member;
select phone, replace(phone,(substr(phone,5,3)),'***') from member;

--11** rpad()
select * from member;
select pw from member;
select pw,rpad(substr(pw,0,2),4,'*') from member;
select pw,rpad(substr(pw,0,length(pw)-2),length(pw),'*') from member;
select length(name),length(name)-2 from member;

--홍**, luci**, gregoi**
select name from member;
select name,rpad(substr(name,0,length(name)-2),length(name),'*') from member;
select name,rpad(substr(name,0,7-2),7,'*')from member;
select name,substr(name,0,length(name)-2)from member;
------------------------------------------------------------------------------
-- 제약조건:primary key, foreign key, not null, unique,check
-- primary key : null불가, 중복불가
-- foreign key : 다른 테이블에 primary key 등록이 되어야 FK로 등록 가능
-- not null : null 불가, 중복 가능
-- unique : 중복불가, null가능
-- check : 설정값만 입력가능
create table mem (
id varchar2(100) primary key,
pw varchar2(100) not null,
name varchar2(100) unique,
phone char(13),
gender nvarchar2(2) check(gender in ('남자','여자')),
hobby varchar2(100),
mdate date
);

insert into mem values(
'aaa','1111','홍길동','010-1111-1111','남자','게임',sysdate
);
insert into mem values(
'bbb','1111',null,'010-1111-1111','남자','게임',sysdate
);
insert into mem values(
'ccc','1111',null,'010-1111-1111','여자','게임',sysdate
);
insert into mem values(
'ddd','1111',null,'010-1111-1111','여자','게임',sysdate
);
insert into mem values(
'eee','1111',null,null,'여자',null,null
);
insert into mem (id,pw,gender) values(
'fff','1111','남자');

commit;

create table board2 as select * from board;
select * from board2;

-- foreign key 등록
alter table board2
add constraint fk_mem_board2_id foreign key(id)
references mem(id)
;

-- mem테이블, board2테이블 id컬럼이 연결
-- mem테이블에 없는 id board2에 id로 등록이 불가
-- mem테이블을 board2의 id가 삭제되지 않으면 mem테이블 삭제할 수 없음.
