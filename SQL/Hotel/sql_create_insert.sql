/*CREATE : 
====================================*/
create table department(dep_id number primary key,dep_location varchar(6) not null,dep_name varchar(20) not null);

create table employee (emp_id number(10) primary key,fname varchar(15) not null, lname varchar(15) not null,salary number(5),E_DOB number(4),emp_address varchar(30),job_department varchar(20),dep_id number,FOREIGN KEY(dep_id) 
REFERENCES department(dep_id));

create table invoice(pay_id number primary key,pay_method varchar(10),invoice_cost number (6),invoice_date date);

create table customer(cust_ssn number(10) primary key,fname varchar(15) not null,lname varchar(15) not null,cust_address varchar(30),C_DOB number(4),pay_id number (10),foreign key(pay_id) references invoice(pay_id));

create table Secretary (emp_id number primary key,gender varchar(6),foreign key(emp_id) references employee(emp_id));

create table manager (emp_id number primary key,YOE number(2),foreign key(emp_id) references employee(emp_id),dep_id number,foreign key(dep_id) references department(dep_id));

ALTER TABLE employee 
ADD CONSTRAINT emp_salary_min  
            CHECK (salary > 0);



create table record (record_id number(6) primary key,record_date date,emp_id number,cust_ssn number,foreign key (emp_id) references employee(emp_id),foreign key (cust_ssn) references customer(cust_ssn));

Create Table serve(emp_id number, FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
cust_ssn number, FOREIGN KEY(cust_ssn) REFERENCES customer(cust_ssn), 
Primary key(emp_id, cust_ssn));

Create Table account(Email varchar(60) Primary Key, Password varchar(25) Not null, Phone 
number(11) Unique Not null);

Create Table Staff_Account (Email varchar(60) Primary Key, FOREIGN KEY(Email) REFERENCES 
Account(Email), System_Access_Number number(15) Unique Not null, emp_id number, 
FOREIGN KEY(emp_id) REFERENCES Employee(emp_id));

Create Table Cust_Account (Email varchar(60) Primary Key, FOREIGN KEY(Email) REFERENCES 
Account(Email), user_name varchar(25) Unique Not null, cust_ssn number, 
FOREIGN KEY(cust_ssn) REFERENCES customer(cust_ssn));

create table room(room_num number(4) primary key not null,room_type varchar(12),floor varchar(12),section varchar(12),cust_ssn number,foreign key (cust_ssn) references customer(cust_ssn));

create table report(report_id number(10) primary key,rating number(1),cust_ssn number,foreign key (cust_ssn) references customer(cust_ssn));

create table pros (report_id number primary key,foreign key (report_id) references report(report_id),pros_type varchar(20));

create table cons (report_id number primary key,foreign key (report_id) references report(report_id),cons_type varchar(20));
/*===============================================
INSERT :
===============================================*/
CREATE SEQUENCE dept_dep_id_seq INCREMENT BY 10 START WITH 80 MAXVALUE 9999 NOCACHE NOCYCLE;

   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'b2','front_off' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'b3','house_keep' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'b4','food_beverage' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'b5','eng_maintenance' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'b6','account_credit' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'b7','security' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'c1','hr' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'c2','sales_mark' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'c3','it' );
   INSERT INTO department VALUES (dept_dep_id_seq.NEXTVAL , 'c4','kitchen_production' );


   CREATE SEQUENCE emplo_emp_id_seq INCREMENT BY 1 START WITH 600 MAXVALUE 9999 NOCACHE NOCYCLE;


INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Reta','Parker',4257,1985,'24 st','front_off',80);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Michael','Mansell',3672,1965,'31 st','front_off',80);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'John','Christiano',5963,1989,'11 st','front_off',80);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Michael','Newton',4955,1982,'30 st','front_off',80);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Georgette','Stephens',4834,1996,'6 st','front_off',80);

INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Melinda','Dasilva',3814,1977,'6 st','house_keep',90);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Lee','Bailey',5017,1974,'12 st','house_keep',90);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Dean','Mula',3734,1988,'4 st','house_keep',90);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Blanche','Daily',5416,1979,'47 st','house_keep',90);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Orlando','Renfrow',5928,1963,'3 st','house_keep',90);

INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Anthony','Hardister',4705,1974,'25 st','food_beverage',100);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Nancy','Linarez',4864,1989,'39 st','food_beverage',100);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'James','Mcgee',5946,1979,'14 st','food_beverage',100);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Ruth','Daley',5348,1965,'47 st','food_beverage',100);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Bette','Ross',5612,1997,'20 st','food_beverage',100);


INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Sharon','Tucker',5808,1970,'14 st','eng_maintenance',110);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Mary','Maddox',3019,1996,'48 st','eng_maintenance',110);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Marta','Eisner',5267,1997,'35 st','eng_maintenance',110);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Simone','Taylor',3695,1981,'22 st','eng_maintenance',110);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Sabrina','Irizarry',5189,1964,'36 st','eng_maintenance',110);


INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Margaret','Kelly',4118,1978,'1 st','account_credit',120);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Glenda','Lay',4723,1960,'29 st','account_credit',120);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Susan','Green',4653,1961,'40 st','account_credit',120);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Alejandro','Ramirez',4733,1972,'38 st','account_credit',120);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Lupita','Fisher',4554,1979,'10 st','account_credit',120);

INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Josefina','Smith',5442,1961,'44 st','security',130);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Paul','Benally',3897,1996,'25 st','security',130);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Herbert','Thompson',3062,1972,'49 st','security',130);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Susan','Fryman',3694,1976,'9 st','security',130);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Jean','Mitchell',5107,1977,'22 st','security',130);

INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Wanda','Washington',5960,1981,'11 st','hr',140);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Andrew','Kinde',3054,1984,'19 st','hr',140);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Jeffery','Reese',3334,1971,'13 st','hr',140);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Kristi','Miller',3160,1984,'2 st','hr',140);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Peter','Lopez',4839,1968,'17 st','hr',140);

INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Timothy','Warnock',5931,1985,'13 st','sales_mark',150);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Sara','Carlton',5746,1974,'13 st','sales_mark',150);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'James','Reidy',5649,1993,'16 st','sales_mark',150);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Kathleen','Williamson',5069,1997,'1 st','sales_mark',150);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Betty','Hamby',4319,1969,'2 st','sales_mark',150);

INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Kathy','Burley',5724,1989,'49 st','it',160);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'James','Deems',3232,1997,'11 st','it',160);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Martha','Wagoner',5861,1992,'36 st','it',160);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Ronald','Mcneely',3116,1971,'11 st','it',160);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Steven','Dykstra',5744,1986,'34 st','it',160);

INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Mildred','Thomas',4891,1982,'45 st','kitchen_production',170);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Becky','Munoz',5594,1989,'3 st','kitchen_production',170);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Denise','Long',4180,1964,'29 st','kitchen_production',170);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'Shanna','Somers',3514,1960,'14 st','kitchen_production',170);
INSERT INTO employee VALUES (emplo_emp_id_seq.NEXTVAL,'David','Green',3374,1967,'21 st','kitchen_production',170);



   CREATE SEQUENCE invo_pay_id_seq INCREMENT BY 1 START WITH 700 MAXVALUE 9999 NOCACHE NOCYCLE;

INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','9453',sysdate+ 1);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','2127',sysdate+ 2);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','1058',sysdate+ 3);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','6790',sysdate+ 4);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','5572',sysdate+ 5);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','4056',sysdate+ 6);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','3837',sysdate+ 7);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','7678',sysdate+ 8);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','7522',sysdate+ 9);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','7038',sysdate+ 10);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','3802',sysdate+ 11);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','8638',sysdate+ 12);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','143',sysdate+ 13);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','6981',sysdate+ 14);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','4864',sysdate+ 15);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','8425',sysdate+ 16);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','7489',sysdate+ 17);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'credit','3438',sysdate+ 18);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','2990',sysdate+ 19);
INSERT INTO invoice VALUES (invo_pay_id_seq.NEXTVAL,'cash','2425',sysdate+ 20);




 CREATE SEQUENCE cust_ssn_seq INCREMENT BY 53 START WITH 1000 MAXVALUE 99999999 NOCACHE NOCYCLE;


INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Carla','Pomeroy','34 st',1992,700);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Stephen','Farnsworth','13 st',1970,701);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Ada','Thomas','9 st',1961,702);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Eduardo','Sylvester','36 st',1968,703);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Mary','Harris','10 st',1988,704);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Martha','Fleming','44 st',1979,705);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Maria','Luna','36 st',1990,706);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Todd','Mcculla','45 st',1966,707);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Christopher','Laporte','2 st',1974,708);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Gordon','James','42 st',1967,709);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Rolf','Kelley','31 st',1977,710);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Regina','Shani','10 st',1985,711);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Connie','Martin','49 st',1998,712);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Lawrence','Coates','39 st',1967,713);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Rosalie','Martin','37 st',1989,714);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Stephen','Sanchez','21 st',1997,715);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Ben','Hutchinson','18 st',1995,716);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Christoph','Duca','21 st',1993,717);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Marc','Mcquiston','11 st',1971,718);
INSERT INTO customer VALUES (cust_ssn_seq.NEXTVAL,'Michael','Perez','9 st',1969,719);



