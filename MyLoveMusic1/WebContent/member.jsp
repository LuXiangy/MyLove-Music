<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/member.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav {
	display: none;
}
</style>
</head>

<body>
	<div class="body1">
		<%@include file="page/alLogin.jsp"%>
		<div class="nav_1"></div>
		<div class="member_content">
			<div class="n-top f-pr">
				<div class="n-head f-cb">
					<div class="avatar">
						<img src="${sessionScope.currentLogin.photo}" />
					</div>
					<div class="info f-pr" style="display:;">
						<h2 class="s-fc0 f-ff2">
							${sessionScope.currentLogin.uname} <i class="u-icn2 "></i>
						</h2>
						<div class="f-fs1 ">当前未开通</div>
						<a class="btn" data-action="vip" href="">立即开通</a> <a
							class="btn btn-gray" data-action="friend" href="">给好友购买</a> <a
							class="btn btn-gray" data-action="usecode" href="">使用兑换码</a>
					</div>
				</div>
			</div>
			<div class="n-special">
				<h2 class="f-pr">
					<div class="line f-pa"></div>
					<div class="title f-ff2">会员特权</div>
				</h2>
				<div class="sq">
					<div class="sq">
						<h3>
							<i class="icn s-bg s-bg-1"></i> <em class="f-ff2">试听下载无损品质（SQ）</em>
						</h3>
						<div class="pic"></div>
					</div>
				</div>
				<div class="song">
					<h3>
						<i class="icn s-bg s-bg-1"></i> <em class="f-ff2">会员专属付费专辑</em> <span
							class="f-fr"> <a class="s-fc7" href="/member/album">查看全部</a>
							<i class="u-gt f-ff1 s-fc7">></i>
						</span>
					</h3>
					<ul class="songlist f-cb">
						<li><a class="cover f-pr" href=""> <img class="f-img"
								src="images/CD1.jpg" /> <span
								class="mask f-pa f-alpha"></span>
						</a></li>
						<li><a class="cover f-pr" href=""> <img class="f-img"
								src="images/CD2.jpg" /> <span
								class="mask f-pa f-alpha"></span>
						</a></li>
						<li><a class="cover f-pr" href=""> <img class="f-img"
								src="images/CD3.jpg" /> <span
								class="mask f-pa f-alpha"></span>
						</a></li>
						<li><a class="cover f-pr" href=""> <img class="f-img"
								src="images/CD4.jpg" /> <span
								class="mask f-pa f-alpha"></span>
						</a></li>
					</ul>
				</div>
			</div>

			<div class="n-faq">
				<a class="link s-fc4" href="javascript:" data-action="faq"> <i
					class="icn s-bg s-bg-2"></i> 常见问题解答
				</a>
			</div>
		</div>
			<%@include file="bottom.jsp"%>	
		<%-- <div class="btmbar">
			<%@include file="page/btmbar.jsp"%>

		</div> --%>
		<!-- <a href="" title="回到顶部" id="back"></a> -->
		<!-- <script src="js/showBtmbar.js"></script> -->
		
		<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>
