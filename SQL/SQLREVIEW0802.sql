--4-1 
select distinct PO.police_tel, PC.pcode
 from STUDENT.FACILITY_INFO FO
 left join POLICE_INFO PO 
 on FO.POLICE = PO.POLICE
 left join POLICECODE PC
 on FO.POLICE = PC.police
 where FO.PNUMBER > 1000;
 
--4-2
 
select PC.pcode ,
      PO.police_tel, FO.shelter_ad,
      FO.BNAME,
 count(FO.shelter_ad) 
 over(partition by FO.shelter_ad) as s_number 
 from STUDENT.FACILITY_INFO FO
 left join POLICE_INFO PO
 on FO.POLICE = PO.POLICE
 left join POLICECODE PC
 on FO.POLICE = PC.police
 where FO.PNUMBER > 1000;

--4-4
 
select VN.VNAME, FO.SHELTER_AD, 
      FO.PNUMBER,PC.PCODE,PO.police_tel
 from STUDENT.FACILITY_INFO FO
 left join POLICE_INFO PO
 on FO.POLICE = PO.POLICE
 left join POLICECODE PC
 on FO.POLICE = PC.POLICE
 left join VILLAGENAME VN
 on FO.VILLAGE = VN.village
 where SHELTER_AD like '%中%';

--4-5 
Select VN.VNAME, FO.SHELTER_AD, 
       FO.PNUMBER,VO.village_ad
 from STUDENT.FACILITY_INFO FO
 left join VILLAGE_INFO VO
 on FO.VILLAGE = VO.village
 left join VILLAGENAME VN
 on FO.VILLAGE = VN.VILLAGE
 where BNAME in ('公寓','大樓');

update facility_info
set pnumber = 5000
where shelter_ad = '竹南鎮和平街79號'

delete from facility_info
where PNUMBER <1000;

select * from FACILITY_INFO