INSERT INTO manager VALUES (603,3,80);
INSERT INTO manager VALUES (608,5,90);
INSERT INTO manager VALUES (617,3,100);
INSERT INTO manager VALUES (619,7,110);
INSERT INTO manager VALUES (623,2,120);
INSERT INTO manager VALUES (630,8,130);
INSERT INTO manager VALUES (634,6,140);
INSERT INTO manager VALUES (638,3,150);
INSERT INTO manager VALUES (643,4,160);
INSERT INTO manager VALUES (653,3,170);


INSERT INTO Secretary VALUES (604,'f');
INSERT INTO Secretary VALUES (609,'f');
INSERT INTO Secretary VALUES (616,'m');
INSERT INTO Secretary VALUES (618,'f');
INSERT INTO Secretary VALUES (624,'m');
INSERT INTO Secretary VALUES (629,'m');
INSERT INTO Secretary VALUES (635,'m');
INSERT INTO Secretary VALUES (639,'f');
INSERT INTO Secretary VALUES (645,'f');
INSERT INTO Secretary VALUES (651,'m');


CREATE SEQUENCE record_id_seq INCREMENT BY 1 START WITH 39 MAXVALUE 999999 NOCACHE NOCYCLE;


INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+0,645,1000);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+1,623,1053);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+2,608,1106);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+3,630,1159);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+4,629,1212);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+5,611,1265);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+6,602,1318);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+7,619,1371);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+8,623,1424);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+9,632,1477);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+10,641,1530);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+11,617,1583);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+12,609,1636);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+13,650,1689);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+14,631,1742);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+15,611,1795);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+16,634,1848);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+17,649,1901);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+18,609,1954);
INSERT INTO record VALUES (record_id_seq.NEXTVAL,sysdate+19,649,2007);

INSERT INTO account VALUES ('axpjh@gmail.com','ynAMlhtB','2048417388');
INSERT INTO account VALUES ('ycpjk@gmail.com','datmosNM','5986717479');
INSERT INTO account VALUES ('ozjbb@gmail.com','oPFYKwAY','6052908174');
INSERT INTO account VALUES ('isrhh@gmail.com','hKqwoLNF','4256110577');
INSERT INTO account VALUES ('wrcke@gmail.com','wKowSysP','7050267274');
INSERT INTO account VALUES ('bzvwi@gmail.com','dTpMqZRo','5933793097');
INSERT INTO account VALUES ('wdvqf@gmail.com','zljnepMZ','6532420575');
INSERT INTO account VALUES ('lozvu@gmail.com','YylNnwKd','4614721860');
INSERT INTO account VALUES ('bbanf@gmail.com','pvoMYjZD','1033637550');
INSERT INTO account VALUES ('fzlxq@gmail.com','IkhYsxZG','3627008720');
INSERT INTO account VALUES ('vbind@gmail.com','sBLYlskX','2168763207');
INSERT INTO account VALUES ('dwert@gmail.com','gBxIkAQc','4777711545');
INSERT INTO account VALUES ('alfwf@gmail.com','DtXQedEj','2153099759');
INSERT INTO account VALUES ('yetni@gmail.com','nvYXrwBX','7708421398');
INSERT INTO account VALUES ('wxraf@gmail.com','HYzxDXhm','5796884927');
INSERT INTO account VALUES ('eusyw@gmail.com','blvrdFpu','3173489808');
INSERT INTO account VALUES ('apayu@gmail.com','DcuVjSFN','5607160439');
INSERT INTO account VALUES ('zgxnd@gmail.com','oquanowz','9498550564');
INSERT INTO account VALUES ('cyxoz@gmail.com','RgmQEkpx','6211944471');
INSERT INTO account VALUES ('akiku@gmail.com','zyvWTjhS','1774727491');


