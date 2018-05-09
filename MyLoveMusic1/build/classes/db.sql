create database music;
use music;
--后台管理员信息表
create table admin(
       aid int primary key auto_increment,
       aname varchar(100),
       pwd varchar(100),
       status int
);
select * from admin;
select * from admin where aname='阳阳' and pwd='2CFAD562797C1C0D' and status!=0
insert into admin(aname,pwd,status) values('阳阳','2CFAD562797C1C0D',1)
--会员  integral  --积分    follow  --关注   songSheet --歌单   mark --备用字段
create table userInfo(
       usid int primary key auto_increment,
       uname varchar(100),
       email varchar(100),
       tel varchar(15),
       pwd varchar(100),
       integral int,
       photo varchar(200),
       sex varchar(4),
       birth varchar(50),
       province varchar(100),
       city varchar(100),
       follow varchar(4000), 
       songSheet varchar(4000),
       status int,
       mark varchar(100) 
);
delete from  userInfo where tel='18473481881'
select *from userInfo where tel='18473481301' and pwd='9481E0D7A83CB52A' and status!=0
select * from userInfo;
--歌曲风格表  flag  --1.语种  2.风格  3.场景  4.情感  5.主题 
create table styleInfo(
       sid int primary key auto_increment,
       sname varchar(100) not null unique,
       flag int, 
       mark varchar(200),
       status int
);
select sid,sname,flag from styleInfo where status!=0 order by sid limit 0,5
--歌手分类表
create table singerType(
       sid int primary key auto_increment,
       sname varchar(100),
       status int
);
insert into singerType(sname,status) values('华语男歌手',1);
insert into singerType(sname,status) values('华语女歌手',1);
insert into singerType(sname,status) values('华语组合/乐队',1);
insert into singerType(sname,status) values('欧美男歌手',1);
insert into singerType(sname,status) values('欧美女歌手',1);
insert into singerType(sname,status) values('欧美组合/乐队',1);
insert into singerType(sname,status) values('日本男歌手',1);
insert into singerType(sname,status) values('日本女歌手',1);
insert into singerType(sname,status) values('日本组合/乐队',1);
insert into singerType(sname,status) values('韩国男歌手',1);
insert into singerType(sname,status) values('韩国女歌手',1);
insert into singerType(sname,status) values('韩国组合/乐队',1);
insert into singerType(sname,status) values('其他男歌手',1);
insert into singerType(sname,status) values('其他女歌手',1);
insert into singerType(sname,status) values('其他组合/乐队',1);
select sid,sname from singerType where status!=0 order by sid limit 10,5
select * from singerType;
--歌手信息表  clickRate --点击率
create table singer(
       sid int primary key auto_increment,
       sname varchar(100),
       stid int ,
       photo varchar(200),
       clickRate int,
       status int,
       constraint fk_singer_stid foreign key(stid) references singerType(sid)
);
 select * from singer where status!=0 order by sid limit 0,5
--歌单表  ssname  --歌单名   song--歌单下的歌曲  languages --语种 style--风格 scene --场景 emotion--情感 theme--主题 clickRate --点击率
create table songSheet(
       ssid int primary key auto_increment,
       ssname varchar(100) not null, 
       usid int,
       song varchar(4000), 
       languages int,  
       style int, 
       scene int,
       emotion int,
       theme int,
       clickRate int,
       photo varchar(200),
       status int,
       constraint FK_songSheet_usid foreign key(usid) references userInfo(usid)
);
update songSheet set photo = '../fileUploadPath/oldmusic.jpg' where ssname= '怀旧辑 | 昨日红花今又开，似是故人来'
insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('
伤感华语：独享一个人的孤寂又如何',6,'',1,1,1,1,1,0,'../fileUploadPath/sadChinese.jpg',1);
insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('
第七封信 | 你从未尘封在岁月的记忆里',6,'',1,1,1,1,1,0,'../fileUploadPath/seven.jpg',1);
insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('
你的名字美如诗',6,'',1,1,1,1,1,0,'../fileUploadPath/yourname.jpg',1);

insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('
愿所有经历 都是岁月最美好的恩赐',6,'',1,1,1,1,1,0,'../fileUploadPath/wish.jpg',1);
insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('
『粤语』 听一首把自己感动的歌',6,'',1,1,1,1,1,0,'../fileUploadPath/yueyu.jpg',1);
insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('
勇敢的少年快去创造奇迹！',6,'',1,1,1,1,1,0,'../fileUploadPath/creat.jpg',1);
insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('
Nu Disco 舞池摇曳 复古电流',6,'',1,1,1,1,1,0,'../fileUploadPath/Disco.jpg',1);

select * from songSheet;
update songSheet set clickRate = 33 where ssid = 9
--歌曲表  singerId--歌手   saddr--歌曲地址   lyric--歌词   clickRate--点击率    longs--时长   languages--语种   style --风格 
create table song(
       sid int primary key auto_increment,
       sname varchar(200),
       singerId int , 
       saddr varchar(200), 
       lyric varchar(4000), 
       clickRate int, 
       longs varchar(20),
       languages int,  
       style int,
       photo varchar(200),
       status int,
       constraint FK_song_singerId foreign key(singerId) references singer(sid)
);
alter table song add usid int;
select * from song;
update song set longs ='03:26' where sid =1;
select * from song where status!=0  order by sid limit 0,5
select * from song order by clickRate desc
COMMIT;


SELECT* from songsheet;
select * from song where status!=0 and sid >10 and sid < 50

select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s on singerId=s.sid where o.status!=0  and o.sid >31 and o.sid < 50

select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid,u.uname uname from song o join singer s on singerId=s.sid where o.status!=0   



insert into songsheet(song) values ('1')
select * from songSheet where usid= 6 and status!=0 group by ssname;
select * from songSheet group by ssname;


select * from songsheet GROUP BY ssname;

select * from songsheet where ssname like '勇敢的少年去创造奇迹'

update songsheet set ssname ='勇敢的少年去创造奇迹' where ssname  like '%勇敢%'


SELECT t.ssname,MIN(t.ssid) FROM songsheet t 
GROUP BY t.ssname ORDER BY t.ssid