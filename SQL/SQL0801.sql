select* from FACILITY_INFO
--4-1
select FACILITY_INFO.POLICE, police_info.police_tel
 from STUDENT.FACILITY_INFO FO
 left join POLICE_INFO PO
 on FACILITY_INFO.POLICE = POLICE_INFO.POLICE
 where FACILITY_INFO.PNUMBER > 1000;
--4-2
select FACILITY_INFO.POLICE ,
      police_info.police_tel, facility_info.shelter_ad,
      facility_info.building,
 count(facility_info.shelter_ad) 
over(partition by facility_info.shelter_ad) as s_number 
 from FACILITY_INFO
 left join POLICE_INFO
 on FACILITY_INFO.POLICE = POLICE_INFO.POLICE
 where FACILITY_INFO.PNUMBER > 1000;

--4-4
select FACILITY_INFO.VILLAGE, FACILITY_INFO.SHELTER_AD, 
      FACILITY_INFO.PNUMBER, FACILITY_INFO.POLICE,police_info.police_tel
 from FACILITY_INFO
 left join POLICE_INFO
 on FACILITY_INFO.POLICE = POLICE_INFO.POLICE
 where SHELTER_AD like '%¤¤%';

Select  FACILITY_INFO.VILLAGE, FACILITY_INFO.SHELTER_AD, 
FACILITY_INFO.PNUMBER,village_info.village_ad
 from FACILITY_INFO
 left join VILLAGE_INFO
 on FACILITY_INFO.VILLAGE = village_info.village
 where BUILDING in ('B01','B02');
--
create table CBNAME
(BUILDING VARCHAR2(20) ,
 BUNAME VARCHAR2(20));

insert into CBNAME (Building,BUNAME) values ('B01','公寓');
insert into CBNAME (Building,BUNAME) values ('B02','大樓');
insert into CBNAME (Building,BUNAME) values ('B03','公共設施');
insert into CBNAME (Building,BUNAME) values ('B04','私營單位');
 

insert CBNAME (BNAME) values ('公寓','大樓','大樓','公共設施','大樓','公共設施','大樓','公共設施','私營單位',‘公寓’,'私營單位','公寓')

update FACILITY_INFO 
JOIN BNAME ON FACILITY. = ns.employee_id
SET e.salary = ns.new_salary;

-- 新增欄位
alter table FACILITY_INFO 
add BNAME VARCHAR2(30);

--新增欄位
update FACILITY_INFO 
set BNAME = case 
    when PKCODE = 1 then '公寓'
    when PKCODE = 2 then '大樓'
    when PKCODE = 3 then '大樓'
    when PKCODE = 4 then '公共設施'
    when PKCODE = 5 then '大樓'
    when PKCODE = 6 then '公共設施'
    when PKCODE = 7 then '大樓'
    when PKCODE = 8 then '公共設施'
    when PKCODE = 9 then '私營單位'
    when PKCODE = 10 then '公寓'
    when PKCODE = 11 then '私營單位'
    when PKCODE = 12 then '公寓'
    else BNAME
end
where PKCODE in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);

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
where VILLAGE in ('C001','C002','C003','C004','C005','C006','C007', 'C008');

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
--
create table POLICECODE
(POLICE VARCHAR2(20),
 PCODE VARCHAR2(30));

insert into POLICECODE (POLICE,PCODE) values ('M001','竹南分局');
insert into POLICECODE (POLICE,PCODE) values ('M002','苗栗分局');
insert into POLICECODE (POLICE,PCODE) values ('M003','頭份分局');

create table VILLAGENAME
(VILLAGE VARCHAR2(20),
 VNAME VARCHAR2(30));



insert into VILLAGENAME (VILLAGE,VNAME) values ('C001','大埔里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C002','竹南里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C003','山佳里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C004','埔頂里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C005','綠苗里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C006','民族里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C007','忠孝里');
insert into VILLAGENAME (VILLAGE,VNAME) values ('C008','信義里');



select FACILITY_INFO.POLICE, police_info.police_tel
 from STUDENT.FACILITY_INFO 
 left join POLICE_INFO 
 on FACILITY_INFO.POLICE = POLICE_INFO.POLICE
 left join POLICECODE
 on FACILITY_INFO.POLICE = POLICECODE.PCODE
 where FACILITY_INFO.PNUMBER > 1000;

select FACILITY_INFO.POLICE ,
      police_info.police_tel, facility_info.shelter_ad,
      facility_info.BNAME,
 count(facility_info.shelter_ad) 
over(partition by facility_info.shelter_ad) as s_number 
 from FACILITY_INFO
 left join POLICE_INFO
 on FACILITY_INFO.POLICE = POLICE_INFO.POLICE
 left join POLICECODE
 on FACILITY_INFO.POLICE = POLICECODE.PCODE
 where FACILITY_INFO.PNUMBER > 1000;

