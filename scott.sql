--RDBMS
--기본 단위: 테이블

--EMP(사원 정보 테이블)
--empno(사번), ename(사원명), job(직책), mgr(직속상관사번), hiredate(입사일), sal(급여), comm(추가수당), deptno(부서번호)
-- NUMBER(4, 0): 4자리 자릿수 ,소숫점 자리수
-- VARCHAR2(10): 문자열(10 Byte) VAR:가변
--				 영어 10문자, 한글 2byte, utf-8 byte 할당
-- DATE		   : 날짜

-- DEPT(부서테이블)
-- deptno(부서번호), dname(부서명), loc(부서위치)

-- SALGRADE(급여 테이블)
-- grade(급여등급), losal(최저급여), hisal(최대급여)

-- 개발자: CR(read)UD
-- SQL(structured query language: 구조 질의 언어): RDBMS 데이터를 다루는 언어


--1. 조회(SELECT)- Read
-- 사원정보조회(전체조회)
-- *(모든 열)
SELECT * FROM EMP e; 
-- 특정 열 조회
SELECT e.Empno, e.ename, e.job FROM emp e;

-- 사원번호, 부서번호만 조회
SELECT e.empno, e.deptno FROM emp e;

-- 중복 데이터는 제외하고 조회
SELECT DISTINCT deptno FROM emp;

SELECT DISTINCT job, deptno FROM emp;

-- 별칭
SELECT e.ENAME, sal, sal*12+comm annsal, comm
FROM EMP e 

SELECT e.ENAME, sal, sal*12+comm AS annsal, comm
FROM EMP e 

SELECT e.ENAME, sal, sal*12+comm "연 봉", comm 수당
FROM EMP e 

-- emp 테이블 모든 열을 급여기준 오름차순 조회
SELECT
	*
FROM
	emp e
ORDER BY
	e.SAL ASC;

SELECT
	*
FROM
	emp e
ORDER BY
	e.SAL DESC;

-- 사번, 이름, 직무만 급여기준으로 내림차순 조회
SELECT
	e.empno,
	e.ename,
	e.job,
FROM
	emp e
ORDER BY
	e.sal DESC;

-- 부서번호의 오름차순, 급여의 내림차순
SELECT
	*
FROM
	EMP e
ORDER BY
	e.deptno ASC,
	e.sal DESC; 


SELECT
	e.empno AS employee_no,
	e.ename AS employee_name,
	e.mgr AS manager,
	e.sal AS salary,
	e.COMM AS eommission,
	e.deptno AS departmentnumber
FROM
	emp e; 

SELECT
	*
FROM
	emp e
ORDER BY
	e.DEPTNO DESC ,
	e.ENAME ASC;

-- where: 조회 조건 부여
-- 부서번호가 30번인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 30;
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7782;

SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 30 and e.JOB= 'SALESMAN' ;
--문자: ''
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO  = 7499 AND e.DEPTNO =30;

SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO  = 7499 or e.DEPTNO =30;

-- 연산자
--1)산술 +  -  *  /
--2)비교 >  <  >= <=
--3)등가비교 =,( !=, <>, ^=)
--4)논리부정 not
--5)	   in
--6)범위 between a and b]
--7)검색 like 연산자와 와일드카드 _, %
--8)is null:
--9)집합 Uniom, minus, 
SELECT *
FROM emp e
WHERE e.sal*12= 36000

--급여가 3000이상인 사원 조회
SELECT *
FROM emp e
WHERE e.sal>= 3000

SELECT *
FROM emp e
WHERE e.ENAME >='f'

SELECT *
FROM emp e
WHERE NOT e.sal = 3000;

SELECT *
FROM emp e
WHERE e.ENAME = 176 ORDER BY ;


SELECT *
FROM emp e
WHERE e.sal*12>= 12000;

SELECT
	*
FROM
	emp e
WHERE
	e.job = 'MANAGER'
	OR e.job = 'SALESMAN'
	OR e.JOB = 'CLERK';

SELECT
	*
FROM
	emp e
WHERE
	e.job in ('MANAGER','SALESMAN','CLERK');

SELECT
	*
FROM
	emp e
WHERE
	e.job NOT in ('MANAGER','SALESMAN','CLERK');

--Like
--_ : 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미
--% : 길이와 상관없이 모든 문자열 데이터를 의미

