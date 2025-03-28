-- 오라클 관리자
-- system, sys

-- sys as sysdba


-- 오라클 12c 버전부터 사용자 계정 생성시 접두어(c##) 요구
-- c##hr
-- c## 사용하지 않을 때
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--비밀번호 변경
ALTER USER scott IDENTIFIED BY tiger;

-- 계정 잠금 해제
ALTER USER hr account unlock;



--데이터사전 DBA_users를 사용하여 사용자정보 조회
SELECT * FROM dba_users WHERE username='scott';


--scott view 생성 권한 부여
GRANT CREATE VIEW TO scott;


--사용자 관리
--오라클은 테이블, 인덱스, 뷰등 사용자별로 여러 객체를 생성하므로 업무별 사용자를 생성한 후에 각 사용자
--업무에 맞는 데이터 구조를 만들어 관리하는 방식 사용

--데이터베이스 스키마
--스키마: 데이터베이스에서 데이터 간 관계, 데이터 구조, 제약 조건 등 데이터를
-- 		저장하고 관리하고자 정의한 데이터베이스 구조 범위