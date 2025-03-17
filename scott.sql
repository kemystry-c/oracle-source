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
SELECT * FROM EMP e; 