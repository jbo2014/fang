-- CREATE DATABASE fang;

-- Table

CREATE TABLE IF NOT EXISTS school(
	Id serial  NOT NULL PRIMARY KEY,
	Name        varchar(100),
	Address     varchar(100),
	Region      varchar(10),
	Slice  		int ,
	Tags        varchar(200),
	Estate      int,
	PriceFrom   int,
	PriceTo     int,
	NumberOfSet int,
	UrlOfSchool varchar(100),
	UrlOfOrigin varchar(500)
);
COMMENT on column school.Id          is '数据主键';
COMMENT on column school.Name        is '学校名称';
COMMENT on column school.Address     is '学校地址';
COMMENT on column school.Region      is '区县';
COMMENT on column school.Slice 		 is '第N学区';
COMMENT on column school.Tags        is '标签';
COMMENT on column school.Estate      is '对应小区个数';
COMMENT on column school.PriceFrom   is '价格最低';
COMMENT on column school.PriceTo     is '价格最高';
COMMENT on column school.NumberOfSet is '房源套数';
COMMENT on column school.UrlOfSchool is '学校详情URL';
COMMENT on column school.UrlOfOrigin is '房源列表URL';

CREATE TABLE IF NOT EXISTS code(
	Id 			serial  NOT NULL PRIMARY KEY,
	Site     	varchar(10),
	Code      	varchar(50),
	Type    	varchar(10),
	RefId    	varchar(50)
);
COMMENT on column code.Id       is '主键';
COMMENT on column code.Site     is '网站';
COMMENT on column code.Code     is '网站代码';
COMMENT on column code.Type		is '类型';
COMMENT on column code.RefId	is '引用Id';

CREATE TABLE IF NOT EXISTS house(
	Code varchar(30),
	Title       varchar(200),
	Region      varchar(10),
	Address     varchar(200),
	Estate      varchar(100),
	Year        int,
	FloorTotal  int,
	FloorLoc    varchar(10),
	HouseDirect varchar(10),
	Hall        int,
	Room        int,
	Area        int,
	School      varchar(100),
	PriceTotal  int,
	PriceSQM    int,
	Tags         varchar(200),
	UrlOfHouse  varchar(100),
	UrlOfMainImg varchar(200),
	Source       varchar(10),
	CreateAt     timestamp ,
   PRIMARY KEY ( Code )
);
COMMENT on column house.Code   		is '网站代码';
COMMENT on column house.Title       is '标题';
COMMENT on column house.Region      is '区县';
COMMENT on column house.Address     is '地址';
COMMENT on column house.Estate      is '所属小区';
COMMENT on column house.Year         is '建筑年份';
COMMENT on column house.FloorTotal  is '楼层总数';
COMMENT on column house.FloorLoc     is '楼层位置';
COMMENT on column house.HouseDirect is '房子朝向';
COMMENT on column house.Hall        is '厅';
COMMENT on column house.Room        is '室';
COMMENT on column house.Area        is '面积';
COMMENT on column house.School       is '学校名称';
COMMENT on column house.PriceTotal  is '总价';
COMMENT on column house.PriceSQM     is '每平米价格';
COMMENT on column house.Tags           is '标签';
COMMENT on column house.UrlOfHouse   is '房子详情页URL';
COMMENT on column house.UrlOfMainImg is '主图URL';
COMMENT on column house.Source         is '数据来源';
COMMENT on column house.CreateAt       is '插入时间';


CREATE TABLE IF NOT EXISTS region(
	Code        varchar(30),
	Name        varchar(10),
	NumOfSlice  int,
   PRIMARY KEY (Code)
);
comment on column region.Code is 'URL代码';
comment on column region.Name is '区名';
comment on column region.NumOfSlice is '学区片个数';


CREATE TABLE IF NOT EXISTS high(
	Id serial NOT NULL PRIMARY KEY,
	Region        varchar(10),
	Slice  int,
	Name varchar(100),
	Tags varchar(500)
);
comment on column high_school.Id is '自增主键';
comment on column high_school.Region is '区名';
comment on column high_school.Slice is '第N学区';
comment on column high_school.Name is '中学名称';
comment on column high_school.Tags is '标签';


CREATE TABLE IF NOT EXISTS scope(
	Id serial  NOT NULL PRIMARY KEY,
	Region varchar(10),
	Slice  int,
	School   varchar(100),
	RC     varchar(50),
	Estate varchar(50),
	Other  varchar(100),
	Url varchar(100)
);
comment on column scope.Id is '自增主键';
comment on column scope.Region is '区名';
comment on column scope.Slice is '片';
comment on column scope.School is '学校名称';
comment on column scope.RC is '居委会';
comment on column scope.Estate is '小区名称';
comment on column scope.Other is '道、路、胡同、楼起止号码';
comment on column scope.Url is 'ke.com小区房源列表';



-- DATA


-- 天津各区 code为fang.com网页代码
insert into region (name, code, NumOfSlice) values ('和平', 'school-a037', 3);
insert into region (name, code, NumOfSlice) values ('河东', 'school-a042', 4);
insert into region (name, code, NumOfSlice) values ('河西', 'school-a043',3);
insert into region (name, code, NumOfSlice) values ('南开', 'school-a041',3);
insert into region (name, code, NumOfSlice) values ('河北', 'school-a044',3);
insert into region (name, code, NumOfSlice) values ('红桥', 'school-a046',3);
insert into region (name, code, NumOfSlice) values ('东丽', 'school-a049', 0);
insert into region (name, code, NumOfSlice) values ('西青', 'school-a038',0);
insert into region (name, code, NumOfSlice) values ('津南', 'school-a045',0);
insert into region (name, code, NumOfSlice) values ('北辰', 'school-a039',0);
insert into region (name, code, NumOfSlice) values ('滨海新区', 'school-a010383',0);
insert into region (name, code, NumOfSlice) values ('武清', 'school-a052',0);
insert into region (name, code, NumOfSlice) values ('宝坻', 'school-a0615',0);
insert into region (name, code, NumOfSlice) values ('蓟州', 'school-a051',0);
insert into region (name, code, NumOfSlice) values ('宁河', 'school-a053',0);
insert into region (name, code, NumOfSlice) values ('静海', 'school-a054',0);
insert into region (name, code, NumOfSlice) values ('Other', 'school',0);