-- 사원명이 S로 시작하는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ename LIKE 'S%';

select
	*
FROM
	EMP e
WHERE
	e.ename LIKE '_L%';

select
	*
FROM
	EMP e
WHERE
	e.ename LIKE '%AM%';

select
	*
FROM
	EMP e
WHERE
	e.ename NOT LIKE '%AM%';

SELECT *
FROM emp e
WHERE e.COMM IS NULL;

--mgr이 null인 사원 조회(= 직속상관이 없는)조회
SELECT *
FROM emp e
WHERE e.mgr IS NULL;

--직속 상관이 있는 사원 조회
SELECT *
FROM EMP e 
WHERE e.MGR  IS NOT NULL;


--union
SELECT
	*
FROM
	emp e
WHERE
	e.DEPTNO = 10
	OR e.DEPTNO = 20
	
SELECT
	*
FROM
	emp e
WHERE
	e.DEPTNO in(10,20);


SELECT
	e.EMPNO, e.ENAME, e.SAL , e.DEPTNO
FROM
	emp e
WHERE
	e.DEPTNO = 10
UNION
SELECT
	e.EMPNO, e.ENAME , e.SAL
FROM
	emp e
WHERE
	e.DEPTNO = 20

	
--날짜함수
	
SELECT sysdate AS now, sysdate-1 yesterday, sysdate+1 AS tommorow, CURRENT_date AS CURRENT_date, CURRENT_TIMESTAMP AS CURRENT_TIMESTAMP FROM dual;

SELECT sysdate, ADD_MONTHS(sysdate, 3)
FROM duall

SELECT *
FROM EMP e 
FROM dual
WHERE add_months(sysdate, 480)<sysdate;

SELECT
	e.EMPNO,
	e.ENAME1,
	e.HIREDATE ,
	sysdate,
	MONTHS_BETWEEN(e.HIREDATE, sysdate)AS month1,
		MONTHS_BETWEEN(sysdate, e.HIREDATE)AS month2,
			TRUNC(MONTHS_BETWEEN(e.HIREDATE, sysdate))AS month3
FROM
	emp e
	
SELECT  sysdate, NEXT_day(sysdate, '월요일'), last_day(sysdate)
FROM dual;

--자료형을 변환하는 형변환 함수
--TO_char(): 숫자 또는 날짜 데이터를 문자열 데이터로 반환
--To_number():문자열 데이터를 숫자 데이터로 반환
--To_date(): 문자열 데이터를 날짜 데이터로 변환

SELECT e.empno, e.ENAME, e.empno+'500'
FROM emp e
WHERE e.ename= 'smith';


--SELECT e.empno, e.ENAME, e.empno+'abcd'
--FROM emp e
--WHERE e.ename= 'smith';

SELECT
	sysdate,
	TO_char(sysdate, 'MM'),
	TO_char(sysdate, 'MON'),
	TO_char(sysdate, 'MONTH'),
	TO_char(sysdate, 'DD'),
	TO_char(sysdate, 'DY'),
	TO_char(sysdate, 'DAY'),
	TO_char(sysdate, 'HH24:MI:SS'),
	TO_char(sysdate, 'HH12:MI:SS AM'),
	TO_char(sysdate, 'HH:MI:SS PM')
FROM
	dual;


--9: 숫자 한자리를 의미
--9: 숫자 한자리를 의미(빈자리를 0으로 채움)

SELECT e.sal, TO_char(e.sal, '$999,999'), To_char(e.sal, '$000,999,999')
FROM EMP e;

SELECT 1300-'1500', 1300+'1500'
FROM dual;


SELECT '1300'-'1500', '1300'+1500
FROM dual;


SELECT TO_NUMBER('1,300','999,999')+to_number('1,500','999,999')
FROM dual;

--To_Date() : 문자열데이터=>날짜형식으로 변경
SELECT
	To_date('2025-03-20', 'yyyy-MM-DD') AS Date1,
	To_date('2025/03/20', 'yyyy/MM/DD') AS Date2
FROM
	dual;

--NULL
--산술, 비교 수행x
--1)NVL : NUll여부 검사 데이터, 널일때 반환데이터
--2)NVL2: NUll여부 검사 할 데이터, 널아닐떄 반환, 널일때 반환

