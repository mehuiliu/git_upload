create table STUDENT.POLICE_INFO
   (POLICE VARCHAR2(10 BYTE) primary key, 
	POLICE_AD NVARCHAR2(200 BYTE), 
	POLICE_TEL VARCHAR2(20 BYTE));
       
insert into STUDENT.POLICE_INFO (POLICE, POLICE_AD, POLICE_TEL) 
values ('M001', '竹南鎮民族街72號', '037474796');
insert into STUDENT.POLICE_INFO (POLICE, POLICE_AD, POLICE_TEL) 
values ('M002', '苗栗市金鳳街109號', '037320059');
insert into STUDENT.POLICE_INFO (POLICE, POLICE_AD, POLICE_TEL) 
values ('M003', '頭份市中興路503號', '037663004');

create table STUDENT.VILLAGE_INFO
(
  VILLAGE VARCHAR2(20)PRIMARY KEY 
, VILLAGE_AD NVARCHAR2(200) 
, OFFICE_TEL VARCHAR2(20)
, POLICE VARCHAR2(20)
);

insert into STUDENT.VILLAGE_INFO (ViLLAGE,VILLAGE_AD,OFFICE_TEL,POLICE) 
 values ('C001','竹南鎮公義路1035號','037581072','M001');
insert into STUDENT.VILLAGE_INFO (ViLLAGE,VILLAGE_AD,OFFICE_TEL,POLICE) 
 values ('C002','竹南鎮竹南里中山路103號','037472735','M001');
insert into STUDENT.ViLLAGE_INFO (ViLLAGE,VILLAGE_AD,OFFICE_TEL,POLICE) 
 values ('C003','竹南鎮山佳里國光街 14號','037614186','M001');
insert into STUDENT.VILLAGE_INFO (ViLLAGE, VILLAGE_AD, OFFICE_TEL, POLICE) 
 values ('C004', '後龍鎮埔頂里中興路136-1號', '037724839', 'M001');
insert into STUDENT.VILLAGE_INFO (ViLLAGE, VILLAGE_AD, OFFICE_TEL, POLICE) 
 values ('C005', '苗栗市綠苗里中正路 766號', '037333240', 'M002');
insert into STUDENT.VILLAGE_INFO (ViLLAGE, VILLAGE_AD, OFFICE_TEL, POLICE) 
 values ('C006', '頭份市民族路96號', '037660001', 'M003');
insert into STUDENT.ViLLAGE_INFO (ViLLAGE,VILLAGE_AD,OFFICE_TEL,POLICE) 
 values ('C007','頭份市光大街82號','037661145','M003');
insert into STUDENT.VILLAGE_INFO (ViLLAGE,VILLAGE_AD,OFFICE_TEL,POLICE) 
 values ('C008','頭份市信義路53巷1號','037616072','M003');


create table STUDENT.FACILITY_INFO 
(
    PKCODE NUMBER(4,0)primary key,
    BUILDING VARCHAR2(10), 
	VILLAGE VARCHAR2(10), 
	SHELTER_AD NVARCHAR2(200), 
	PNUMBER NUMBER(4,0) , 
	DOWN NUMBER(4,0), 
	POLICE VARCHAR2(10) references POLICE_INFO(POLICE)
	);

insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (1,'B01','C001','竹南鎮中埔街20號','100',1,'M001');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (2,'B02','C002','竹南鎮和平街79號',3142,1,'M001');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (3,'B02','C002','竹南鎮龍山路三段142號',1042,1,'M001');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (4,'B03','C004','後龍鎮中華路1498號',32,1,'M001');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (5,'B01','C005','苗栗市光復路117號',26,1,'M002');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (6,'B02','C005','苗栗市博愛街109號',2038,2,'M002');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (7,'B02','C005','苗栗市大同路53號',128,2,'M002');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (8,'B03','C006','頭份市民族里和平路102號',353,1,'M003');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (9,'B04','C007','頭份市忠孝忠孝一路69號',501,1,'M003');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (10,'B01','C008','頭份市信義里中正路65號',194,1,'M003');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (11,'B04','C008','頭份市信義里中正路116號',78,1,'M003');
insert into STUDENT.FACILITY_INFO (PKCODE,BUILDING,VILLAGE,SHELTER_AD,PNUMBER,DOWN,POLICE) 
 values (12,'B01','C005','苗栗縣苗栗市米市街80號',106,1,'M002');
 
alter table FACILITY_INFO 
 add BNAME VARCHAR2(30); 
 
update FACILITY_INFO 
set BNAME = case 
    when PKCODE = 1 then '公寓'
    when PKCODE = 2 then '大樓'
    when PKCODE = 3 then '大樓'
    when PKCODE = 4 then '公共設施'
    when PKCODE = 5 then '大樓'
    when PKCODE = 6 then '大樓'
    when PKCODE = 7 then '大樓'
    when PKCODE = 8 then '公共設施'
    when PKCODE = 9 then '私營單位'
    when PKCODE = 10 then '公寓'
    when PKCODE = 11 then '私營單位'
    when PKCODE = 12 then '公寓'
    else BNAME
end
where PKCODE in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);


create table STUDENT.POLICECODE
(POLICE VARCHAR2(20),
 PCODE VARCHAR2(20));
 
insert into POLICECODE (POLICE,PCODE) values ('M001','竹南分局');
insert into POLICECODE (POLICE,PCODE) values ('M002','苗栗分局');
insert into POLICECODE (POLICE,PCODE) values ('M003','頭份分局');

create table STUDENT.VILLAGENAME
(VILLAGE VARCHAR2(20),
 VNAME VARCHAR2(20));

insert into VILLAGENAME (VILLAGE,VNAME) values ('C001','大埔里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C002','竹南里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C003','山佳里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C004','埔頂里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C005','綠苗里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C006','民族里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C007','忠孝里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C008','信義里'); 

select * from POLICE_INFO;

alter table VILLAGE_INFO 
add VNAME VARCHAR2(30);
update VILLAGE_INFO 
set VNAME = case 
    when VILLAGE = 'C001' then '大埔里'
    when VILLAGE = 'C002' then '竹南里'
    when VILLAGE = 'C003' then '山佳里'
    when VILLAGE = 'C004' then '埔頂里'
    when VILLAGE = 'C005' then '綠苗里'
    when VILLAGE = 'C006' then '民族里'
    when VILLAGE = 'C007' then '忠孝里'
    when VILLAGE = 'C008' then '信義里'
    else VNAME
end
where VILLAGE in ('C001','C002','C003','C004','C005','C006','C007','C008');

alter table POLICE_INFO 
add PNAME VARCHAR2(30);

update POLICE_INFO 
set PNAME = case 
    when POLICE = 'M001' then '竹南分局'
    when POLICE = 'M002' then '苗栗分局'
    when POLICE = 'M003' then '頭份分局'

    else PNAME
end
where POLICE in ('M001','M002','M003');

ALTER TABLE FACILITY_INFO
ADD CONSTRAINT fk_customer
FOREIGN KEY (VILLAGE)
REFERENCES VILLAGE_INFO (VILLAGE);