-- 各区对应中学
insert into high (Region, Slice, name, tags) values ('和平', 2, '一中', null);
insert into high (Region, Slice, name, tags) values ('和平', 2, '五十五中', null);
insert into high (Region, Slice, name, tags) values ('和平', 2, '和平艺术中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 2, '九十中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 1, '耀华中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 1, '二南开中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 1, '汇文中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 1, '十九中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 3, '二十中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 3, '二十一中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 3, '十一中学', null);
insert into high (Region, Slice, name, tags) values ('和平', 3, '六十一中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 1, '新华中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 1, '海河中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 1, '卓群中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 1, '佟楼中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 2, '实验中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 2, '四十一中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 2, '滨湖中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 2, '环湖中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 2, '梅江中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 2, '梧桐中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 3, '第四中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 3, '四十二中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 3, '北京师范大学天津附属中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 3, '微山路中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 3, '枫林路中学', null);
insert into high (Region, Slice, name, tags) values ('河西', 3, '双水道中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 2, '天大附中', null);
insert into high (Region, Slice, name, tags) values ('南开', 2, '南大附中', null);
insert into high (Region, Slice, name, tags) values ('南开', 2, '天津师范大学南开附属中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 2, '六十三中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '南开中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '二十五中学（青年路）', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '崇化中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '崇化中学（临潼路）', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '四十三中', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '五十中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '育红中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 1, '南开外国语中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 3, '天津中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 3, '第九中学', null);
insert into high (Region, Slice, name, tags) values ('南开', 3, '南开实验学校', null);


-- 各片区小学
insert into school (Code,Name,Address,Region,Slice,Tags,Estate,PriceFrom,PriceTo,NumberOfSet,UrlOfSchool,UrlOfOrigin) values 
('6059','开发区第二小学','位于北海路与泰祥路间第五大街98号','ALL',null,'区重点,专业学科类,',8,15850,21801,169,'/school/6059.htm','/xuequfang/kw%BF%AA%B7%A2%C7%F8%B5%DA%B6%FE%D0%A1%D1%A7/'),
('6685','天津开发区第一小学','滨海新区第三大街37号(近南海路)','ALL',null,'区重点,体育类,',19,19194,27329,191,'/school/6685.htm','/xuequfang/kw%CC%EC%BD%F2%BF%AA%B7%A2%C7%F8%B5%DA%D2%BB%D0%A1%D1%A7/'),
('6707','天津泰达实验学校','天津市滨海新区开发区发达街99号','ALL',null,'普通,外语类,体育类,',24,15673,33333,400,'/school/6707.htm','/xuequfang/kw%CC%EC%BD%F2%CC%A9%B4%EF%CA%B5%D1%E9%D1%A7%D0%A3/'),
('6749','天津开发区国际学校','晓园街9号','ALL',null,'区重点,外语类,',40,14639,41630,157,'/school/6749.htm','/xuequfang/kw%CC%EC%BD%F2%BF%AA%B7%A2%C7%F8%B9%FA%BC%CA%D1%A7%D0%A3/'),
('6768','天津外国语大学附属滨海外国语学校小学部一部','天津滨海新区中新天津生态城和惠路与和畅路交口','ALL',null,'区重点,外语类,',14,13452,23236,266,'/school/6768.htm','/xuequfang/kw%CC%EC%BD%F2%CD%E2%B9%FA%D3%EF%B4%F3%D1%A7%B8%BD%CA%F4%B1%F5%BA%A3%CD%E2%B9%FA%D3%EF%D1%A7%D0%A3%D0%A1%D1%A7%B2%BF%D2%BB%B2%BF/'),
('6835','塘沽区云山道小学','天津市滨海新区云山道与厦门路交口东北侧','ALL',null,'普通,科技类,',6,12376,17514,147,'/school/6835.htm','/xuequfang/kw%CC%C1%B9%C1%C7%F8%D4%C6%C9%BD%B5%C0%D0%A1%D1%A7/'),
('717','塘沽区浙江路小学','塘沽区上海道2461号','ALL',null,'区重点,艺术类,',5,24394,28871,62,'/school/717.htm','/xuequfang/kw%CC%C1%B9%C1%C7%F8%D5%E3%BD%AD%C2%B7%D0%A1%D1%A7/'),
('718','塘沽第一中心小学','塘沽区文化街3号','ALL',null,'区重点,体育类,艺术类,',11,13922,35370,22,'/school/718.htm','/xuequfang/kw%CC%C1%B9%C1%B5%DA%D2%BB%D6%D0%D0%C4%D0%A1%D1%A7/'),
('719','天津市塘沽区向阳第一小学','塘沽区向阳南街10号','ALL',null,'普通,艺术类,',17,11481,18062,35,'/school/719.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%CF%F2%D1%F4%B5%DA%D2%BB%D0%A1%D1%A7/'),
('720','天津市塘沽区草场街小学','塘沽区草场街204号','ALL',null,'区重点,外语类,艺术类,',14,15447,21323,17,'/school/720.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%B2%DD%B3%A1%BD%D6%D0%A1%D1%A7/'),
('721','渤海石油第一小学','塘沽区河滨路28号','ALL',null,'普通,艺术类,',3,10837,11882,5,'/school/721.htm','/xuequfang/kw%B2%B3%BA%A3%CA%AF%D3%CD%B5%DA%D2%BB%D0%A1%D1%A7/'),
('722','塘沽实验学校','塘沽区营口道1421号','ALL',null,'区重点,外语类,体育类,艺术类,',9,17266,27097,128,'/school/722.htm','/xuequfang/kw%CC%C1%B9%C1%CA%B5%D1%E9%D1%A7%D0%A3/'),
('723','塘沽区上海道小学','塘沽区江苏路593号','ALL',null,'区重点,体育类,科技类,',7,16276,22744,55,'/school/723.htm','/xuequfang/kw%CC%C1%B9%C1%C7%F8%C9%CF%BA%A3%B5%C0%D0%A1%D1%A7/'),
('724','塘沽区广州道小学','塘沽区广州道61号','ALL',null,'普通,艺术类,',5,12062,14491,21,'/school/724.htm','/xuequfang/kw%CC%C1%B9%C1%C7%F8%B9%E3%D6%DD%B5%C0%D0%A1%D1%A7/'),
('725','天津市塘沽区胡家园小学','塘沽区于庄子路8号','ALL',null,'普通,专业学科类,',6,9240,11339,14,'/school/725.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%BA%FA%BC%D2%D4%B0%D0%A1%D1%A7/'),
('726','天津市塘沽区博才小学','塘沽区赵新路6号','ALL',null,'普通,专业学科类,',20,10589,14995,66,'/school/726.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%B2%A9%B2%C5%D0%A1%D1%A7/'),
('7264','天津外国语大学附属滨海外国语学校小学部二部','中新生态城和韵路1457号','ALL',null,'区重点,外语类,',9,14731,20109,245,'/school/7264.htm','/xuequfang/kw%CC%EC%BD%F2%CD%E2%B9%FA%D3%EF%B4%F3%D1%A7%B8%BD%CA%F4%B1%F5%BA%A3%CD%E2%B9%FA%D3%EF%D1%A7%D0%A3%D0%A1%D1%A7%B2%BF%B6%FE%B2%BF/'),
('727','天津市塘沽区朝阳小学','塘沽区春风路431号','ALL',null,'普通,艺术类,',13,11919,16965,117,'/school/727.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%B3%AF%D1%F4%D0%A1%D1%A7/'),
('7277','滨海新区大港福源小学','大港港东新城海景九路436号','ALL',null,'普通,专业学科类,',18,11045,14341,8,'/school/7277.htm','/xuequfang/kw%B1%F5%BA%A3%D0%C2%C7%F8%B4%F3%B8%DB%B8%A3%D4%B4%D0%A1%D1%A7/'),
('728','塘沽区大梁子小学','塘沽区大梁子街振教路与金光路交口','ALL',null,'普通,体育类,科技类,',5,10239,12060,0,'/school/728.htm','/xuequfang/kw%CC%C1%B9%C1%C7%F8%B4%F3%C1%BA%D7%D3%D0%A1%D1%A7/'),
('729','天津市塘沽区大庆道小学','塘沽区福建北路1889号','ALL',null,'普通,体育类,专业学科类,',7,11968,17790,30,'/school/729.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%B4%F3%C7%EC%B5%C0%D0%A1%D1%A7/'),
('730','塘沽区二中心小学','塘沽区山东路13号','ALL',null,'区重点,体育类,',19,14026,23439,85,'/school/730.htm','/xuequfang/kw%CC%C1%B9%C1%C7%F8%B6%FE%D6%D0%D0%C4%D0%A1%D1%A7/'),
('731','天津市塘沽区工农村小学','塘沽区河北路49号','ALL',null,'普通,专业学科类,',19,10387,15420,164,'/school/731.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%B9%A4%C5%A9%B4%E5%D0%A1%D1%A7/'),
('732','天津市塘沽区桂林路小学','塘沽区广州道桂林路2号','ALL',null,'普通,体育类,科技类,艺术类,',16,8595,14580,42,'/school/732.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%B9%F0%C1%D6%C2%B7%D0%A1%D1%A7/'),
('733','天津市塘沽区岷江里小学','天津市塘沽区广州道秀水街3号','ALL',null,'普通,艺术类,专业学科类,',7,12060,13927,50,'/school/733.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%E1%BA%BD%AD%C0%EF%D0%A1%D1%A7/'),
('734','天津市塘沽区宁波里小学','天津市塘沽区福建路773号','ALL',null,'普通,科技类,艺术类,',8,12341,20476,20,'/school/734.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%C4%FE%B2%A8%C0%EF%D0%A1%D1%A7/'),
('735','天津市塘沽区盐场小学','天津市塘沽区万年桥北路1716号','ALL',null,'普通,艺术类,',4,11563,16743,12,'/school/735.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%D1%CE%B3%A1%D0%A1%D1%A7/'),
('736','向阳第三小学','塘沽区吉林路6号','ALL',null,'普通,体育类,艺术类,',17,11862,15742,58,'/school/736.htm','/xuequfang/kw%CF%F2%D1%F4%B5%DA%C8%FD%D0%A1%D1%A7/'),
('737','滨海新区塘沽新港第二小学','天津市塘沽区新港海滨路164号','ALL',null,'普通,科技类,艺术类,',12,11438,17117,26,'/school/737.htm','/xuequfang/kw%B1%F5%BA%A3%D0%C2%C7%F8%CC%C1%B9%C1%D0%C2%B8%DB%B5%DA%B6%FE%D0%A1%D1%A7/'),
('738','新港第四小学','天津市塘沽区新港北仑里11号','ALL',null,'普通,体育类,艺术类,专业学科类,',11,10676,13396,21,'/school/738.htm','/xuequfang/kw%D0%C2%B8%DB%B5%DA%CB%C4%D0%A1%D1%A7/'),
('739','天津市塘沽区馨桥园小学','天津市塘沽区胡家园街六道沟村','ALL',null,'普通,艺术类,',2,5834,9456,0,'/school/739.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CC%C1%B9%C1%C7%F8%DC%B0%C7%C5%D4%B0%D0%A1%D1%A7/'),
('740','塘沽区徐州道小学','天津市塘沽区新河街湘江里增3号','ALL',null,'普通,艺术类,',6,9535,15688,3,'/school/740.htm','/xuequfang/kw%CC%C1%B9%C1%C7%F8%D0%EC%D6%DD%B5%C0%D0%A1%D1%A7/'),
('7266','天津保税区空港学校','空港经济区东六道39号,中环东路与东六道交口处','东丽',null,'普通,专业学科类,',6,18913,21842,73,'/school/7266.htm','/xuequfang/kw%CC%EC%BD%F2%B1%A3%CB%B0%C7%F8%BF%D5%B8%DB%D1%A7%D0%A3/'),
('741','振华里中心小学','津塘公路233号','东丽',null,'普通,体育类,艺术类,',4,13674,21459,2,'/school/741.htm','/xuequfang/kw%D5%F1%BB%AA%C0%EF%D6%D0%D0%C4%D0%A1%D1%A7/'),
('743','天津市东丽区新中村小学','京津塘高速公路与秀屿道交口','东丽',null,'普通,专业学科类,',4,15554,17788,22,'/school/743.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B6%AB%C0%F6%C7%F8%D0%C2%D6%D0%B4%E5%D0%A1%D1%A7/'),
('744','新立村中心小学','天津市东丽区驯海路幸福道40号','东丽',null,'普通,科技类,艺术类,专业学科类,',3,12267,15928,7,'/school/744.htm','/xuequfang/kw%D0%C2%C1%A2%B4%E5%D6%D0%D0%C4%D0%A1%D1%A7/'),
('745','天津市潘庄中心小学','天津市东丽区电传路与先锋路交口附近','东丽',null,'普通,专业学科类,',3,16010,39186,0,'/school/745.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C5%CB%D7%AF%D6%D0%D0%C4%D0%A1%D1%A7/'),
('746','东丽区实验小学','天津市东丽区先锋路23号','东丽',null,'区重点,体育类,',9,13674,23344,1,'/school/746.htm','/xuequfang/kw%B6%AB%C0%F6%C7%F8%CA%B5%D1%E9%D0%A1%D1%A7/'),
('747','天津市东丽区津门小学','天津市东丽区栖霞道南侧附近','东丽',null,'普通,艺术类,',10,15899,22547,15,'/school/747.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B6%AB%C0%F6%C7%F8%BD%F2%C3%C5%D0%A1%D1%A7/'),
('748','天津市东丽区丽泽小学','东丽区丰年村街富安路','东丽',null,'普通,体育类,艺术类,',5,12934,16409,1,'/school/748.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B6%AB%C0%F6%C7%F8%C0%F6%D4%F3%D0%A1%D1%A7/'),
('749','张贵庄小学','天津市东丽区新立街张贵庄村','东丽',null,'普通,专业学科类,',2,11723,16556,27,'/school/749.htm','/xuequfang/kw%D5%C5%B9%F3%D7%AF%D0%A1%D1%A7/'),
('6783','辰昌路小学','辰昌路与龙岩道交口向南80米路东','北辰',null,'普通,科技类,',17,11759,27557,29,'/school/6783.htm','/xuequfang/kw%B3%BD%B2%FD%C2%B7%D0%A1%D1%A7/'),
('6839','天津市北辰区华辰学校','天津市北辰区北仓镇北仓村北侧(京津路517号)','北辰',null,'普通,小班教学,体育类,',6,19123,24817,84,'/school/6839.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B1%B1%B3%BD%C7%F8%BB%AA%B3%BD%D1%A7%D0%A3/'),
('765','天津市北辰区北仓小学','天津市北辰区延吉道11号','北辰',null,'普通,专业学科类,',9,12014,14732,45,'/school/765.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B1%B1%B3%BD%C7%F8%B1%B1%B2%D6%D0%A1%D1%A7/'),
('766','天津市北辰区模范小学','天津市北辰区双街镇双街村口','北辰',null,'普通,艺术类,',4,9214,12927,35,'/school/766.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B1%B1%B3%BD%C7%F8%C4%A3%B7%B6%D0%A1%D1%A7/'),
('767','北辰区实验小学','北辰区新村街果园北道11号','北辰',null,'区重点,专业学科类,',8,13828,19032,117,'/school/767.htm','/xuequfang/kw%B1%B1%B3%BD%C7%F8%CA%B5%D1%E9%D0%A1%D1%A7/'),
('768','集贤里小学','天津市北辰区安达路2号','北辰',null,'普通,艺术类,',8,11734,14129,11,'/school/768.htm','/xuequfang/kw%BC%AF%CF%CD%C0%EF%D0%A1%D1%A7/'),
('769','柳滩小学','天津市北辰区京津公路邯郸道6号','北辰',null,'普通,专业学科类,',1,14768,14768,1,'/school/769.htm','/xuequfang/kw%C1%F8%CC%B2%D0%A1%D1%A7/'),
('770','南仓小学','天津市北辰区南仓村','北辰',null,'普通,科技类,艺术类,专业学科类,',3,13110,14923,41,'/school/770.htm','/xuequfang/kw%C4%CF%B2%D6%D0%A1%D1%A7/'),
('771','青光小学','天津市北辰区青光村','北辰',null,'普通,体育类,专业学科类,',2,5352,12027,0,'/school/771.htm','/xuequfang/kw%C7%E0%B9%E2%D0%A1%D1%A7/'),
('772','天津市北辰区瑞景小学','天津市北辰区辰达路西侧','北辰',null,'普通,艺术类,',14,12152,21919,54,'/school/772.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B1%B1%B3%BD%C7%F8%C8%F0%BE%B0%D0%A1%D1%A7/'),
('773','苍园小学','新村街果园南道城建北路','北辰',null,'普通,艺术类,',6,14203,17107,129,'/school/773.htm','/xuequfang/kw%B2%D4%D4%B0%D0%A1%D1%A7/'),
('774','宜兴埠第三小学','天津市北辰区宜兴埠宜梦路','北辰',null,'普通,体育类,艺术类,',5,11949,22298,8,'/school/774.htm','/xuequfang/kw%D2%CB%D0%CB%B2%BA%B5%DA%C8%FD%D0%A1%D1%A7/'),
('775','天穆小学','天津市北辰区京津公路270号','北辰',null,'普通,艺术类,',9,12437,25020,36,'/school/775.htm','/xuequfang/kw%CC%EC%C4%C2%D0%A1%D1%A7/'),
('776','小淀小学','天津市北辰区小淀镇小淀村南','北辰',null,'普通,体育类,艺术类,',3,10763,13234,0,'/school/776.htm','/xuequfang/kw%D0%A1%B5%ED%D0%A1%D1%A7/'),
('777','王庄小学','天津市北辰区天穆镇王庄村','北辰',null,'普通,专业学科类,',6,12140,20305,16,'/school/777.htm','/xuequfang/kw%CD%F5%D7%AF%D0%A1%D1%A7/'),
('778','天津市北辰区引河里小学','天津市北辰区引河里小区内','北辰',null,'普通,专业学科类,',7,12343,15421,12,'/school/778.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B1%B1%B3%BD%C7%F8%D2%FD%BA%D3%C0%EF%D0%A1%D1%A7/'),
('779','宜兴埠第一小学','天津市津围公路114号','北辰',null,'普通,专业学科类,',8,10660,22298,41,'/school/779.htm','/xuequfang/kw%D2%CB%D0%CB%B2%BA%B5%DA%D2%BB%D0%A1%D1%A7/'),
-- 南开
('9001','天津市南开区勤敏小学',null,'南开',3,null,null,null,null,null,null,null),
('9002','天津市南开区华苑小学',null,'南开',3,null,null,null,null,null,null,null),
('161','南开区科技实验小学','天津市南开区汾水道41号','南开',1,'普通,科技类,',13,22963,34234,82,'/school/161.htm','/xuequfang/kw%C4%CF%BF%AA%C7%F8%BF%C6%BC%BC%CA%B5%D1%E9%D0%A1%D1%A7/'),
('162','南开区阳光小学','天津市南开区红旗南路阳光100国际新城南园2号楼','南开',3,'普通,科技类,艺术类,专业学科类,',10,18236,31908,188,'/school/162.htm','/xuequfang/kw%C4%CF%BF%AA%C7%F8%D1%F4%B9%E2%D0%A1%D1%A7/'),
('163','南开区新星小学','天津市和平区新兴路48号','南开',3,'普通,艺术类,',21,20145,29621,298,'/school/163.htm','/xuequfang/kw%C4%CF%BF%AA%C7%F8%D0%C2%D0%C7%D0%A1%D1%A7/'),
('164','南开区咸阳路小学','天津市南开区汾水道39号','南开',1,'普通,专业学科类,',9,27048,34002,113,'/school/164.htm','/xuequfang/kw%C4%CF%BF%AA%C7%F8%CF%CC%D1%F4%C2%B7%D0%A1%D1%A7/'),
('165','天津市南开区西营门外小学','天津市南开区临汾路5号','南开',1,'普通,小班教学,艺术类,',21,17360,42565,294,'/school/165.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%CE%F7%D3%AA%C3%C5%CD%E2%D0%A1%D1%A7/'),
('166','南开区卧龙里小学','天津市南开区西湖道卧龙里南里平房1号','南开',null,'普通,专业学科类,',11,24837,33299,221,'/school/166.htm','/xuequfang/kw%C4%CF%BF%AA%C7%F8%CE%D4%C1%FA%C0%EF%D0%A1%D1%A7/'),
('167','天津大学附属小学','天津大学院内','南开',2,'区重点,名校附属,',5,32502,39264,71,'/school/167.htm','/xuequfang/kw%CC%EC%BD%F2%B4%F3%D1%A7%B8%BD%CA%F4%D0%A1%D1%A7/'),
('168','天津市南开区水上小学','南开区红旗南路凌庄子道129号','南开',3,'普通,体育类,艺术类,',48,14234,43217,651,'/school/168.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%CB%AE%C9%CF%D0%A1%D1%A7/'),
('169','天津市南开区前园小学','天津市南开区密云路锦园里楼群内','南开',1,'普通,体育类,艺术类,',9,19532,36753,102,'/school/169.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%C7%B0%D4%B0%D0%A1%D1%A7/'),
('170','南开小学','天津市南开区白堤路81号','南开',2,'区重点,体育类,',23,21804,40541,403,'/school/170.htm','/xuequfang/kw%C4%CF%BF%AA%D0%A1%D1%A7/'),
('171','天津师范大学南开附属小学','天津市南开区雅安道116号','南开',2,'普通,艺术类,',14,21392,28239,332,'/school/171.htm','/xuequfang/kw%CC%EC%BD%F2%CA%A6%B7%B6%B4%F3%D1%A7%C4%CF%BF%AA%B8%BD%CA%F4%D0%A1%D1%A7/'),
('173','天津市南开区建民里小学','天津市南开区黄河道冶金路4号','南开',null,'普通,科技类,艺术类,专业学科类,',6,24601,34649,37,'/school/173.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%BD%A8%C3%F1%C0%EF%D0%A1%D1%A7/'),
('174','天津市南开区华宁道小学','南开区天拖南横江里6号','南开',null,'普通,艺术类,',10,20954,28829,153,'/school/174.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%BB%AA%C4%FE%B5%C0%D0%A1%D1%A7/'),
('175','天津市南开区鸿源里小学','天津市南开区二马路61号','南开',null,'普通,专业学科类,',34,17820,41930,184,'/school/175.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%BA%E8%D4%B4%C0%EF%D0%A1%D1%A7/'),
('176','天津市南开区风湖里小学','天津市南开区鞍山西道柳荫路湖波道16号','南开',2,'普通,科技类,专业学科类,',13,14972,33538,185,'/school/176.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%B7%E7%BA%FE%C0%EF%D0%A1%D1%A7/'),
('177','天津市南开区汾水道小学','天津市南开区黄河道立新路8号','南开',1,'普通,体育类,艺术类,',12,21535,34649,89,'/school/177.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%B7%DA%CB%AE%B5%C0%D0%A1%D1%A7/'),
('178','天津市南开区川府里小学','天津市南开区川府新村温江路2号','南开',2,'普通,体育类,艺术类,',30,16502,32563,476,'/school/178.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%B4%A8%B8%AE%C0%EF%D0%A1%D1%A7/'),
('179','天津市南开区长治里小学','天津市南开区长江道长治里楼群内','南开',2,'普通,外语类,艺术类,',18,23649,46439,275,'/school/179.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%B3%A4%D6%CE%C0%EF%D0%A1%D1%A7/'),
('180','天津市南开区第二中心小学','天津市南开区红日路1号','南开',1,'普通,艺术类,专业学科类,',20,18495,36979,121,'/school/180.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%B5%DA%B6%FE%D6%D0%D0%C4%D0%A1%D1%A7/'),
('181','天津市南开区宜宾里小学','天津市南开区嘉陵道通江路9号','南开',2,'普通,体育类,专业学科类,',19,21927,34001,372,'/school/181.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%D2%CB%B1%F6%C0%EF%D0%A1%D1%A7/'),
('182','天津市南开区义兴里小学','天津市南开区南丰路义兴里140号','南开',2,'普通,艺术类,专业学科类,',15,25532,33585,251,'/school/182.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%D2%E5%D0%CB%C0%EF%D0%A1%D1%A7/'),
('183','天津市南开区艺术小学','天津市南开区黄河道闻喜里2号','南开',1,'普通,艺术类,',22,22335,38529,169,'/school/183.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%D2%D5%CA%F5%D0%A1%D1%A7/'),
('184','天津市南开区永基小学','天津市南开区南大道33号','南开',1,'普通,艺术类,',8,25493,33405,187,'/school/184.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%D3%C0%BB%F9%D0%A1%D1%A7/'),
('185','天津市南开区跃升里小学','天津市南开区西横堤跃升里市场内','南开',1,'普通,体育类,',9,16267,19729,40,'/school/185.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%D4%BE%C9%FD%C0%EF%D0%A1%D1%A7/'),
('186','南开区中心小学','天津市南开区双峰道40号','南开',1,'市重点,艺术类,专业学科类,',54,27835,56697,934,'/school/186.htm','/xuequfang/kw%C4%CF%BF%AA%C7%F8%D6%D0%D0%C4%D0%A1%D1%A7/'),
('6733','天津南开实验学校','锦环道1号','南开',3,'区重点,外语类,',5,29434,32837,245,'/school/6733.htm','/xuequfang/kw%CC%EC%BD%F2%C4%CF%BF%AA%CA%B5%D1%E9%D1%A7%D0%A3/'),
('6834','天津市南开区华夏小学','天拖南楚雄道4号','南开',2,'普通,艺术类,',24,17689,32013,281,'/school/6834.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%BB%AA%CF%C4%D0%A1%D1%A7/'),
('77','天津市南开区五马路小学','天津市广开新街30号','南开',1,'市重点,科技类,',38,29344,58527,808,'/school/77.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%CE%E5%C2%ED%C2%B7%D0%A1%D1%A7/'),
('78','天津市南开区中营小学','天津市南开区北马路与城乡西路交口','南开',1,'市重点,艺术类,',17,32246,77675,414,'/school/78.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C4%CF%BF%AA%C7%F8%D6%D0%D3%AA%D0%A1%D1%A7/'),
('9013','天津市南开区中营瑞丽小学',null,'南开',2,null,null,null,null,null,null,null),
-- 和平
('1696','长沙路小学','天津市和平区体育馆街道成都道52号','和平',null,'普通,外语类,体育类,',8,8389,102237,85,'/school/1696.htm','/xuequfang/kw%B3%A4%C9%B3%C2%B7%D0%A1%D1%A7/'),
('1697','天津市和平区保定道小学','和平区保定道59号','和平',null,'普通,外语类,体育类,',4,8389,74129,46,'/school/1697.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%B1%A3%B6%A8%B5%C0%D0%A1%D1%A7/'),
('1700','天津市和平区成都道小学','天津市和平区成都道146号','和平',null,'普通,外语类,体育类,',4,47184,66247,47,'/school/1700.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%B3%C9%B6%BC%B5%C0%D0%A1%D1%A7/'),
('1704','天津市和平区海光寺小学','南营门街道新兴路9号','和平',null,'普通,外语类,体育类,',2,54949,58748,32,'/school/1704.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%BA%A3%B9%E2%CB%C2%D0%A1%D1%A7/'),
('1705','天津市和平区河北路小学','天津市和平区河北路209号','和平',null,'普通,外语类,',3,45367,74129,22,'/school/1705.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%BA%D3%B1%B1%C2%B7%D0%A1%D1%A7/'),
('214','天津市第二十中学附属小学','天津市和平区南京路86号','和平',3,'区重点,名校附属,专业学科类,',19,37999,117561,115,'/school/214.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%B5%DA%B6%FE%CA%AE%D6%D0%D1%A7%B8%BD%CA%F4%D0%A1%D1%A7/'),
('215','天津市和平区哈密道小学','天津市和平区哈密道80号','和平',1,'普通,体育类,',10,7878,64599,59,'/school/215.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%B9%FE%C3%DC%B5%C0%D0%A1%D1%A7/'),
('216','天津市和平区建物街小学','和平区山西路36号','和平',null,'普通,小班教学,专业学科类,',5,47807,75105,61,'/school/216.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%BD%A8%CE%EF%BD%D6%D0%A1%D1%A7/'),
('217','天津市和平区劝业场小学','天津市和平区河南路161号','和平',1,'普通,小班教学,专业学科类,',5,45367,74129,34,'/school/217.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%C8%B0%D2%B5%B3%A1%D0%A1%D1%A7/'),
('218','天津市四平东道小学','天津市和平区承德道30号','和平',3,'普通,艺术类,',6,37914,65346,25,'/school/218.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CB%C4%C6%BD%B6%AB%B5%C0%D0%A1%D1%A7/'),
('219','和平区新华南路小学','天津市和平区新华路257号','和平',3,'区重点,外语类,专业学科类,',6,51750,101179,37,'/school/219.htm','/xuequfang/kw%BA%CD%C6%BD%C7%F8%D0%C2%BB%AA%C4%CF%C2%B7%D0%A1%D1%A7/'),
('235','天津市和平区兴安路小学','天津市和平区荣吉大街12号','和平',null,'普通,艺术类,',2,77377,80523,74,'/school/235.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%D0%CB%B0%B2%C2%B7%D0%A1%D1%A7/'),
('236','天津市耀华小学','天津市和平区河北路203号','和平',1,'区重点,专业学科类,',11,47048,101179,91,'/school/236.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%D2%AB%BB%AA%D0%A1%D1%A7/'),
('237','和平区中心小学','天津市和平区西宁道8号','和平',2,'市重点,专业学科类,',28,40558,123749,544,'/school/237.htm','/xuequfang/kw%BA%CD%C6%BD%C7%F8%D6%D0%D0%C4%D0%A1%D1%A7/'),
('6787','天津市和平区新星小学','天津市和平区新兴路40号','和平',2,'普通,外语类,体育类,',12,40681,77252,259,'/school/6787.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%D0%C2%D0%C7%D0%A1%D1%A7/'),
('6788','天津市和平区西康路小学','西康路31号','和平',3,'普通,外语类,体育类,',43,32202,75249,384,'/school/6788.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%CD%C6%BD%C7%F8%CE%F7%BF%B5%C2%B7%D0%A1%D1%A7/'),
('74','天津市实验小学','天津市和平区柳州路28号','和平',2,'市重点,外语类,体育类,专业学科类,',8,51238,102237,90,'/school/74.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CA%B5%D1%E9%D0%A1%D1%A7/'),
('75','岳阳道小学','天津市和平区武昌路21号','和平',2,'市重点,科技类,',38,50385,123003,230,'/school/75.htm','/xuequfang/kw%D4%C0%D1%F4%B5%C0%D0%A1%D1%A7/'),
('76','昆明路小学','天津市和平区昆明路99号','和平',3,'市重点,科技类,艺术类,',29,51358,117561,239,'/school/76.htm','/xuequfang/kw%C0%A5%C3%F7%C2%B7%D0%A1%D1%A7/'),
('82','鞍山道小学','天津市和平区鞍山道81号','和平',1,'市重点,专业学科类,',16,45136,105313,133,'/school/82.htm','/xuequfang/kw%B0%B0%C9%BD%B5%C0%D0%A1%D1%A7/'),
('85','和平区万全小学','天津市和平区万全道96号','和平',1,'市重点,外语类,体育类,',24,29913,121594,438,'/school/85.htm','/xuequfang/kw%BA%CD%C6%BD%C7%F8%CD%F2%C8%AB%D0%A1%D1%A7/'),
('9005','和平区万全第二小学',null,'和平',1,null,null,null,null,null,null,null),
('9006','和平区第二南开学校小学部',null,'和平',1,null,null,null,null,null,null,null),
-- 河东
('144','天津市河东区六纬路小学','天津市河东六纬路157号','河东',2,'普通,艺术类,',31,17297,32752,132,'/school/144.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%C1%F9%CE%B3%C2%B7%D0%A1%D1%A7/'),
('145','缘诚小学','天津市河东区张贵庄路160号','河东',3,'普通,体育类,艺术类,',11,12050,31547,127,'/school/145.htm','/xuequfang/kw%D4%B5%B3%CF%D0%A1%D1%A7/'),
('146','天津市河东区中心东道小学','天津市河东区中山门中心南道31号','河东',1,'普通,体育类,',9,11654,19558,60,'/school/146.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%D6%D0%D0%C4%B6%AB%B5%C0%D0%A1%D1%A7/'),
('147','天津市河东区友爱道小学','天津市河东区广宁路46号','河东',1,'普通,科技类,艺术类,',9,16101,25838,57,'/school/147.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%D3%D1%B0%AE%B5%C0%D0%A1%D1%A7/'),
('148','天津市河东区益寿里小学','天津市河东区卫国道益寿东里4号','河东',4,'普通,艺术类,',21,14708,29668,189,'/school/148.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%D2%E6%CA%D9%C0%EF%D0%A1%D1%A7/'),
('149','务实小学','天津市河东区双东路6号','河东',null,'普通,艺术类,',8,9660,22881,97,'/school/149.htm','/xuequfang/kw%CE%F1%CA%B5%D0%A1%D1%A7/'),
('150','东兴小学','天津市河东区上杭路街道东兴路7号','河东',4,'普通,艺术类,专业学科类,',4,14727,18554,4,'/school/150.htm','/xuequfang/kw%B6%AB%D0%CB%D0%A1%D1%A7/'),
('151','天津市河东区嵩山道小学','天津市河东区天山东路与嵩山道交口','河东',4,'普通,艺术类,',8,15567,18468,5,'/school/151.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%E1%D4%C9%BD%B5%C0%D0%A1%D1%A7/'),
('152','天津市河东区松竹里小学','天津市河东区富民路72号','河东',1,'普通,体育类,艺术类,',14,9543,27376,100,'/school/152.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%CB%C9%D6%F1%C0%EF%D0%A1%D1%A7/'),
('153','天津市河东区丽苑小学','天津市河东区卫国道秀丽路4号','河东',4,'普通,科技类,',17,13999,25098,229,'/school/153.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%C0%F6%D4%B7%D0%A1%D1%A7/'),
('154','天津市河东区街坊小学','天津市河东区八纬北路1号','河东',2,'普通,艺术类,专业学科类,',13,17945,42033,87,'/school/154.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%BD%D6%B7%BB%D0%A1%D1%A7/'),
('155','天津市河东区互助道小学','天津市河东区中山门中心南道与中心西道交口','河东',1,'普通,体育类,艺术类,',14,14321,22476,95,'/school/155.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%BB%A5%D6%FA%B5%C0%D0%A1%D1%A7/'),
('156','河东区二中心小学','天津市河东区卫国道顺航路14号','河东',4,'普通,小班教学,',31,10668,28220,143,'/school/156.htm','/xuequfang/kw%BA%D3%B6%AB%C7%F8%B6%FE%D6%D0%D0%C4%D0%A1%D1%A7/'),
('157','河东区二号桥小学','天津市河东区二号桥电传路9号','河东',1,'普通,专业学科类,',15,11302,39186,32,'/school/157.htm','/xuequfang/kw%BA%D3%B6%AB%C7%F8%B6%FE%BA%C5%C7%C5%D0%A1%D1%A7/'),
('158','河东区前程小学','河东区华昌大街32号','河东',3,'普通,体育类,科技类,艺术类,',42,11047,30767,155,'/school/158.htm','/xuequfang/kw%BA%D3%B6%AB%C7%F8%C7%B0%B3%CC%D0%A1%D1%A7/'),
('159','天津市河东区常州道小学','天津市河东区靖江路14号','河东',4,'普通,科技类,艺术类,',11,16894,27875,61,'/school/159.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B6%AB%C7%F8%B3%A3%D6%DD%B5%C0%D0%A1%D1%A7/'),
('160','河东区大桥道小学','天津市河东区大桥道34号','河东',2,'普通,体育类,',12,16843,23772,71,'/school/160.htm','/xuequfang/kw%BA%D3%B6%AB%C7%F8%B4%F3%C7%C5%B5%C0%D0%A1%D1%A7/'),
('6840','河东区第二实验小学','东站后广场新环路与华兴道交口,福建大厦旁','河东',3,'普通,外语类,体育类,',28,12622,32126,179,'/school/6840.htm','/xuequfang/kw%BA%D3%B6%AB%C7%F8%B5%DA%B6%FE%CA%B5%D1%E9%D0%A1%D1%A7/'),
('86','河东区实验小学','天津市河东区韶山道36号','河东',null,'市重点,专业学科类,',18,17325,56550,99,'/school/86.htm','/xuequfang/kw%BA%D3%B6%AB%C7%F8%CA%B5%D1%E9%D0%A1%D1%A7/'),
('87','天津市盘山道小学','天津市河东区学堂大街83号','河东',4,'区重点,科技类,',6,16574,18574,10,'/school/87.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C5%CC%C9%BD%B5%C0%D0%A1%D1%A7/'),
('88','河东区第一中心小学','天津市河东区八纬路82号','河东',2,'区重点,体育类,艺术类,',54,9535,37121,250,'/school/88.htm','/xuequfang/kw%BA%D3%B6%AB%C7%F8%B5%DA%D2%BB%D6%D0%D0%C4%D0%A1%D1%A7/'),
('89','香山道小学','天津市河东区成林道香山一支路1号','河东',4,'区重点,体育类,',10,16684,22021,18,'/school/89.htm','/xuequfang/kw%CF%E3%C9%BD%B5%C0%D0%A1%D1%A7/'),
('9014','天津市河东区福东小学',null,'河东',1,null,null,null,null,null,null,null),
('9015','天津市河东区东局子学校小学部',null,'河东',3,null,null,null,null,null,null,null),
('9016','天津市河东区太阳城学校小学部',null,'河东',4,null,null,null,null,null,null,null),
('9017','天津市河东区行知小学',null,'河东',4,null,null,null,null,null,null,null),
('9018','天津市河东区凤凰小学',null,'河东',4,null,null,null,null,null,null,null),
-- 河北
('220','增产道小学','天津市河北区增产道24号','河北',3,'普通,外语类,体育类,专业学科类,',6,17336,27659,22,'/school/220.htm','/xuequfang/kw%D4%F6%B2%FA%B5%C0%D0%A1%D1%A7/'),
('221','天津市河北区兴华小学','天津市河北区宜洁路1号','河北',2,'普通,体育类,科技类,艺术类,',8,14659,17846,18,'/school/221.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%D0%CB%BB%AA%D0%A1%D1%A7/'),
('222','新开小学','天津市河北区月纬路21号','河北',1,'普通,科技类,艺术类,',27,18123,30687,180,'/school/222.htm','/xuequfang/kw%D0%C2%BF%AA%D0%A1%D1%A7/'),
('223','天津市河北区新程小学','天津市河北区建昌道铁工西里22号','河北',null,'普通,艺术类,',12,15720,20552,17,'/school/223.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%D0%C2%B3%CC%D0%A1%D1%A7/'),
('224','河北区五号路小学','河北区王串场五号路16号','河北',null,'普通,科技类,专业学科类,',2,16651,31869,10,'/school/224.htm','/xuequfang/kw%BA%D3%B1%B1%C7%F8%CE%E5%BA%C5%C2%B7%D0%A1%D1%A7/'),
('225','育婴里第二小学','天津市河北区天泰路席厂下坡2号','河北',2,'市重点,艺术类,',15,14553,22096,94,'/school/225.htm','/xuequfang/kw%D3%FD%D3%A4%C0%EF%B5%DA%B6%FE%D0%A1%D1%A7/'),
('226','河北区实验小学','天津市河北区金田道1号','河北',1,'区重点,外语类,艺术类,专业学科类,',36,12788,37478,353,'/school/226.htm','/xuequfang/kw%BA%D3%B1%B1%C7%F8%CA%B5%D1%E9%D0%A1%D1%A7/'),
('227','天津市河北区宁园小学','天津市河北区中纺前街36号','河北',3,'普通,艺术类,专业学科类,',3,17905,22032,15,'/school/227.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%C4%FE%D4%B0%D0%A1%D1%A7/'),
('228','河北区第二实验小学','天津市河北区红梅道200号','河北',2,'普通,科技类,艺术类,专业学科类,',24,14604,30841,131,'/school/228.htm','/xuequfang/kw%BA%D3%B1%B1%C7%F8%B5%DA%B6%FE%CA%B5%D1%E9%D0%A1%D1%A7/'),
('229','昆纬路第一小学','河北区金钟河东街7号','河北',1,'市重点,艺术类,专业学科类,',21,21459,43292,176,'/school/229.htm','/xuequfang/kw%C0%A5%CE%B3%C2%B7%B5%DA%D2%BB%D0%A1%D1%A7/'),
('230','天津市河北区开江道小学','河北区开江道与乌江路交口','河北',3,'普通,艺术类,',7,14981,18780,23,'/school/230.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%BF%AA%BD%AD%B5%C0%D0%A1%D1%A7/'),
('231','天津市河北区靖江路小学','天津市河北区幸福道15号','河北',3,'普通,外语类,',17,15551,25042,109,'/school/231.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%BE%B8%BD%AD%C2%B7%D0%A1%D1%A7/'),
('232','天津市河北区金沙江路小学','河北区靖江北路与金沙江路交口','河北',3,'普通,语文类,',4,15558,18147,10,'/school/232.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%BD%F0%C9%B3%BD%AD%C2%B7%D0%A1%D1%A7/'),
('233','天津市河北区黄纬路小学','天津市黄纬路抗震里24号','河北',null,'普通,专业学科类,',5,18727,24731,26,'/school/233.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%BB%C6%CE%B3%C2%B7%D0%A1%D1%A7/'),
('234','天津市河北区红星路小学','天津市河北区红星路92号','河北',3,'普通,艺术类,',11,16066,20824,65,'/school/234.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%BA%EC%D0%C7%C2%B7%D0%A1%D1%A7/'),
('6687','育婴里第三小学','河北区张兴庄大道曙光路6号','河北',null,'市重点,艺术类,',10,15271,30831,76,'/school/6687.htm','/xuequfang/kw%D3%FD%D3%A4%C0%EF%B5%DA%C8%FD%D0%A1%D1%A7/'),
('6782','扶轮小学','宇纬路4号','河北',1,'区重点,专业学科类,',48,12788,37478,428,'/school/6782.htm','/xuequfang/kw%B7%F6%C2%D6%D0%A1%D1%A7/'),
('6796','天津市河北区育贤小学','虹光路与迎贤道交口东100米','河北',2,'普通,体育类,艺术类,',18,14309,28909,143,'/school/6796.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%B1%B1%C7%F8%D3%FD%CF%CD%D0%A1%D1%A7/'),
('84','育婴里第一小学','天津市河北区元纬路113号','河北',2,'市重点,艺术类,',10,16666,41814,72,'/school/84.htm','/xuequfang/kw%D3%FD%D3%A4%C0%EF%B5%DA%D2%BB%D0%A1%D1%A7/'),
('9019','天津市河北区光明小学',null,'河北',3,null,null,null,null,null,null,null),
('9020','天津市河北区大江路小学',null,'河北',3,null,null,null,null,null,null,null),
('9021','天津市河北区红权小学',null,'河北',3,null,null,null,null,null,null,null),
('9022','天津市河北区月牙河小学',null,'河北',3,null,null,null,null,null,null,null),
('9023','育婴里第四小学',null,'河北',2,null,null,null,null,null,null,null),
('9031','天津外国语学校南普小学',null,'河北',2,null,null,null,null,null,null,null),
-- 河西
('9003','天津市河西区华江里小学',null,'河西',3,null,null,null,null,null,null,null),
('9004','天津市河西区梧桐小学',null,'河西',2,null,null,null,null,null,null,null),
('187','天津市河西区马场道小学','马场道崇仁里2号','河西',2,'区重点,寄宿制,外语类,体育类,',8,28670,42548,148,'/school/187.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%C2%ED%B3%A1%B5%C0%D0%A1%D1%A7/'),
('188','师大附小','天津市河西区平山道48号','河西',2,'市重点,名校附属,专业学科类,',10,26145,60393,47,'/school/188.htm','/xuequfang/kw%CA%A6%B4%F3%B8%BD%D0%A1/'),
('189','天津师范大学第二附属小学南楼校区','天津市河西区隆昌路5号','河西',3,'市重点,名校附属,专业学科类,',19,19127,65127,260,'/school/189.htm','/xuequfang/kw%CC%EC%BD%F2%CA%A6%B7%B6%B4%F3%D1%A7%B5%DA%B6%FE%B8%BD%CA%F4%D0%A1%D1%A7%C4%CF%C2%A5%D0%A3%C7%F8/'),
('190','台湾路小学','天津市河西区台湾路1号','河西',1,'区重点,专业学科类,',3,40112,86968,45,'/school/190.htm','/xuequfang/kw%CC%A8%CD%E5%C2%B7%D0%A1%D1%A7/'),
('191','天津市河西区滨湖小学','天津市河西区环湖北道6号','河西',2,'普通,艺术类,',11,18666,33107,94,'/school/191.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%B1%F5%BA%FE%D0%A1%D1%A7/'),
('192','天津市河西区东楼小学','河西区挂甲寺街景兴里6号增1号','河西',1,'普通,体育类,艺术类,',26,12103,58706,425,'/school/192.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%B6%AB%C2%A5%D0%A1%D1%A7/'),
('193','河西中心小学东湖校区','天津市河西区环湖东路20号','河西',2,'市重点,专业学科类,',19,21659,32745,80,'/school/193.htm','/xuequfang/kw%BA%D3%CE%F7%D6%D0%D0%C4%D0%A1%D1%A7%B6%AB%BA%FE%D0%A3%C7%F8/'),
('194','天津市河西区东海里小学','天津市河西区小海地茂名道1号','河西',3,'普通,专业学科类,',21,19010,26753,152,'/school/194.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%B6%AB%BA%A3%C0%EF%D0%A1%D1%A7/'),
('195','天津市河西区恩德里小学','天津市河西区越秀路2号','河西',1,'普通,专业学科类,',15,29618,48058,321,'/school/195.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%B6%F7%B5%C2%C0%EF%D0%A1%D1%A7/'),
('197','灰堆第一小学','天津市河西区灰堆南北大街一号','河西',3,'普通,艺术类,',11,18522,43308,54,'/school/197.htm','/xuequfang/kw%BB%D2%B6%D1%B5%DA%D2%BB%D0%A1%D1%A7/'),
('198','天津市河西区尖山小学','天津市河西区尖山红光里平房7号','河西',null,'普通,艺术类,',5,13615,35607,5,'/school/198.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%BC%E2%C9%BD%D0%A1%D1%A7/'),
('199','天津市河西区澧水道小学','天津市河西区澧水道15号','河西',null,'普通,专业学科类,',5,29530,31668,11,'/school/199.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%E5%A2%CB%AE%B5%C0%D0%A1%D1%A7/'),
('200','天津市河西区陵水道小学','天津市河西区小海地泰山里34号','河西',3,'普通,专业学科类,',3,23526,26975,17,'/school/200.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%C1%EA%CB%AE%B5%C0%D0%A1%D1%A7/'),
('201','天津市河西区南湖小学','天津市河西区体院南环湖中路富有道1号','河西',2,'普通,专业学科类,',16,16243,41000,36,'/school/201.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%C4%CF%BA%FE%D0%A1%D1%A7/'),
('202','天津市河西区平山道小学','天津市河西区气象台87号','河西',2,'区重点,艺术类,',11,13817,45072,81,'/school/202.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%C6%BD%C9%BD%B5%C0%D0%A1%D1%A7/'),
('203','天津市河西区三水道小学','河西区天水道二号','河西',3,'普通,专业学科类,',13,23568,28681,151,'/school/203.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%C8%FD%CB%AE%B5%C0%D0%A1%D1%A7/'),
('204','天津市河西区水晶小学','天津市河西区解放南路与浯水道交口','河西',2,'普通,艺术类,',25,26149,58796,181,'/school/204.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%CB%AE%BE%A7%D0%A1%D1%A7/'),
('205','天津市河西区四号路小学','天津市河西区越秀路健春里2号','河西',1,'普通,小班教学,专业学科类,',5,9900,36960,49,'/school/205.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%CB%C4%BA%C5%C2%B7%D0%A1%D1%A7/'),
('207','天津市河西区土城小学','天津市河西区大沽南路935号','河西',3,'普通,体育类,艺术类,专业学科类,',18,24084,39215,199,'/school/207.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%CD%C1%B3%C7%D0%A1%D1%A7/'),
('208','天津市河西区卫东路小学','天津市河西区平江道65号','河西',2,'普通,小班教学,科技类,专业学科类,',17,28743,41000,44,'/school/208.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%CE%C0%B6%AB%C2%B7%D0%A1%D1%A7/'),
('209','天津市河西区湘江道小学','河西区湘江道50号','河西',1,'普通,小班教学,体育类,艺术类,',37,21864,57216,443,'/school/209.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%CF%E6%BD%AD%B5%C0%D0%A1%D1%A7/'),
('210','天津市河西区新会道小学','天津市河西区新会道27号','河西',3,'普通,体育类,艺术类,专业学科类,',21,18925,29477,86,'/school/210.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%D0%C2%BB%E1%B5%C0%D0%A1%D1%A7/'),
('211','天津市河西区友谊路小学','天津市河西区友谊路友谊东里55号','河西',2,'普通,艺术类,',14,25592,41305,37,'/school/211.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%D3%D1%D2%EA%C2%B7%D0%A1%D1%A7/'),
('212','天津市中山小学','河西区体院北环湖中道1号','河西',2,'普通,体育类,艺术类,专业学科类,',5,20892,30127,28,'/school/212.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%D6%D0%C9%BD%D0%A1%D1%A7/'),
('213','天津市河西区珠江道小学','天津市河西区小海地平江里21号','河西',3,'普通,体育类,艺术类,专业学科类,',8,23458,29081,44,'/school/213.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%D6%E9%BD%AD%B5%C0%D0%A1%D1%A7/'),
('6686','河西中心小学西园校区','西园道18号','河西',2,'市重点,艺术类,专业学科类,',23,24385,35767,155,'/school/6686.htm','/xuequfang/kw%BA%D3%CE%F7%D6%D0%D0%C4%D0%A1%D1%A7%CE%F7%D4%B0%D0%A3%C7%F8/'),
('6688','天津师范大学第二附属小学渌水道校区','小海地浯水道与枫林路交口','河西',3,'市重点,名校附属,专业学科类,',5,30409,34536,155,'/school/6688.htm','/xuequfang/kw%CC%EC%BD%F2%CA%A6%B7%B6%B4%F3%D1%A7%B5%DA%B6%FE%B8%BD%CA%F4%D0%A1%D1%A7%E4%CB%CB%AE%B5%C0%D0%A3%C7%F8/'),
('6901','天津市水晶小学名都学校','解放南路442号增1号(解放南路顺驰名都公寓旁)','河西',2,'普通,名校附属,',16,22130,52550,66,'/school/6901.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CB%AE%BE%A7%D0%A1%D1%A7%C3%FB%B6%BC%D1%A7%D0%A3/'),
('79','河西中心小学梅江校区','天津市河西区梅江道121号','河西',2,'市重点,艺术类,专业学科类,',7,26192,39707,44,'/school/79.htm','/xuequfang/kw%BA%D3%CE%F7%D6%D0%D0%C4%D0%A1%D1%A7%C3%B7%BD%AD%D0%A3%C7%F8/'),
('80','天津市河西区闽侯路小学','天津市河西区闽侯路1号','河西',1,'市重点,科技类,',48,32314,58097,601,'/school/80.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%D3%CE%F7%C7%F8%C3%F6%BA%EE%C2%B7%D0%A1%D1%A7/'),
('81','上海道小学','天津市河西区绍兴道226号','河西',1,'市重点,科技类,专业学科类,',29,27097,50731,689,'/school/81.htm','/xuequfang/kw%C9%CF%BA%A3%B5%C0%D0%A1%D1%A7/'),
('9007','天津市河西区纯真小学',null,'河西',2,null,null,null,null,null,null,null),
('9008','天津市河西区复兴小学',null,'河西',3,null,null,null,null,null,null,null),
('9009','天津财经大学第二附属小学',null,'河西',3,null,null,null,null,null,null,null),
('9010','天津市河西区梅苑小学',null,'河西',3,null,null,null,null,null,null,null),
('9011','天津市河西区全运村小学',null,'河西',3,null,null,null,null,null,null,null),
('9012','天津科技大学附属小学',null,'河西',3,null,null,null,null,null,null,null),
('9024','天津科技大学附属柳林小学',null,'河西',3,null,null,null,null,null,null,null),
-- 红桥
('1723','红桥区实验小学','红桥区丁字沽二号路1号','红桥',1,'市重点,科技类,',18,16858,25224,145,'/school/1723.htm','/xuequfang/kw%BA%EC%C7%C5%C7%F8%CA%B5%D1%E9%D0%A1%D1%A7/'),
('238','天津市红桥区佳园里小学','天津市红桥区佳园里中心路1号','红桥',1,'普通,专业学科类,',4,10651,16734,8,'/school/238.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%BC%D1%D4%B0%C0%EF%D0%A1%D1%A7/'),
('239','天津市红桥区北马路小学','红桥区同义庄大街六号','红桥',null,'普通,科技类,',3,17951,35357,22,'/school/239.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%B1%B1%C2%ED%C2%B7%D0%A1%D1%A7/'),
('240','天津市红桥区丁字沽小学','天津市红桥区丁字沽零号路35号增1','红桥',1,'普通,艺术类,',11,15772,24904,64,'/school/240.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%B6%A1%D7%D6%B9%C1%D0%A1%D1%A7/'),
('750','天津市师范附属小学','天津市红桥区水木天成团结路1号','红桥',2,'区重点,名校附属,',15,17261,29108,113,'/school/750.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CA%A6%B7%B6%B8%BD%CA%F4%D0%A1%D1%A7/'),
('751','天津市红桥区旱桥小学','新河北大街福寿南里32号','红桥',null,'普通,专业学科类,',3,15743,20169,12,'/school/751.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%BA%B5%C7%C5%D0%A1%D1%A7/'),
('752','红桥小学','天津市红桥区红桥北大街105号','红桥',2,'普通,专业学科类,',9,13774,24403,19,'/school/752.htm','/xuequfang/kw%BA%EC%C7%C5%D0%A1%D1%A7/'),
('753','红桥区欢庆里小学','天津市红桥区欢庆里西于庄纸厂大街21号','红桥',null,'普通,专业学科类,',4,18937,24403,1,'/school/753.htm','/xuequfang/kw%BA%EC%C7%C5%C7%F8%BB%B6%C7%EC%C0%EF%D0%A1%D1%A7/'),
('754','天津市红桥区邵公庄小学','天津市红桥区红旗北路30号','红桥',3,'普通,专业学科类,',9,17167,21642,21,'/school/754.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%C9%DB%B9%AB%D7%AF%D0%A1%D1%A7/'),
('755','天津市红桥区桃花园小学','天津市红桥区丁字沽红塔寺大道1号','红桥',1,'普通,专业学科类,',9,14510,20571,124,'/school/755.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%CC%D2%BB%A8%D4%B0%D0%A1%D1%A7/'),
('756','天津市文昌宫民族小学','天津市红桥区大丰路先春园小区内,先春园春雨路1号','红桥',3,'普通,专业学科类,',4,26976,34381,83,'/school/756.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%CE%C4%B2%FD%B9%AC%C3%F1%D7%E5%D0%A1%D1%A7/'),
('757','天津市红桥区杨庄子小学','天津市红桥区杨庄子大胡同10号','红桥',null,'普通,艺术类,',4,16849,54813,10,'/school/757.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%D1%EE%D7%AF%D7%D3%D0%A1%D1%A7/'),
('758','红桥区跃进里小学','天津市红桥区幸福里平房11号','红桥',3,'普通,艺术类,',7,16696,28971,41,'/school/758.htm','/xuequfang/kw%BA%EC%C7%C5%C7%F8%D4%BE%BD%F8%C0%EF%D0%A1%D1%A7/'),
('759','红桥区中心小学','天津市红桥区小西关乐安里3号','红桥',3,'普通,艺术类,',12,20026,33967,122,'/school/759.htm','/xuequfang/kw%BA%EC%C7%C5%C7%F8%D6%D0%D0%C4%D0%A1%D1%A7/'),
('760','天津市红桥区佳宁里小学','红桥区佳宁里小区内','红桥',1,'普通,专业学科类,',6,12766,23918,43,'/school/760.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%BC%D1%C4%FE%C0%EF%D0%A1%D1%A7/'),
('761','天津市雷锋小学','天津市红桥区中嘉花园绮水苑旁','红桥',3,'普通,艺术类,',16,13508,21415,71,'/school/761.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%C0%D7%B7%E6%D0%A1%D1%A7/'),
('762','天津市红桥区佳春里小学','天津市红桥区双环邨佳春里小区','红桥',1,'普通,专业学科类,',9,12766,16930,43,'/school/762.htm','/xuequfang/kw%CC%EC%BD%F2%CA%D0%BA%EC%C7%C5%C7%F8%BC%D1%B4%BA%C0%EF%D0%A1%D1%A7/'),
('763','外国语小学','天津市红桥区咸阳北路兴城南道6号','红桥',null,'区重点,外语类,专业学科类,',17,12491,27538,71,'/school/763.htm','/xuequfang/kw%CD%E2%B9%FA%D3%EF%D0%A1%D1%A7/'),
('90','新村小学','天津市红桥区五爱道24号','红桥',null,'区重点,体育类,',9,17777,24955,95,'/school/90.htm','/xuequfang/kw%D0%C2%B4%E5%D0%A1%D1%A7/'),
('9025','河北工业大学附属红桥小学',null,'红桥',1,null,null,null,null,null,null,null),
('9026','天津市红桥区清源道小学',null,'红桥',1,null,null,null,null,null,null,null),
('9027','天津市红桥区第二实验小学',null,'红桥',2,null,null,null,null,null,null,null),
('9028','天津师范学校和苑附属小学',null,'红桥',2,null,null,null,null,null,null,null),
('9029','天津市红桥区洪湖里小学',null,'红桥',2,null,null,null,null,null,null,null),
('9030','天津市红桥区西站小学',null,'红桥',3,null,null,null,null,null,null,null);



-- 和平、河西、南开 小学学区范围
-- 和平区一片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '诚基经贸中心', '1-3号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '贵都大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '宏达公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '庆华里', '1-5门');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '松寿里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '泰华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '安乐村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '树德北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '树德南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '崇仁里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '芷岳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '新华路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市耀华小学', null, '河北路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区劝业场小学', null, '河南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区劝业场小学', null, '天昌里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '鞍山道小学', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '和平时光', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '康达公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '祈年大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '兴隆南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '爱建公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '凌阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '四箴北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '云台花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '仰止坊', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '保疆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '永和新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '至善里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '天宁里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '新疆路三号公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '长安西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '多宁里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '福缘里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '乐余里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '万全道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '包头道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '南京路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '南门外大街', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '宁夏路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '山西路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '陕西路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '青海路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '锦州道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '鞍山道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '新疆路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '四平东道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '鞍山道小学', null, '多伦道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新文化花园新景居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新丽居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新典居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新雅居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新秀居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新汇华庭', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '同方花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新福方里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '同庆后', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '长寿公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '大都会天汇尚苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '天汇雅苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '天汇茗苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '蓉芳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '富顿大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '金伦公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '福厚西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '城建里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '南荣里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '和平园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '金茂广场', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '新世界花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '荣庆园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '保利金花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '依仁新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '福方里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '庆有西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全小学', null, '裕德里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '新津里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '滨府里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '三育里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '浮德里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '福明里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '鸿记里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '新佳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '金街庭院', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '天津市和平区哈密道小学', null, '锦州道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '新福方里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '长寿公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '新文化花园新典居新雅居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '蓉芳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '金伦公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '福厚西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '南荣里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '依仁新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区万全第二小学', null, '福方里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区第二南开学校小学部', null, '怀远里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 1, '和平区第二南开学校小学部', null, '华门明筑', null);
-- 和平区二片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '吉利花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '光华巷', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '金德园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '天兴里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '复元里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '众诚里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '景阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '锦中大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '市政里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '文善里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '松月村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '安宁里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '吉星北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '继贤里大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '华胜村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '益寿里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '世昌里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '兆丰路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '和平区中心小学', null, '贵阳公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '福林里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '福泰温泉公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '安庆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '华萌南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '云成里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '铭通里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '马场别墅', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '鼎和里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '进德里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '柳安新村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '庆合里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '岳康园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '延德里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '永定里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '合作里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '文化里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '云峰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '信福里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '利康里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '郑业里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '友好里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '岳都园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '武昌路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '岳阳道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '襄阳道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '岳阳道小学', null, '聚英大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '都会轩', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '尚友里', '1-17号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '世升花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '益寿里', '1-9幢');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '华萌东里', '1-12号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '鑫东公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '忠厚里', '1-8号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '襄阳道', '2-30双号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '西安道', '95-99号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '武昌路', '2-10双号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '南宁路', '7号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '沙市道', '2号（劳卫所后院）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '滨江道', '221号（翰林公馆）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市实验小学', null, '府上和平','合心园');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '竞业里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '树德楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '佳怡公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '天新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '银行里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '香榭里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '迎新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '天赐园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '建津里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '万科都市花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '信华楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '天新北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '新欣里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '银达公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '文化村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '气象南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '五爱里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '信华南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '观云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '隆昌里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '汇名园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '康泰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '云琅新居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '新安楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '树德里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 2, '天津市和平区新星小学', null, '和畅园', null);
-- 和平区三片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '赛顿大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '朗文名邸', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '河沿里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '金泉里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '规划里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '四达里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '设计里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '松乐里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '新建村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '团圆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '友谊里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '成康里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '吉和里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '昆明路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '更生里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '昆明路小学', null, '乐民里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '明源里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '开封里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '云峰楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '新三多里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '谦受里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '养和里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '安康里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '河新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '庆云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '泉山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '五湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '南京路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '河北路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '建设路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '睦南道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '烟台道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '泰安道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '曲阜道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '湖北路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '青岛道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '洛阳道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '成都道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '南海路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '新华路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '澳门路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市第二十中学附属小学', null, '尚友村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '和平区新华南路小学', null, '开封里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '和平区新华南路小学', null, '安乐村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '和平区新华南路小学', null, '晨光里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '和平区新华南路小学', null, '军研小区', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '和平区新华南路小学', null, '新华路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市四平东道小学', null, '津塔公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市四平东道小学', null, '湯臣津湾一品', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市四平东道小学', null, '承德道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市四平东道小学', null, '通达园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市四平东道小学', null, '金宝公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '卫华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '兴河里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '碧云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '观云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '津中里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '朝阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '新兴南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('和平', 3, '天津市和平区西康路小学', null, '卫津路', null);
-- 河西区一片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '西楼北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '敬重里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '信昌大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '福至里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '宝德里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '存诚里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '无锡道大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '浦口东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '积庆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '广田里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '安德里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '三义大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '祺寿里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '安辛庄', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '南浦大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '久仰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '吉万里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '东莱里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '台北路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '南通里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '富邦花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '春梅楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '荣华小区', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '鸿华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '利合里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '重建里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '海运里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '同善里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '浦江大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '海汇名邸', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '爱慕里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '新立里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '荣华大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '白楼名邸', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '解放南路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '尚品嘉园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '汇通大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '天庆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '宝和里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '港建里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '福建路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '连云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '积余里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '广发楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '西楼后街', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '积厚里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '南园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区闽侯路小学', null, '扬州里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '向荣里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '文静里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '四化里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '湛江路新村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '三合里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '新闻西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '江门里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '服务楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '新会里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '生昌里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '新闻里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '综合楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '天达里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '环友里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '积庆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '静安里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '轻纸楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '长安里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '亚中花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '上海道小学', null, '地毯楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '珠海里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '红波里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '恩德西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '珠波里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '连荣里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '健美里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '广顺园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '安德公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '长安里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '黄埔里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '恩德东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '盛瑞公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '圣德园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '亚中花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区恩德里小学', null, '红波公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '东舍宅', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '南华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '晶采大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '富裕广场', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '龙海公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '海华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '云广新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '重华南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '福盛花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '香江花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '恒华公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '重华西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '名仕达花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '福熙园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '美宁公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '盈海园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '海景公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '新海大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '汇文名邸', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '侨馨园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '建设楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '美满里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '联合里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '金福兆公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '棉二大院', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '台北路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '美化里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '同善里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '津沽名园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '东莱里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '重华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '美荷苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '鑫瑞名苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '美泉新苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '海润公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '环海公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '北洋新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '排水大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '云景大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '湘南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '糖业大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '解放南路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '宁波道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '福建路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '奉化道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '闽侯路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区湘江道小学', null, '湘江道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '四新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '惠州里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '惠阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '悦目里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '四化楼', '3-29号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '健强里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '荔湾公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '育红楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '增进楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '健全里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '增强里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '友谊楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '黄埔南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '友谊公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '龙佳公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '白云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '勘测楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '健美里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '健春里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '花园楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '万顺花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '教师村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '绮云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '友谊楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '健强新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '港云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '编云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '向东里', '20号以后');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '七建大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区四号路小学', null, '旭光楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '台湾路小学', null, '解放南路', '297号至313号（单号）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '台湾路小学', null, '台湾路', '2-18号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '台湾路小学', null, '台儿庄路', '49号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '台湾路小学', null, '宁波道', '3-15号（单号）,宁波道4-8号（双号）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '景兴里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '景兴西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '西楼北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '龙都花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '麦格理', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '泰达园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '广顺园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '品水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '同善里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '恒河园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '松盛里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 1, '天津市河西区东楼小学', null, '福盛花园', null);
-- 河西区二片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '寿园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '谊城公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '育学里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '西园西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '育文里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '芳竹花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '可园东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '友谊花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '澳隆花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '顺园公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '西园南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '鹤园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '可园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学西园校区', null, '西园北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学东湖校区', null, '宾水南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学东湖校区', null, '天资里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学东湖校区', null, '五一阳光皓日园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学东湖校区', null, '纪明家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学东湖校区', null, '纪发公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学东湖校区', null, '高风里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学东湖校区', null, '安达公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学梅江校区', null, '香水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学梅江校区', null, '欣水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学梅江校区', null, '玉水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学梅江校区', null, '翠水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学梅江校区', null, '芳水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '河西中心小学梅江校区', null, '蓝水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '师大附小', null, '气象里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '师大附小', null, '建国楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '师大附小', null, '平山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '师大附小', null, '宁发商城', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '师大附小', null, '水映兰庭', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '师大附小', null, '紫金山路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '师大附小', null, '平山公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '劳卫里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '佟卫里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '天骄园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '津港里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '照耀里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '庆荣里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '元兴新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '长安里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '福海里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区马场道小学', null, '罗兰花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区南湖小学', null, '国风园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区南湖小学', null, '司法警校宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区南湖小学', null, '体院宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区南湖小学', null, '富源里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区南湖小学', null, '博兰苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天潇园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天睐园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天择园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天涛园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天淳园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天澔园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '优仕家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '优仕庭园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天汐园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天澜园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '天湖园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '水晶城小区', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区水晶小学', null, '云水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '名都公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '郁江南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '名都新园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '瑞江花园梅苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '瑞江花园兰苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '瑞江花园菊苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '瑞江花园竹苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '长达公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市水晶小学名都学校', null, '景观花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '世纪梧桐公寓', '溪水园');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '涟水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '川水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '泉水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '畅水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '顺水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '福水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '海逸长洲恋海园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '海逸长洲瀚景园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区梧桐小学', null, '海逸长洲瀚波园', '1-5门');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '友谊东里', '1—49号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '文明里', '93号以后');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '德旺里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '浏阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '桃江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '平江南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '光辉里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '中乒公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '澧水南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '红霞里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '澧新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '大庆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '红山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '金星里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '光明里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '长城里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区友谊路小学', null, '清泽园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '文玥里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '红旗北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '光华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '平江南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '谊景村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '艺都花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '曙光里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '平江北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '红升里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '滦水道', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '浏阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '文玥北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区卫东路小学', null, '滦水里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '先进里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '卫星里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '德才里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '东风里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '金山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '森淼公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '凤凰城', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区平山道小学', null, '华悦大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '津淄东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '气象南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '环湖东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '环湖南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '蔚蓝轩', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '紫金南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '环湖西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '紫金北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '华昌大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '环湖北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '气象北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市河西区滨湖小学', null, '滨湖大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '宾水东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '宾水北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '宾水西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '宾水里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '育贤里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '文苑楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '文苑楼二', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '宾西楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 2, '天津市中山小学', null, '海建里', '双号');
-- 河西区三片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '景福里', '（1—56）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '爱国北里', '（1—62）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '前程里', '单号（1—59）,双号（2—84）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '爱国里', '（含天明公寓）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '向东里', '（单号9—19，双号2—18）（包括华诚公寓）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '中钢大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '新跃里', '（1—8门）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '挺进里', '（1—9）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '鹤望里', '（1—47）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '祥和里', '（1—49）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '中裕园', '1-9');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '大沽南路', '672、674号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '跃进楼', '（1—18门）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '生辉里', '（1—6门）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '天意里', '（1—14门）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '中豪世纪花园', '1-5');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '三商大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '三商平房', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '新颖里', '（1—8）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '中豪国际汽车大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '红星里', '（单号1—69、双号2—32）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '红星里平房', '（1—12、16、24、26）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '曙光里', '单号（15—49）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学南楼校区', null, '福丰里', '（1—8门）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学渌水道校区', null, '桂江里', '1-165');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学渌水道校区', null, '祺林园', '1-24');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学渌水道校区', null, '儒林园', '1-21');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学渌水道校区', null, '博林园', '1-20');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津师范大学第二附属小学渌水道校区', null, '怡林园', '1-20');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '新城小区', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '通达尚城', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '云广新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '美好里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '红云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '书苑里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '美泉新苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '古芳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '新城大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '洪泽花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '科艺里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '秋润家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '北洋新里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '秀芳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '长泰公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区土城小学', null, '宝澜园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '红光大院', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '无缝钢管大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '百货楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '轧一楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '下河圈村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '柳苑公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '七九楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '八一楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '双喜里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '欣喜里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '河西宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '金海湾花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '七一平房', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '七一大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '东工房', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '宋家胡同', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '常家胡同', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '马家胡同', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '红旗路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '南北大街', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '南北小街', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '田家台', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '七四楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '河东宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '河东大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '新五一', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '老五一', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '柳林东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '文明大院', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '小何庄', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '月圆里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '台板厂宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '航道处宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '东花园科技大学宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '风致里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '景致里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '雅致里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '李家台', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '腾华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '西老公房', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '幸喜里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '100间', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '城乡里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '灰堆第一小学', null, '西横街', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '三水南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '秀峰里', '1-64');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '元山里', '1-31');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '云山里', '1-31');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '彭山里', '1-24');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '双山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '双山新苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '同江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '汉江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '松江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区三水道小学', null, '粤江里', '单号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '平江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '珠江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '龙江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '滴江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '九江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '粤江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '热电厂宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区珠江道小学', null, '公交大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '宽幅里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '贺福里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '锦福里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '谦福里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '昌源公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '园丁公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '东海里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '黄海里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '南海里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '东江南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '榕江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '军功里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '振财里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '玉峰花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '龙博花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '珠峰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '珠峰南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '昆仑里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '云山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '元山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '彭山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区东海里小学', null, '秀峰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '微山东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '建港里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '渤海楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '黎明里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '科研里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '起舞里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '十三中宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '文雅里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '微山东里平房', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '恒山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '莲湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '海地宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '文雅里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '龙天园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '先登里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '向明里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '无缝楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '团和楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '教师楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '化工宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '饮食宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '电焊条宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '十三中宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '运输宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '无缝平房', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '涌成里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '天山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '微山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '骊山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '四季馨园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '瑞泰公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '瑞宝里', '幸福家园');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '副食大楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '钢厂东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '微山西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '解放村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '钢厂宿舍瑞来里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '海翔公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '岩峰南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '玛钢厂宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '油毡厂宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '星光宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '有机合成宿舍', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '世芳园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '复兴门北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '河畔公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区新会道小学', null, '复兴门家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区陵水道小学', null, '泰山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区陵水道小学', null, '双山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区陵水道小学', null, '华山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '华江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '桂山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '君山里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '嫩江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '川江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '兰江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '富江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '云江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '安江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('河西', 3, '天津市河西区华江里小学', null, '金江里', null);
-- 南开区北片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '故里花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '公园北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '风荷新园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '凤玉里','1—6号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '纯善里','3、4号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '凯兴公寓','1—22号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '凯立天香家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '凤翔里','1—2号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '云居里','1—4号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区五马路小学', null, '兴华公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区中心小学', null, '双峰道', '2、4号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区中心小学', null, '师北里', '平房1—14号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区中心小学', null, '二马路', '132、134号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区中心小学', null, '三纬路', '70号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区中心小学', null, '德庆里', '1—3号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区中心小学', null, '太极园', 'A、B座');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区中心小学', null, '龙凤里', '1-14号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '宝龙湾家园', '1-15');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '卫安北里', '1-9');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '级升里', '1、3、5、7、9、10');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '卫安中里', '1-5');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '兴盛里', '1-3');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '卫安南里', '1-9');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '卫安西里', '1、2');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '广丰园', '1-5');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '和平里大楼', '1-7');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区永基小学', null, '永基花园', '4-10');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '东王台居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '盛达园居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '平陆东里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '芙蓉南里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '幸福南里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '光明里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '桦林园居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '清化里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '级升里二居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区西营门外小学', null, '瑞德里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '幸福南里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '建华里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '华美里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '广灵里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '建设新街居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '光明路居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '雅美里居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区艺术小学', null, '影院后胡同居委会', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区咸阳路小学', null, '临潼西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区咸阳路小学', null, '雅云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区咸阳路小学', null, '雅园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区咸阳路小学', null, '石泉里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区咸阳路小学', null, '翰园东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区咸阳路小学', null, '翰园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区咸阳路小学', null, '天泰花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '彩霞里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '临平里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '灵石里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '富平里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '华阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '延川北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '龙富园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '延川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '云阳北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '舒兴家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '平遥里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '云阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '雅卉里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '红日东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '南开区科技实验小学', null, '向阳路', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '乡宁里', '2—7号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '汾水道', '54-70');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '延安楼', '3、6—22号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '延长里', '1—8号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '连心里', '1—5号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '拥军里', '1—3号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '原平里', '1—3号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '平遥里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '建新楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '建民楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '立新里', '6');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '宇翔园', '1-8');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区汾水道小学', null, '雅润嘉园', '1-6');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '大园新居', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '乐园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '集园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '锦园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '留园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '怡园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '锦园北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区前园小学', null, '芥园北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '跃升里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '宫民里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '官易里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '欣迁里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '春畅里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '夏茵里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '秋爽里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '秋爽西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区跃升里小学', null, '冬云里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '密云里','1—13号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '安泽里','1—2号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '双庆楼','1—2号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '新华楼','1—9号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '汉中里','1—6号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '啤酒厂北宿舍','3条胡同110号');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '战备楼','1—29号楼（全）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区第二中心小学', null, '平定里','1—4号楼（全）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '静德花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '如意大厦', '1、2号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '天霖园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '天越园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '天康园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '铜锣湾', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '龙亭家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '盛津园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '晋丰大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '儒园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '尚佳新苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '新安花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '阳光晶典', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '新隆轩', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '平祥大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '铭隆雅苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '金轩商业中心', '1、2、3号楼');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '城厢嘉园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 1, '天津市南开区中营小学', null, '煦园新居', null);
-- 南开区中片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '风湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '光湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '照湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '学湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '景湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '馨达园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '府湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '金杭大厦', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '时代公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '龙兴里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '美湖里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '照湖西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区风湖里小学', null, '龙腾里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '兴业家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '长江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '临江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '长治里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '怀安西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '英俊名邸', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '鼎域名邸', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '长宁里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '苏堤东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '苏堤公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '民建北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '春晓花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '金潭花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '苏堤西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '民建里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '星澜园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区长治里小学', null, '永川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '义兴里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '义兴南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '西湖里', '（1—6号楼及楼下所有平房）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '花港里', '（1—8号楼、9—12号楼）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '平湖东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '平湖西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '兴泰北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区义兴里小学', null, '兴泰南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '三潭东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '航天北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '卧龙南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '风荷园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '荣迁东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '荣迁西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '卧龙北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '龙井里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '飞云东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '风荷东园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '南丰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '馨名园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '星环里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '华章里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '天环里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '深蓝公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '白堤东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '地环里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '月环里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '三潭西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '日环里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '万维花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '苏堤东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '卧龙东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '西冷里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '翠峰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '学府花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '清新园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '兴泰园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '航宇公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '华鹊里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '南开小学', null, '石化楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '雅安东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '宜宾东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '沱江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '禧顺花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '云龙里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '泊江东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '桂荷园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '博雅轩人才公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '会泽园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '康定里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '宜宾西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '咸阳南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '祥平园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '宜宾北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '雅江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '赛德广场', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '长虹楼', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '云龙南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '东川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区宜宾里小学', null, '清江里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '景园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '莲安里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '川北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '易川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '晴川花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '泾水园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '田川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '貌川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '西昌里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '川南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '川南公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '金川西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '乐至里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '汶川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '昔阳东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '昔阳南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '雅川家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '川东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '园川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '昔阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '金川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '宁强里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '雅庭苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '正阳里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '洪雅里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区川府里小学', null, '沐川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '雅安西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '罗江西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '嘉陵东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '云阳西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '金平东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '南江东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '咸阳北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '南江西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '嘉陵南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '云阳东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '罗江东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '嘉陵北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '江安里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津师范大学南开附属小学', null, '长江公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华宁道小学', null, '华宁南里', '（1—22号楼）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华宁道小学', null, '华宁北里', '（1—20号楼）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华宁道小学', null, '横江里', '（1—12号楼）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华宁道小学', null, '盈江里', '（1—20号楼）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华宁道小学', null, '楚雄道', '（8号院）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华宁道小学', null, '盈江西里', '（1—14号楼）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华宁道小学', null, '瑞丽园', '（1—21号楼）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '金环里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '盈江东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '美丽心殿', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '金冠里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '晋宁北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '昌宁北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '昌宁南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '堤北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '淦江东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '淦江西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '保山南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '堤南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '金典花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '堤中里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '金宇里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '云轩公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '龙川里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '保山北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '翰雅园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '金杰里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 2, '天津市南开区华夏小学', null, '金云里', null);
-- 南开区南片
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '迎风里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '凤园南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '金厦里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '林苑西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '园荫里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '凤园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '凤园北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '林苑北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '园荫北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '鹤园北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '林苑东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '迎水东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '迎水西里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '燕园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '鹤园南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '明园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '迎水南里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '中海御湖翰苑', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '郁园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '华巨公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '迎水北里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区新星小学', null, '堤东里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '津涞花园', '1-14栋');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '金谷园', '1-22栋');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '凌奥花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '金合园', '1-13栋（华胜小区）');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '金禧园', '1-6栋');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '金淼园', '1-8栋');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '金研里', '1-4栋');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '欣居园', '1-4栋');
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '仁爱濠景庄园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学仁爱校区', null, '金地里', '1栋');

insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '时代奥城', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '欣苑公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '水上温泉花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '龙滨园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '科海里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '彩虹花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '植园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '嘉泰花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '水云花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '福宏里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '奥林匹克村', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '水蓝花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '盛地里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '翠园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '山海天家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '水乡花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '观景里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '新华园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '利德公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '超英家园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '眺园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '红医里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '凯祥花园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '瑞地里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '丹颐园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '元都园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '育梁里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '佳闻公寓', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '美园里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '长实别墅', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '天骄园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区水上小学温泉校区', null, '金都花园别墅', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津南开实验学校', null, '居华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津南开实验学校', null, '安华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津南开实验学校', null, '天华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津南开实验学校', null, '碧华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津南开实验学校', null, '莹华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区阳光小学', null, '阳光100国际新城', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区阳光小学', null, '俊城浅水湾', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区阳光小学', null, '云华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区阳光小学', null, '竹华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区阳光小学', null, '程华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '南开区阳光小学', null, '瑞泽园', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区华苑小学', null, '长华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区华苑小学', null, '久华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区华苑小学', null, '日华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区华苑小学', null, '地华里', null);
insert into scope (Region, Slice, School, RC, Estate, Other) values ('南开', 3, '天津市南开区华苑小学', null, '绮华里', null);