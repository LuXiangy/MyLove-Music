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
<link rel="stylesheet" href="css/singerPerson.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav{
display:none;
}
</style>
</head>

<body>
<input type="hidden" name="usid" value="${sessionScope.currentLogin.usid}" id="usid">
<input type="hidden" name="sid" value="${sessionScope.singerHome.sid}" id="sid">
<div class="body1">

		<%
			 UserInfo userInfo1 =(UserInfo)session.getAttribute("currentLogin");
			if (userInfo1 == null) {
		%>
		<%@include file="page/login.jsp"%>
		<%
			} else {
		%>
		<%@include file="page/alLogin.jsp" %>
		<%
			}
		%>
    
    <div class="nav_1"></div>
    
		<div  class="g-bd">
			<div class="per_center">
				<dl id="head-box">
					<dt class="photo">
						<img src="${sessionScope.singerHome.photo}" />
						
					</dt>
					<dd class="per_information">
						<div  class=" per_name ">
							<div id="box">
								<div class="edit">
									<a href="dl-artist.jsp" class="u_btn">
										<img src="images/seeSinger.png" />
									</a>
								</div>
								<h2>
									<span class="per_title">${sessionScope.singerHome.sname }</span>
									<span class="lv1">
										1<i class="lv1_right"></i>
									</span>
									<i class="feama"> </i>
									
								</h2>
								<!-- <a href="#" class="u_btn">
								<img src="images/sendmessage.png">
								</a>
								&nbsp;&nbsp;&nbsp; -->
								<%-- <a href="javascript:follow(${sessionScope.singerHome.sid })" class="u_btn">
								
									<img src="images/follow.png" id="Follow"/>
									</a> --%>
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
									<strong id="follow_count">0</strong>
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
							
						</div>
						
						<div class="per_shejiao">
							<span class="shejiao"></span>
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
				
				  <div class="biaoge">
            <table class="m-table" id="myTable">
                <tr class="one">
                    <th class="first"></th>
                    <th width="400px">
                        <div class="wp">标题</div> 
                    </th> 
                    <th class="w2-1">
                        <div class="wp">时长</div>	
                    </th>
                    <th class="w3">
                       
                    </th>
                </tr> 
            </table>
            </div>
	
			</div>
		</div>
		<%@include file="bottom.jsp"%>	
    </div>
    <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>				    
    
</div>
 	<%@include file="page/addTosheet.jsp"%>
    <a href="#" title="回到顶部" id="back"></a>
    <script src="js/showBtmbar.js"></script>
    <script src="js/dl-singerPerson.js"></script>
    
    <script src="js/autocomplete.js"></script>
   <script src="js/search.js"></script>
</body>
</html>