SELECT
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.COMM,
	e.sal + e.COMM,
	NVL(e.comm,0),
	e.Sal+nvl(e.comm,0)
FROM
	EMP e 

SELECT
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.COMM,
	e.sal + e.COMM,
	NVL2(e.comm,'0','x'),
	nvl2(e.comm,e.sal*12+e.comm, e.sal*12)AS 연봉
FROM
	EMP e 

	
--자바의 if, switch 구문과 유사
--Decode
--decode(검사 대상이 될 데이터, 조건1, 조건1 만족시 결과)
--		(조건1~조건N까지 만족x)

--CASE
--CASE 검사 대상이 될 데이터
--  when 조건1 then 조건1 만족시 결과
--	else 조건1~조건N까지 만족x
--  end
	
--직책이 MANAGER 인 사원은 급여의 10%인상
--직책이 SALESMAN인 사원은 급여으  5%인상
--직책이 ANALYST 인 사원은 동결
--나머지는 3%인상
	
SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB,
	e.sal,
	decode(e.job, 'MANAGER', e.sal*1.1, 'SALESMAN', e.sal*1.05, 'ANALYST', e.SAL, e.Sal*1.03) AS upsal
FROM
	emp e;



SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB,
	e.sal,
	CASE
		e.job
	WHEN 'MANAGER' THEN e.sal * 1.1
		WHEN 'SALESMAN' THEN e.sal * 1.05
		WHEN 'ANALYST' THEN e.SAL
		ELSE e.Sal * 1.03
	END AS upsal
FROM
	emp e;

-- COMM NULL 인 경우 '해당사항 없음'
-- COMM 0 인 경우 '수당 없음'
-- COMM >0 인 경우 '수당: 800'

SELECT
	e.EMPNO ,
	e.ENAME ,
	e.JOB,
	e.sal,
	CASE
		WHEN e.comm IS NULL THEN '해당사항없음'
		WHEN e.COMM = 0 THEN '수당없음'
		WHEN e.COMM>0 THEN '수당:' || e.comm
	END AS comm_text
FROM
	emp e;

--[실습]
--1. empno 7369 -> 73**, ename SMITH ->S****
--empno, 마스킹처리empno, ename, 마스킹처리ename

--Like
--_ : 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미
--% : 길이와 상관없이 모든 문자열 데이터를 의미
SELECT
	e.empno,
	REPLACE(e.EMPNO, SUBSTR(e.EMPNO, 3), '**') AS 마스킹처리empno,
	e.ENAME,
	REPLACE(e.Ename, SUBSTR(e.Ename, 2), '****') AS 마스킹처리ename
FROM
	emp e;

--채움 함수
--오라클함수
--내장함수
--대소문자 :upper(), lower(), initcap()
--문자의 길이를 구하는 함수: length(), Lengthb()
--문자열 일부 추출: substr(문자열데이터, 시작위치, 추출길이)
--문자열 데이터 안에서 특정 문자 위치 찾기: INstr()
--특정문자를 다른문자로 변경: replace(원본문자열, 찾을문자열)
--두 문자열 데이터 합치기: concat(문자열1, 문자열2), ||
--특정ㅁ문자 제거: TRim()
--데이터의 공간을 특정문자로 ㅍ\채우기: LPAD(), RPAD()(데이터, 자리수, 채울문자)

SELECT e.empno, RPAD(SUBSTR(e.EMPNO,1,2) , 4, '*'), e.ENAME, rpad(substr(e.ename, 1, 1), length(e.ename), '*')
FROM emp e;

--2.emp 테이블에서 사원의 월 평균 근무일수는 21이다.
--하루 근무시간을 8시간으로 보았을 때 사원의 하루급여(day_pay)와 시급(time_pay)를
--계싼하여 출력한다(단 하루급여는 소수 셋째자리에서 버리고, 시급은 둘째자리에서 반올림)
--empno, ename, sal, day_pay, time_pay
SELECT
	e.EMPNO,
	e.ENAME,
	e.SAL,
	TrunC(e.SAL / 21,2) AS day_pay,
	round((e.sal / 21)/ 8,1) AS time_pay
FROM
	emp e;



--3. 입사일 기중으로 3개월 지난 후 첫 월요일 정직원
--사원이 정직원이 되는 날자는 yyyy-mm-dd
--추가수당 없으면 n/a
-- empno, ename, hiredate, r_job, comm

