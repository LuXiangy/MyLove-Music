<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/friend.css" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav {
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {

		$("#head3>span>a").attr("class", "first_a");
	})
</script>
</head>
<body>
	<div class="body1">
		<%
			Object ll = session.getAttribute("currentLogin");
			if (ll == null) {
		%>
		<%@include file="page/login.jsp"%>
		<%
			} else {
		%>
		<%@include file="page/alLogin.jsp"%>
		<%
			}
		%>

		<div class="nav_1"></div>


		<div id="content">
			<div id="content_top">
				<span class="b">你可以关注明星和好友品味他们的私房歌单</br>通过他们的动态发现更多精彩音乐
				</span>
				<div id="content2"></div>
			</div>
		</div>

			<%@include file="bottom.jsp"%>
		<%-- <div class="btmbar">
			<%@include file="page/btmbar.jsp"%>
		</div> 
		<a href="#" title="回到顶部" id="back"></a>
		<script src="js/showBtmbar.js"></script>--%>
		<script src="js/friend.js"></script>
		
	<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>
