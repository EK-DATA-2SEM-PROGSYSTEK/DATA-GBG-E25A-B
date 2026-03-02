CREATE DATABASE IF NOT EXISTS EMP_DEPT_25 DEFAULT CHARACTER SET utf8;
USE EMP_DEPT_25;
DROP TABLE if exists EMP;
DROP TABLE if exists DEPT;

CREATE TABLE DEPT(	
	DEPTNO INTEGER, 
	DNAME VARCHAR(30), 
	LOC VARCHAR(30), 
	PRIMARY KEY (DEPTNO)
); 

CREATE TABLE EMP(	
	EMPNO INTEGER, 
	ENAME VARCHAR(30), 
	JOB VARCHAR(30), 
	MGR INTEGER, 
	HIREDATE DATE, 
	SAL INTEGER, 
	COMM INTEGER, 
	DEPTNO INTEGER, 
	PRIMARY KEY (EMPNO),
	FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
 

Insert into DEPT (DEPTNO,DNAME,LOC) values (10,'ACCOUNTING','NEW YORK');
Insert into DEPT (DEPTNO,DNAME,LOC) values (20,'RESEARCH','DALLAS');
Insert into DEPT (DEPTNO,DNAME,LOC) values (30,'SALES','CHICAGO');
Insert into DEPT (DEPTNO,DNAME,LOC) values (40,'OPERATIONS','BOSTON');

insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7369,'SMITH','CLERK',7902,'2020-12-17',800,null,20);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7499,'ALLEN','SALESMAN',7698,'2021-02-20',1600,300,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7521,'WARD','SALESMAN',7698,'2021-02-22', 1250,500,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7566,'JONES','MANAGER',7839,'2021-04-02',2975,null,20);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7654,'MARTIN','SALESMAN',7698,'2021-09-28',1250,1400,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7698,'BLAKE','MANAGER',7839,'2021-05-01',2850,null,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7782,'CLARK','MANAGER',7839,'2021-06-09',2450,null,10);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7788,'SCOTT','ANALYST',7566,'2024-04-19',3000,null,20);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7839,'KING','PRESIDENT',null,'2021-11-17',5000,null,10);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7844,'TURNER','SALESMAN',7698,'2021-09-08',1500,0,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7876,'ADAMS','CLERK',7788,'2024-05-23',1100,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'JAMES','CLERK',7698,'2021-12-03',950,null,30);
insert into emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values (7902,'FORD','ANALYST',7566,'2021-12-03',3000,null,20);
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'MILLER','CLERK',7782,'2022-01-23',1300,null,10);

commit;