
CREATE TABLE Department (
  DName        varchar(25) not null,
  DNo          integer(4),
  MgrSSN       char(9) not null, 
  MgrStartDate date,
  primary key (DNo),
  key (DName),
  foreign key (MgrSSN) references Employee(SSN)
);


CREATE TABLE Employee (
  FName    varchar(15) not null, 
  MInit    varchar(1),
  LName    varchar(15) not null,
  SSN      char(9),
  BDate    date,
  Address  varchar(50),
  Sex      char,
  Salary   decimal(10,2),
  SuperSSN char(9),
  DNo      integer(4),
  primary key (SSN),
  foreign key (SuperSSN) references Employee(SSN),
  foreign key (DNo) references Department(DNo)
);


CREATE TABLE Project (
  PName      varchar(25) not null,
  PNo        integer(4),
  PLocation  varchar(15),
  DNo        integer(4) not null,
  primary key (PNo),
  unique (PName),
  foreign key (DNo) references Department(DNo)
);


CREATE TABLE DeptLocations (
  DNo       integer(4),
  DLocation varchar(15), 
  primary key (DNo,DLocation),
  foreign key (DNo) references Department(DNo)
);


CREATE TABLE Dependent (
  ESSN           char(9),
  DepName varchar(15),
  Sex            char,
  BDate          date,
  Relationship   varchar(8),
  primary key (ESSN,DepName),
  foreign key (ESSN) references Employee(SSN)
);


CREATE TABLE WorksOn (
  SSN   char(9),
  PNo    integer(4),
  Hours  decimal(4,1),
  primary key (SSN,PNo),
  foreign key (SSN) references Employee(SSN),
  foreign key (PNo) references Project(PNo)
);
