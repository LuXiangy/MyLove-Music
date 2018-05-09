<%@page import="com.yc.wyyyy.bean.SongSheet"%>
<%@page import="java.util.List"%>
<%@page import="com.yc.wyyyy.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/person.css" />
<link rel="stylesheet" href="css/follow.css" />
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<style>
.mynav{
display:none;
}
</style>
<script type="text/javascript">
$(function(){
	var usid=$.trim($("#usid").val());
	$.post("songSheetServlet",{op:"findMy",usid:usid},function(data){
		
	},"json");
	var followStr="";
	$.post("userInfoServlet",{op:"findById",usid:usid},function(data){
		var fo=new Array();
		if(data.follow!=undefined){
			fo=data.follow.split(",");
			for(var i=0;i<fo.length-1;i++){
				$.post("singerServlet",{op:"findById",sid:fo[i]},function(data){
					followStr="";
					followStr+="<li class='followLi'><div class='tup'><img src='"+data.photo+"' width='60px' height='60px' class='photo'/>";
					followStr+="<div class='info' onclick='addSingerClick("+data.sid+")'><p class='username'>"+data.sname+"</p><p class='someinfo'><span class='first'>动态0</span><span class='lineright'>关注0</span><span class='lineright'>粉丝0</span></p>";
					followStr+="</div><div class='oper'><img src='images/sendmessage.png'><p class='alFollow'>√&nbsp;已关注</p></div><a class='dipian'></a></div></li>";
					$("#followA").append($(followStr));
				},"json");
			}
		}else{
			fo.length=1;
		}
		$("#followSize").text(fo.length-1);
		$("#follow_count").text(fo.length-1);
	},"json");
})

function addSingerClick(sid){
	
	$.post("singerServlet",{op:"addClick",sid:sid},function(data){
		
	},"text");
	$.post("singerServlet",{op:"seeHome",sid:sid},function(data){
		if(data>0){
			location.href="dl-singerPerson.jsp"
		}
	},"text");
}
</script>
</head>

<body>
<input type="hidden" name="usid" value="${sessionScope.currentLogin.usid}" id="usid">
<div class="body1">
	<%@include file="page/alLogin.jsp" %>
    
    <div class="nav_1"></div>
    
    
		
		
		
		
		
		<div  class="g-bd">
			<div class="per_center">
				<dl id="head-box">
					<dt class="photo">
						<img src="<%=userInfo.getPhoto() %>" />
						<div class="btm"><a href="javascript:changePhoto(<%=userInfo.getUsid() %>)">更换头像</a></div>
					</dt>
					<dd class="per_information">
						<div  class=" per_name ">
							<div id="box">
								<div class="edit">
									<a href="setting.jsp" class="u_btn">
										<i>编辑个人资料</i>
									</a>
								</div>
								<h2>
									<span class="per_title"><%=userInfo.getUname() %></span>
									<span class="lv1">
										1<i class="lv1_right"></i>
									</span>
									<i class="feama"> </i>
								</h2>
							</div>
						</div>
						
						<ul class="neir">
							<li class="fst">
								<a class="class1" href="javascript:void(0)">
									<strong id="event_count">0</strong>
									<span class="span0">动态</span>
								</a>
							</li>
							<li class="li1">
								<a class="class1" href="javascript:void(0)">
									<strong id="follow_count"></strong>
									<span class="span0">关注</span>
								</a>
							</li>
							<li  class="li1">
								<a class="class1" href="javascript:void(0)">
									<strong id="fan_count">0</strong>
									<span class="span0">粉丝</span>
									<i id="newCount" class="u-icn u-icn-68 f-alpha" style="display:none;"></i>
								</a>
								</li>
						</ul>
						
						<div class="address">
							<span>所在地区：<%=userInfo.getProvince() %><%=userInfo.getCity() %></span>
							<span id="age" class="sep" data-age="794505600000">
								年龄：
								<span>95后</span>
							</span>
						</div>
						
						<div class="per_shejiao">
							<span class="shejiao">社交网络：</span>
							<ul class="shejiao_logo">
								<li id="1li">
									<a class="xinlang" title="新浪微博"></a>
								</li>
								<li class="2li">
									<i class="douban" title="豆瓣网"></i>
								</li>
						</div>
					</dd>
				</dl>
				
				
			
			
				<div class="gedan">
					<h3 class="gednanme">
						<span class="f-ff2">关注（<label id="followSize"></label>）</span>
					</h3>
				</div>
					
				<ul class="getu" id="followA">
				
					
					
				</ul>
				
			</div>
		</div>
	
	
	
	
	
	 
	 
	<div id="footer">
    	<div class="footer1">
        <a href="" class="left"><span class="span1">独立音乐人招募计划</span></br><span class="span2">加入我们 即将与超过亿万乐迷互动</span></a>
        <a href="" class="center"><span class="span3">音乐专栏招募计划</span></br><span class="span4">加入我们 与同道中人交流心得</span></a>
        <div class="right">
       		<p class="p1">
           		<a href="">关于网易</a><span>-</span>
                <a href="">客户服务</a><span>-</span>
                <a href="">服务条款</a><span>-</span>
                <a href="">网站导航</a>
                网易公司版权所有&copy;1997-2017
            </p> 
            <p>
           		杭州网易雷火科技有限公司运营：
                <a href="">浙网文[2016]0155-055号</a>
                <a href=""><i id="write"></i>意见反馈</a> 
            </p>
        </div>
       	</div>
    </div>
    <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>				    
    
</div>
    <a href="#" title="回到顶部" id="back"></a>
    
    
    
    <script src="js/person.js"></script>
</body>
</html>