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







 