SELECT
	e.EMPNO,
	e.ENAME,
	e.HIREDATE,
	TO_char(NEXT_day(add_months(e.HIREDATE, 3), '월요일'), 'yyyy/mm/dd')AS r_job,
	CASE
		WHEN e.comm IS NULL THEN 'n/a'
		WHEN e.COMM = 0 THEN 'n/a'
		WHEN e.COMM>0 THEN '' || e.comm
	END AS comm
FROM
	emp e;

--4. 직속상관의 사원번호 없을 때 0000
--	 직속상관의 사원번호 앞두자리 75: 5555
--	 직속상관의 사원번호 앞두자리 76: 6666
--	 직속상관의 사원번호 앞두자리 77: 7777
--	 직속상관의 사원번호 앞두자리 78: 8888
-- 그 외는 그대로 출력
--출력형태 empno, ename, mgr, ChG_MGR

SELECT
	e.EMPNO ,
	e.ENAME ,
	e.MGR,
	CASE
		WHEN e.mgr LIKE '75%' THEN 5555
		WHEN e.mgr LIKE '76%' THEN 6666
		WHEN e.mgr LIKE '77%' THEN 7777
		WHEN e.mgr LIKE '78%' THEN 8888
		ELSE e.mgr
	END AS CHG_MGR
FROM
	EMP e
	
--하나의 열에 출력결과를 담는 다중행함수
	--null은 제외하고 연산
	--1. sum, 2.count, 3. max, 4.min, 5.avg
	
	
--부서별 평균 급여 조회
SELECT e.DEPTNO, avg(e.sal)
FROM emp e
GROUP BY e.DEPTNO 


-- 부서별, 직책별

SELECT e.deptno, e.job, avg(e.sal)
FROM EMP e 
GROUP BY e.DEPTNO, e.JOB mc
	
	
	
	
--C(insert): 삽입

--INSERT INTO 테이블명(필드명, 필드명, ...)
--values(값1, 값2, )

-- 기존 테이블을 복사 후 새 테이블로 생성
CREATE TABLE dept_temp AS SELECT* FROM dept;

INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE', 'SEOUL');


INSERT INTO DEPT_TEMP
VALUES(60, 'NETWORK', 'BUSAN');

INSERT INTO DEPT_TEMP
VALUES('70', 'NETWORK', 'BUSAN');
	
--적거나 많거나 하면 이상
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES('NETWORK', 'BUSAN');


INSERT INTO DEPT_TEMP
VALUES(600, 'NETWORK', 'BUSAN');
	
INSERT INTO DEPT_TEMP
VALUES(80, 'NETWORK',null);
	

--필드명 생성은 테이블의 현재 열 순서대로 나열되었다고 가정하고
--데이터 처리
INSERT INTO DEPT_TEMP(DEPTNO, DNAME)
VALUES(90, 'NETWORK');
	
--열 구조만 복사 후 새 테이블 생성
CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1<>1;

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2020-12-13', 5000, 1000, 10)
	
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (3111, '성춘향', 'MANAGER', 9999, sysdate, 4000, null, 30)
	
-- emp에서 급여등급 1인사원만 추가
INSERT
	INTO
	emp_temp(empno,
	ename,
	job,
	mgr,
	hiredate,
	sal,
	comm,
	deptno)
SELECT
	e.*
FROM
	emp e
JOIN SALGRADE s ON
	e.SAL BETWEEN s.losal AND s.HISAL
	AND s.GRADE = 1
	
	
--U(Update)
--update 테이블명
--set 변경할열=값, 변경할열=값....
--where 데이터를 변경할 대상 행을 선별하는 조건 나열
	
	
--90번 부서의 loc, Seoul 변경
UPDATE dept_temp
SET loc ='SEOUL'
WHERE Deptno= '90';
	
	
UPDATE dept_temp
SET loc ='SEOUL';
	
	
--COMMIT;
--ROLLBACK;	


-- 40번 부서의 부서명, 위치 변경
-- dept 테이블 40번 부서랑 동일

UPDATE dept_temp
SET (dname, loc)=(SELECT dname, loc FROM dept WHERE deptno= 40)
WHERE deptno= 40;
	

