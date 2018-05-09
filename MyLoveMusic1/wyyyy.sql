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
       birth date,
       province varchar(100),
       city varchar(100),
       follow varchar(4000), 
       songSheet varchar(4000),
       status int,
       mark varchar(100) 
);
select * from userInfo;
--歌曲风格表  flag  --1.语种  2.风格  3.场景  4.情感  5.主题 
create table styleInfo(
       sid int primary key auto_increment,
       sname varchar(100) not null unique,
       flag int, 
       mark varchar(200),
       status int
);
select * from styleInfo;
--歌手分类表
create table singerType(
       sid int primary key auto_increment,
       sname varchar(100),
       status int
);
select * from singerType;
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

--歌曲表  singerId--歌手   saddr--歌曲地址   lyric--歌词   clickRate--点击率    longs--时长   languages--语种   style --风格 
create table song(
       sid int primary key,
       sname varchar(200) not null,
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
COMMIT;

select * from song;
select * from styleInfo;
select * from singer;

update song set style = 5 where sid = 1;
select o.sname sname,o.longs longs,o.saddr saddr,s.sname singerName,o.photo photo,o.sid sid from song o join singer s join styleinfo s1 
on singerId=s.sid  and style=s1.sid where o.status!=0  and o.style = (select sid from styleInfo s where s.sname =  '流行' )











