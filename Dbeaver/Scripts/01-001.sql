CREATE TABLE TEMP (
 EMP_ID      NUMBER NOT NULL PRIMARY KEY,
 EMP_NAME    VARCHAR2(10) NOT NULL,
 BIRTH_DATE  DATE,
 DEPT_CODE   VARCHAR2(06) NOT NULL,
 EMP_TYPE    VARCHAR2(04),
 USE_YN      VARCHAR2(01) NOT NULL,
 TEL         VARCHAR2(15),
 HOBBY       VARCHAR2(30),
 SALARY      NUMBER,
 LEV         VARCHAR2(04)
);
