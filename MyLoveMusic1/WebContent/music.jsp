<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/music.css" />
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav {
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {

		$("#head2>span>a").attr("class", "first_a");
	})
	var aut=document.getElementById("aut");//登录面板;
	function mlogin(){
		aut.style.display="block";//登录框面板打开
	}
</script>
</head>
<body>
	<div class="body1">
		<%@include file="page/login.jsp"%>
		<div class="nav_1"></div>
		<div id="content">
			<div id="content_bg">
				<div id="content3">
					<a href="javascript:mlogin()"></a>
				</div>
			</div>
		</div>
		<%@include file="/bottom.jsp" %>
		<div class="btmbar">
			<%@include file="page/btmbar.jsp"%>
		</div>
	</div>
	<a href="" title="回到顶部" id="back"></a>
	<script src="js/showBtmbar.js"></script>
	<script src="js/login.js"></script>
</body>
</html>