-- 50 번 부서의 dname, loc 변경
UPDATE dept_temp
SET loc ='BOSTON', Dname='SALES'
WHERE Deptno= '50';

--delete: 삭제
--DELETE FROM 테이블명
--WHERE 삭제할 조건

DELETE FROM 
WHERE 

-- 70번 부서 삭제
DELETE FROM DEPT_TEMP 
WHERE deptno= 70;

--loc 가 SEOUL 데이터 삭제
DELETE DEPT_TEMP 
WHERE loc='SEOUL';



DELETE EMP_TEMP 
WHERE sal>3000;

	
DELETE EMP_TEMP 


CREATE TABLE exam_emp AS SELECT * FROM emp;
CREATE TABLE exam_dept AS SELECT * FROM dept;
CREATE TABLE exam_salgrade AS SELECT * FROM salgrade;

--dept 테이블에 다음 데이터를 삽입하기
--50, oracle, busan
--60, sql, ilsan
--70, select, incheon
--80, dml, bundang
INSERT INTO exam_dept
VALUES(50, 'oracle', 'busan');

INSERT INTO exam_dept
values(60, 'sql', 'ilsan');

INSERT INTO exam_dept
VALUES(70, 'select', 'incheon');

INSERT INTO exam_dept
values(80, 'dml', 'bundang');


--exam_emp 테이블에 다음 데이터 삽입하기

INSERT INTO exam_emp
values(7201, 'user1', 'manager', 7788, '2016-02-01', 4500, NULL, 50)

INSERT INTO exam_emp
values(7202, 'user2', 'clerk', 7201, '2016-02-16', 1800, NULL, 50)

INSERT INTO exam_emp
values(7203, 'user3', 'analyst', 7201, '2016-04-11', 3400, NULL, 60)

INSERT INTO exam_emp
values(7204, 'user4', 'salesman', 7201, '2016-05-31', 2700, NULL, 60)

INSERT INTO exam_emp
values(7205, 'user5', 'clerk', 7201, '2016-07-20', 2600, NULL, 70)

INSERT INTO exam_emp
values(7206, 'user6', 'clerk', 7201, '2016-09-08', 2600, NULL, 70)

INSERT INTO exam_emp
values(7207, 'user7', 'lecturer', 7201, '2016-10-28', 2300, NULL, 80)

INSERT INTO exam_emp
values(7208, 'user8', 'student', 7201, '2018-03-09', 1200, NULL, 80)


UPDATE
	EXAM_EMP
SET
	DEPTNO = 70
WHERE
	DEPTNO = 50
	AND SAL > (
	SELECT
		AVG(SAL)
	FROM
		EXAM_EMP
	WHERE
		DEPTNO = 50
);
	
UPDATE EXAM_EMP ee
SET DEPTNO=80, SAL=sal*1.1;
WHERE hiredate>(SELECT min(hiredate) FROM exam_amp WHERE deptno=60);
	

--트랜잭션: all or Nothing
--dml -insert update delete
--commit(전부 실행), rollback(전부 취소)

INSERT INto DEPT_TEMP  values(30, 'database', 'seoul');
UPDATE DEPT_TEMP SET loc= 'busan' WHERE deptno=40;
DELETE FROM DEPT_TEMP WHERE dname= 'research';

COMMIT;

ROLLBACK;

--세션: 데이터베이스 접속을 후 작업을 수행한 후 접속을 종료하기까지 전체 기간

SELECT * FROM emp e;

DELETE FROM DEPT_TEMP WHERE deptno=30;
COMMIT;

--ddl(데이터 정의어): 객체를 생성, 변경, 삭제
--1. 테이블 생성: create
--2.       변경: alter
--3.       삭제: drop
--4. 테이블 전체 데이터 삭제 : truncate
--5. 테이블 이름 변경: rename

--CREATE TABLE 테이블명(
--	컬럼명1 자료형, 
--	컬럼명2 자료형, 
--	컬럼명3 자료형, 
--)

--테이블명 규칙
-- 문자로 시작
-- 테이블 이름은 30바이트 이하
-- 같은 사용자 안에서는 테이블명 중복 불가
-- sql 예약어는 테이블 이름으로 사용할 수 없다

CREATE TABLE dept_ddl(
	deptno number(2,0),
	dname varchar2(14),
	loc varchar2(13)
);

