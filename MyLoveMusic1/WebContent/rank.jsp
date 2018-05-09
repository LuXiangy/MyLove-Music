<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/rank.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav{
display:none;
}
</style>
</head>

<body>
<div class="body1">
	<%@include file="page/alLogin.jsp" %>
    
    <div class="nav_1"></div>
    
    
    
    
    
    <div class="rank_content">
    	<div class="n-mylv">
    		<div class="n-lv">
    			<div class="h3">当前等级&nbsp;:
    				<span class="n-level-big">
    					1<i></i>
    				</span>
					<span class="n-level-tips">等级数据每天早上6点更新</span>
    			</div>
				<div class="sub">
					<div class="subbg">
						<div style="width:131.33333333333334px;">
							<span></span>
						</div>
					</div>
					<div class="subnum">
						<div class="divison">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							<span></span>
						</div>
						<div class="divnum">
							<ul>
								<li class="z-ov">0</li>
								<li class="z-on">1</li>
								<li class="">2</li>
								<li class="">3</li>
								<li class="">4</li>
								<li class="">5</li>
								<li class="">6</li>
								<li class="">7</li>
								<li class="">8</li>
								<li class="">9</li>
								<li class="">10</li>
							</ul>
						</div>
					</div>
				</div>
    		</div>
			<div class="n-pow">
				<div class="h3">当前等级特权：</div>
				<div class="telist">
					<ul class="j-flag">
						<li>5G音乐云盘免费容量</li>
					</ul>
				</div>
				<div class="aboutmore">
					<a href="/level/details">了解等级特权></a>
				</div>
			</div>
			<div class="n-nextlv">
				<div class="h4">
					距离下一个等级：
					<span class="n-level">
						2<i></i>
					</span>
					<span class="n-iconpoint">
						<a class="icon u-icn2 u-icn2-5 j-flag" href="javascript:void(0)"></a>
					</span>
				</div>
				<div class="uitl">
					<span class="tit">听歌：</span>
					<div class="bar">
						<div class="barbox1">
							<span style="width:46.666666666666664%;"></span>
						</div>
					</div>
					还需听歌16首
				</div>
				<div class="uitl">
					<span class="tit">登录：</span>
						<div class="bar">
							<div class="barbox">
								<span style="width:100%;"></span>
							</div>
						</div>
						还需登录0天
				</div>
			</div>
    	</div>
    </div>
    	<%@include file="bottom.jsp"%>	
    
      <%--   <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>	
         </div> --%>
  <!--   <a href="" title="回到顶部" id="back"></a>
    <script src="js/showBtmbar.js"></script> -->
    
    <script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>
