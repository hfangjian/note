-- J32Z 车型的 几个 Vin码
-- LGBF1AE008R110147    LGBF1AE008R110164   LGBF1AE008R110018   LGBF1AE008R110035   LGBF1AE008R000019

-- C11Z 车型的 几个 VIN码
-- LGBG12C214Y000013   LGBG12C294Y000017  LGBG12E005Y001120     LGBG12E005Y001618


-- LGBF1AE008R000019 日期 0308 
SELECT model_code,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8 FROM nissan_car_attr 
WHERE model_code = 'J32Z' 
UNION ALL 
SELECT model_code,attr_text1,attr_text2,attr_text3,attr_text4,attr_text5,attr_text6,attr_text7,attr_text8 
FROM nissan_attr_value WHERE model_code='J32Z' and mark=2 
        and ( str_to_date('0308', '%m%y') >= str_to_date(begain_date, '%m%y') 
                and str_to_date('0308', '%m%y') <= ifnull(str_to_date(end_date, '%m%y'),now()) ) 
-- 
-- '2649', 'J32Z', '2', 'S', 'MR20DE', '2WD', '200XL', 'CVT', '', '', '', '0608', '1110'
-- '2650', 'J32Z', '2', 'S', 'MR20DE', '2WD', 'GE', 'CVT', '', '', '', '1110', '1212'

-- 车同轨分类 查询oe件


select * from nissan_partdetail a where model_code = 'J32Z'
and ( str_to_date('0608', '%m%y') between str_to_date(a.begain_date, '%m%y') and ifnull(str_to_date(a.end_date, '%m%y'),now()) ) 
and ( a.apply_model like '%MR20DE%' or a.apply_model like '%200XL%' or a.apply_model like '%CVT%' or a.apply_model like '%S%' or a.apply_model like '%2WD%' ) 


-- carbrand表一次性插入记录
insert into carbrand (nameofbrand,nameoffactory) select distinct nameofbrand,nameoffactory from car_model_all order by nameofbrand;

-- carseries表一次性插入记录
insert into carseries(nameofseries,brandid) select c.nameofseries,c.id from (
select distinct a.*,b.nameofseries from carbrand a inner join car_model_all b 
on a.nameofbrand = b.nameofbrand and a.nameoffactory = b.nameoffactory) c

-- carmodel表一次性插入记录
insert into carmodel (series_id,nameofmodel,nameOfSales,descOfGearBox,descOfMotor,chezudaima,year) 
select c.id seriesid,d.nameofmodel,d.nameOfSales,d.descOfGearBox,d.descOfMotor,d.chezudaima,d.year from carseries c inner join (
select  distinct b.nameofbrand,b.nameOfFactory,b.nameOfSeries,b.nameofmodel,b.nameOfSales,b.chezudaima,b.descOfGearBox,b.descOfMotor,b.year ,a.id brandid 
from carbrand a inner join car_model_all b on a.nameoffactory = b.nameOfFactory and a.nameofbrand = b.nameOfBrand 
order by nameofbrand,nameOfFactory,nameofseries,chezudaima,year,descofgearbox
) d on c.brandid = d.brandid and c.nameofseries = d.nameofseries 
order by seriesid,nameofmodel,year,chezudaima,nameOfSales,descOfGearBox 