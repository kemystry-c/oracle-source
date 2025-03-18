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


