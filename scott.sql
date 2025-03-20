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
	
	