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