CREATE table emp_ddl(
	empno number(4,0),
	ename varchar2(10),
	job varchar2(9),
	mgr number(4,0),
	hiredate DATE,
	sal number(7,2),
	comm number(7,2),
	deptno number(2,0)
);

--기존 테이블 구조와 데이터를 이용한 새 테이블 생성
CREATE TABLE EXAM_EMP AS SELECT * FROM emp;

--기존 테이블 구조만 이용해 새 테이블 생성
CREATE TABLE EXAM_EMP AS SELECT * FROM emp WHERE 1<>1;

-- alter : 테이블 변경
-- 1)열 추가
-- 2)열 이름 변경
-- 3)열 자료형 변경
-- 4)특정 열 삭제

--HP 열 추가
ALTER TABLE EMP_DDL AND HP varchar2(20);

--HP => TEL 변경
ALTER TABLE Emp_ddl AND hp TO tel;


--empno 자리수 4=>5
ALTER TABLE EMP_DDL MODIFY empno number(5);

ALTER TABLE emp_ddl MODIFY ename varchar2(8);

ALTER TABLE EMP_DDL MODIFY empno number(3);

--정도 또는 자리수를 축소할 열은 비어 있어야 합니다
--ALTER TABLE EMP_temp MODIFY empno number(3);

--특정 열 삭제
ALTER TABLE EMP_DDL DROP column tel;

RENAME emp_ddl TO emp_rename;

--테이블 데이터 삭제
--delete from emp_rename; ->rollback


--rollback 안됨
TRUNCATE TABLE emp_rename;

--테이블 제거
DROP TABLE EMP_RENAME ;

--member 테이블 생성하기
-- id varchar2(8)/ name 10 / addr 50/ email 30/ age number(4)
CREATE table member(
	id varchar2(8),
	name varchar2(10),
	addr varchar2(50),
	email varchar2(30),
	age number(4)
);

--insert
INSERT INTO MEMBER (id, name, addr,email,age)
VALUES ('hong123', '홍길동', '서울시 종로구', 'hong123@naver.com', 24)



-- member 테이블 열 추가
-- bigo 열 추가(문자열, 20)

ALTER TABLE MEMBER add bigo varchar2(20);

-- bigo 열 크기를 30으로 변경

ALTER TABLE MEMBER modify bigo varchar2(30);

-- bigo 열 이름을 remark 로 변경

ALTER TABLE MEMBER RENAME column bigo TO remark;

--오라클 객체
--1. 오라클 데이터 베이스 테이블
--1) 사용자 테이블
--2) 데이터 사전- 중요한 데이터 (사용자, 권한, 메모리, 성능...): 일반 사용자가 접근하는 곳은 아님
-- user_*, all_*, dba_, v$_*
--2. 인덱스: 검색을 빠르게 처리
--	1) full scan
--	2) index scan
--3. view: 가상 테이블
--	물리적으로 저장된 테이블은 아님



SELECT * FROM dict;

SELECT TABLE_name
FROM USER_tables;

--인덱스 조회
SELECT * FROM user_indexes;

--인덱스 생성
--CREATE INDEX 인덱스명 ON 테이블명(열이름 ASC OF DESC, 열이름 ..)

CREATE INDEX idx_emp_temp_sal ON Emp_Temp(sal);


--인덱스 삭제
DROP INDEX idx_emp_temp_sal;

SELECT * FROM emp e;

--뷰
--권한을 가진 사용자만 생성 가능
--보안성 : 특정 열을 노출하고 싶지 않을 때
--편리성 : select 문의 복잡도 완화
--CREATE VIEW 뷰 이름(열이름1, 열이름2....) AS (저장할 SELECT 구문)

CREATE VIEW vw_emp20 AS (
SELECT
	e.empno,
	e.ENAME,
	e.JOB,
	e.DEPTNO
FROM
	emp e
WHERE
	e.DEPTNO = 20);


DROP VIEW VW_EMP20;





CREATE TABLE tbl_notnull(
	login_id varchar2(20) NOT NULL,
	login_pwd varchar2(20) NOT NULL,
	tel varchar2(20)
)

CREATE TABLE tbl_notnull2(
	login_id varchar2(20) CONSTRAINT TBLUN2_LOGID_NW NOT NULL,
	login_pwd varchar2(20) CONSTRAINT TBLUN2_LOGPWD_NWNOT NULL,
	tel varchar2(20)
)


