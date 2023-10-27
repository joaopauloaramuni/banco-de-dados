DROP TABLE department;
CREATE TABLE department (
  dname        varchar(25) not null,
  dnumber      integer(4),
  mgrssn       char(9) not null, 
  mgrstartdate date,
  primary key (dnumber),
  key (dname)
);

DROP TABLE dependent;
CREATE TABLE dependent (
  essn           char(9),
  dependent_name varchar(15),
  sex            char,
  bdate          date,
  relationship   varchar(8),
  primary key (essn,dependent_name),
  foreign key (essn) references employee(ssn)
);

DROP TABLE dept_locations;
CREATE TABLE dept_locations (
  dnumber   integer(4),
  dlocation varchar(15), 
  primary key (dnumber,dlocation),
  foreign key (dnumber) references department(dnumber)
);

DROP TABLE employee;
CREATE TABLE employee (
  fname    varchar(15) not null, 
  minit    varchar(1),
  lname    varchar(15) not null,
  ssn      char(9),
  bdate    date,
  address  varchar(50),
  sex      char,
  salary   decimal(10,2),
  superssn char(9),
  dno      integer(4),
  primary key (ssn),
  foreign key (superssn) references employee(ssn),
  foreign key (dno) references department(dnumber)
);

DROP TABLE project;
CREATE TABLE project (
  pname      varchar(25) not null,
  pnumber    integer(4),
  plocation  varchar(15),
  dnum       integer(4) not null,
  primary key (pnumber),
  unique (pname),
  foreign key (dnum) references department(dnumber)
);

DROP TABLE works_on;
CREATE TABLE works_on (
  essn   char(9),
  pno    integer(4),
  hours  decimal(4,1),
  primary key (essn,pno),
  foreign key (essn) references employee(ssn),
  foreign key (pno) references project(pnumber)
);