select FACILITY_INFO.VILLAGE, FACILITY_INFO.SHELTER_AD, 
      FACILITY_INFO.PNUMBER, FACILITY_INFO.POLICE,police_info.police_tel
 from FACILITY_INFO
 left join POLICE_INFO
 on FACILITY_INFO.POLICE = POLICE_INFO.POLICE
 left join POLICECODE
 on FACILITY_INFO.POLICE = POLICECODE.PCODE
 left join VILLAGENAME
 on FACILITY_INFO.VILLAGE = VILLAGENAME.VNAME
 where SHELTER_AD like '%¤¤%';

Select  FACILITY_INFO.VILLAGE, FACILITY_INFO.SHELTER_AD, 
FACILITY_INFO.PNUMBER,village_info.village_ad
 from FACILITY_INFO
 left join VILLAGE_INFO
 on FACILITY_INFO.VILLAGE = village_info.village
 left join VILLAGENAME
 on FACILITY_INFO.VILLAGE = VILLAGENAME.VNAME
 where BNAME in ('公寓','大樓');

create table FACILITY_INFO
( PKCODE NUMBER (4,0)primary key,
  BUNAME VARCHAR2(30 BYTE),
  VNAME VARCHAR2(30 BYTE),
  SHELTER_AD NVARCHAR2(200 BYTE),
  PNUMER NUMBER (4,0),
  DOWN NUMBER (4,0),
  PCODE VARCHAR2(30 BYTE) references VILLAGE_INFO(VNAME));


insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (1, '公寓', '大埔里', '竹南鎮中埔街20號',100 , 1, '竹南分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (2, '大樓', '竹南里', '竹南鎮和平街79號',3142 , 1, '竹南分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (3, '大樓', '山佳里', '竹南鎮龍山路三段142號',1072 , 1, '竹南分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (4, '公共設施', '埔頂里', '苗栗縣後龍鎮中華路1498號',32 , 1, '苗栗分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (5, '公寓', '綠苗里', '苗栗縣苗栗市米市街80號',106, 1, '苗栗分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (6, '公寓', '綠苗里', '苗栗縣苗栗市光復路117號',26, 1, '苗栗分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (7, '大樓', '綠苗里', '苗栗縣苗栗市博愛街109號',2038 , 2, '苗栗分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (8, '大樓', '綠苗里', '苗栗縣苗栗市大同路53號',128 , 2, '苗栗分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (9, '公共設施', '民族里', '苗栗縣頭份市民族里和平路102號',353 , 1, '頭份分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (10, '公共設施', '忠孝里', '苗栗縣頭份市忠孝忠孝一路69號',501 , 1, '頭份分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (11, '公寓', '信義里', '苗栗縣頭份市信義里中正路65號',194, 1, '頭份分局');
insert into FACILITY_INFO (PKCODE, BUNAME, VNAME, SHELTER_AD, PNUMER, DOWN, PCODE)
values (12, '公寓', '信義里', '苗栗縣頭份市信義里中正路116號',78, 1, '頭份分局');



create table VILLAGE_INFO
( VNAME VARCHAR2(30 BYTE)primary key,
  VILLAGE_AD NVARCHAR2(200 BYTE),
  OFFICE_TEL VARCHAR2(20 BYTE))
 
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('大埔里', '竹南鎮公義路1035號', '037581072');
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('竹南里', '竹南鎮竹南里中山路103 號', '037472735');
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('山佳里', '竹南鎮山佳里國光街14 號', '037-614186');
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('埔頂里', '後龍鎮埔頂里中興路136-1號', '037-724839');
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('綠苗里', '竹南鎮竹南里中山路103 號', '037-333240');
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('民族里', '民族里民族路96號', '037-660001');
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('忠孝里', '忠孝里光大街82號', '037-661145');
insert into VILLAGE_INFO (VNAME, VILLAGE_AD, OFFICE_TEL)
values ('信義里', '信義里信義路53巷1號', '037-616072');

create table POLICE_INFO
( PCODE VARCHAR2(30 BYTE) primary key,
  POLICE_AD NVARCHAR2(200 BYTE),
  POLICE_TEL VARCHAR2(20 BYTE));

insert into  POLICE_INFO (PCODE, POLICE_AD, POLICE_TEL) 
values ('竹南分局', '竹南鎮民族街72號', '037474796');

insert into POLICE_INFO (PCODE, POLICE_AD, POLICE_TEL) 
values ('苗栗分局', '竹南鎮民族街72號', '037320059');

insert into POLICE_INFO (PCODE, POLICE_AD, POLICE_TEL) 
values ('頭份分局', '苗栗市金鳳街109號', '037663004');


	

  
  







 







