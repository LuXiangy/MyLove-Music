<%@page import="com.yc.wyyyy.bean.SongSheet"%>
<%@page import="java.util.List"%>
<%@page import="com.yc.wyyyy.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/person.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<style>
.mynav {
	display: none;
}
</style>
</head>

<body>
	<input type="hidden" name="usid" value="${sessionScope.currentLogin.usid}" id="usid">
	<div class="body1">
		<%@include file="page/alLogin.jsp"%>

		<div class="nav_1"></div>
		<div class="g-bd">
			<div class="per_center">
				<dl id="head-box">
					<dt class="photo">
						<img src="<%=userInfo.getPhoto()%>" />
						<div class="btm">
							<%-- <a href="javascript:changePhoto(<%=userInfo.getUsid()%>)">更换头像</a> --%>
						</div>
					</dt>
					<dd class="per_information">
						<div class=" per_name ">
							<div id="box">
								<div class="edit">
									<a href="setting.jsp" class="u_btn">
										<i>编辑个人资料</i>
									</a>
								</div>
								<h2>
									<span class="per_title"><%=userInfo.getUname()%></span>
									<span class="lv1">
										1<i class="lv1_right"></i>
									</span>
									<i class="feama"> </i>
								</h2>
							</div>
						</div>

						<ul class="neir">
							<li class="fst"><a class="class1" href="javascript:void(0)">
									<strong id="event_count">0</strong>
									<span class="span0">动态</span>
								</a></li>
							<li class="li1"><a class="class1" href="follow.jsp">
									<strong id="follow_count"><%=userInfo.getFollow()%></strong>
									<span class="span0">关注</span>
								</a></li>
							<li class="li1"><a class="class1" href="javascript:void(0)">
									<strong id="fan_count">0</strong>
									<span class="span0">粉丝</span>
									<i id="newCount" class="u-icn u-icn-68 f-alpha" style="display: none;"></i>
								</a></li>
						</ul>

						<div class="address">
							<span>
								所在地区：<%=userInfo.getProvince()%><%=userInfo.getCity()%></span>
							<span id="age" class="sep" data-age="794505600000">
								年龄：
								<span>95后</span>
							</span>
						</div>

						<div class="per_shejiao">
							<span class="shejiao">社交网络：</span>
							<ul class="shejiao_logo">
								<li id="1li"><a class="xinlang" title="新浪微博"></a></li>
								<li class="2li"><i class="douban" title="豆瓣网"></i></li>
						</div>
					</dd>
				</dl>


				<div id="rHeader">
					<h3>
						<span class="f-ff2 s-fc3">听歌排行</span>
					</h3>
					<!-- <h4>累积听歌13首</h4> -->
					<span>
						<a class="" href="javascript:void(0)"></a>
					</span>
					<div class=" f-cb">
						<span id="songsall" data-action="songsall">所有时间</span>
						<i></i>
						<span id="songsweek" class="z-sel" data-action="songsweek">最近一周 </span>
					</div>
				</div>

				<div class="aige">
					<div>
						<div>
							<ul>
								<li>
									<div class="hd "></div>
									<div class="song"></div>
									<div class="tops"></div>
								</li>
							</ul>
						</div>
						<div></div>
					</div>
				</div>

				<div class="gedan">
					<h3 class="gednanme">
						<span class="f-ff2">我创建的歌单（${sessionScope.currentSongSheetSize}）</span>
					</h3>
				</div>
				<%
					Object songsheet = session.getAttribute("currentSongSheet");
					List<SongSheet> songSheet = null;
					songSheet = (List<SongSheet>) songsheet;
				%>
				<ul class="getu">
					<%
						for (SongSheet s : songSheet) {
							if (s.getPhoto() == null) {
								s.setPhoto("images/yclogo.png");
							}
					%>
					<li>
						<div class="tup">
							<img src="<%=s.getPhoto()%>" width='150px' height='150px' />
							<a class="dipian"></a>
						</div>
						<p class="lo">
							<a class="dipian" title="<%=s.getSsname()%>" href=""><%=s.getSsname()%></a>
						</p>
					</li>
					<%
						}
					%>
				</ul>

			</div>
		</div>

		<%@include file="bottom.jsp"%>
		<%-- <div class="btmbar">
			<%@include file="page/btmbar.jsp"%>

		</div>
		<a href="#" title="回到顶部" id="back"></a>
		<script src="js/showBtmbar.js"></script> --%>
		<script src="js/person.js"></script>
		
		<script src="js/autocomplete.js"></script>
   		<script src="js/search.js"></script>
</body>
</html>