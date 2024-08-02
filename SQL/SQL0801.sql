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
 join POLICE_INFO
 on FACILITY_INFO.POLICE = POLICE_INFO.POLICE
 where SHELTER_AD like '%¤¤%';

Select  FACILITY_INFO.VILLAGE, FACILITY_INFO.SHELTER_AD, 
FACILITY_INFO.PNUMBER,village_info.village_ad
 from FACILITY_INFO
 join VILLAGE_INFO
 on FACILITY_INFO.VILLAGE = village_info.village
 where BUILDING in ('公寓','大樓');