--규칙 나중에 추가시 에러

UPDATE TBL_NOTNULL tn 
SET tel='010-1234-5678'
WHERE tn.LOGIN_ID = 'hong123'

ALTER TABLE TBL_NOTNULL2 MODIFY (tel CONSTRAINT tblnn2_tel_nn NOT null);

ALTER TABLE TBL_NOTNULL2 RENAME CONSTRAINT tblnn2_tel_nn TO TBL_NN2_TELNN;

ALTER TABLE TBL_NOTNULL2 DROP CONSTRAINT TBL_NN2_TEL_NN

--unique: 데이터 중복 허용x
--null은 중복 대상 제외
CREATE TABLE TBL_UNIQUE(
	login_ID varchar2(20) UNIQUE,
	login_PW varchar2(20) NOT NULL,
	tel varchar2(20)
)


INSERT INTO TBL_UNIQUE(login_ID, login_PW, tel)
values('hong123', 'pw123', '010-1234-5678');


--유일 값: primary key(pk)
--pk: not null+unique
-- 컬럼 하나만 지정가능

--외래키(FK): 다른 테이블과 관계를 맺는 키
--join 구문 emp(deptno), dept(deptno)
--emp 테이블에 deptno 는 dept 테이블의 deptno 값을 참조해서 삽입


--부서 테이블 생성(참조 대상이 되는 테이블 먼저 작성)
CREATE TABLE dept_FK(
	deptno number(2) CONSTRAINT deptfk_deptno_pk PRIMARY KEY,
	dname varchar2(14),
	loc varchar2(13)
);

CREATE TABLE emp_fk(
	empno number(4)	CONSTRAINT emprk_empno_pk PRIMARY KEY,
	ename varchar2(10) NOT NULL,
	job varchar2(9) NOT NULL,
	mgr number(4),
	hiredate DATE,
	sal number(7,2) NOT NULL,
	comm number(7,2),
	deptno number(2) CONSTRAINT empfk_deptno_fk REFERENCES deop_fk(deptno)
);

INSERT INTO emp_fk(empno, ename, job, hiredate, sal, deptno)
VALUES(9999, 'test1', 'partner', sysdate, 2500, 10);


-- insert 시 주의점
-- 참조 대상이 되는 테이블(부모)의 데이터 삽입
-- 참조 하는 테이블(자식)의 데이터 삽입

INSERT INTO dept_fk VALUES(10, 'database', 'seoul');

INSERT INTO emp_fk(empno, ename, job, hiredate, sal, deptno)
VALUES(9999, 'test1', 'partner', sysdate, 2500, 10);


--delete 시 주의점
DELETE FROM dept_Fk WHERE deptno=10;

--delete 시 주의점
--1)참조 하는 테이블의(자식)의 데이터 삭제
--2)참조 대상이 되는 테이블(부모)의 데이터 삭제


--옵션 설정
--1) on delete cascade: 부모 삭제 시 같이 삭제
--2) on delete set null: 부모 삭제 시 연결된 자식의 부모를 null로 변경



DROP TABLE MEMBER;

INSERT INTO MEMBER(id, name, addr, email, age)
VALUES('hong25', '홍길동', '서울시 종로구','hong123@naver.com', 24)

--member 테이블 열 추가

CREATE TABLE member(
	NO number(8) UNIQUE,
	id varchar2(8) PRIMARY key,
	name varchar2(10) NOT null,
	addr varchar2(50),
	email varchar2(30) NOT null,
	age number(4)
)



SELECT * FROM MEMBER WHERE name LIKE '%홍%'

--check: 데이터의 형태와 범위를 지정

CREATE TABLE TBL_CHECK(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) CHECK (LENGTH(LOGIN_PWD)>3),
	TEL VARCHAR2(20)
)

INSERT INTO TBL_CHECK 
VALUES('Test_ID', '11202', '010-1234-5678');


--default
CREATE TABLE TBL_default(
	LOGIN_ID VARCHAR2(20) PRIMARY KEY,
	LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
	TEL VARCHAR2(20)
)

INSERT INTO TBL_DEFAULT(login_ID tel)
value('test_id', '010-1234-4567')

--사용자