INSERT INTO Staff_Account VALUES ('axpjh@gmail.com',5710587202,621);
INSERT INTO Staff_Account VALUES ('ycpjk@gmail.com',2536514727,622);
INSERT INTO Staff_Account VALUES ('ozjbb@gmail.com',5017001618,623);
INSERT INTO Staff_Account VALUES ('isrhh@gmail.com',5762340457,624);
INSERT INTO Staff_Account VALUES ('wrcke@gmail.com',8485616333,625);
INSERT INTO Staff_Account VALUES ('bzvwi@gmail.com',4033932861,626);
INSERT INTO Staff_Account VALUES ('wdvqf@gmail.com',7210323549,627);
INSERT INTO Staff_Account VALUES ('lozvu@gmail.com',9795984969,628);
INSERT INTO Staff_Account VALUES ('bbanf@gmail.com',6733667856,629);
INSERT INTO Staff_Account VALUES ('fzlxq@gmail.com',1251620126,630);

INSERT INTO Cust_Account VALUES ('vbind@gmail.com','BgSGOBGE',1530);
INSERT INTO Cust_Account VALUES ('dwert@gmail.com','EBfsFgDm',1583);
INSERT INTO Cust_Account VALUES ('alfwf@gmail.com','skpQsVsJ',1636);
INSERT INTO Cust_Account VALUES ('yetni@gmail.com','xqShTwGi',1689);
INSERT INTO Cust_Account VALUES ('eusyw@gmail.com','nSYlpBde',1795);
INSERT INTO Cust_Account VALUES ('zgxnd@gmail.com','SMvhfdUw',1901);
INSERT INTO Cust_Account VALUES ('cyxoz@gmail.com','AGmbtipL',1954);
INSERT INTO Cust_Account VALUES ('akiku@gmail.com','dENnwCiQ',2007);

CREATE SEQUENCE room_num_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999 NOCACHE NOCYCLE;

INSERT INTO room VALUES (room_num_seq.NEXTVAL,'qween','first','c',1000);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','third','b',1053);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','third','a',1106);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','first','c',1159);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','second','a',1212);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','first','a',1265);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'double','second','b',1318);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'single','second','b',1424);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','first','a',1477);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'double','second','d',1530);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'qween','first','d',1583);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'qween','second','a',1636);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','first','b',1689);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'single','second','b',1742);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','second','b',1795);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'single','third','c',1901);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','third','b',1954);
INSERT INTO room VALUES (room_num_seq.NEXTVAL,'king','third','b',2007);

CREATE SEQUENCE report_id_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999 NOCACHE NOCYCLE;


INSERT INTO report VALUES (report_id_seq.NEXTVAL,2,1000);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,2,1053);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,2,1106);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,4,1159);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,2,1212);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,1,1265);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,5,1318);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,2,1424);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,1,1477);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,3,1530);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,2,1583);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,2,1636);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,5,1689);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,4,1742);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,4,1795);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,5,1901);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,3,1954);
INSERT INTO report VALUES (report_id_seq.NEXTVAL,4,2007);

INSERT INTO pros VALUES (1,'view');
INSERT INTO pros VALUES (2,'clean room');
INSERT INTO pros VALUES (3,'good food ');
INSERT INTO pros VALUES (7,'good employees');
INSERT INTO pros VALUES (9,'price');
INSERT INTO pros VALUES (10,'view');
INSERT INTO pros VALUES (11,'rooms');
INSERT INTO pros VALUES (12,'food');
INSERT INTO pros VALUES (13,'drinks');
INSERT INTO pros VALUES (14,'ac');
INSERT INTO pros VALUES (15,'security');
INSERT INTO pros VALUES (16,'security');
INSERT INTO pros VALUES (17,'respectful crew');
INSERT INTO pros VALUES (19,'view');
INSERT INTO pros VALUES (20,'food');



INSERT INTO cons VALUES (1,'view');
INSERT INTO cons VALUES (2,'rooms');
INSERT INTO cons VALUES (3,'food ');
INSERT INTO cons VALUES (7,'employees');
INSERT INTO cons VALUES (9,'price');
INSERT INTO cons VALUES (10,'view');
INSERT INTO cons VALUES (11,'rooms');
INSERT INTO cons VALUES (12,'food');
INSERT INTO cons VALUES (13,'drinks');
INSERT INTO cons VALUES (14,'ac');
INSERT INTO cons VALUES (15,'security');
INSERT INTO cons VALUES (16,'security');
INSERT INTO cons VALUES (17,' crew');
INSERT INTO cons VALUES (19,'view');
INSERT INTO cons VALUES (20,'food');
