<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MyLove Music</title>
<link rel="icon" href="images/music.ico"/>
<link rel="stylesheet" href="css/dl-download.css"/>
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav{
display:none;
}
</style>
<script type="text/javascript">
$(function(){
	$("#head4>span>a").attr("class","first_a");
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
		<%@include file="page/alLogin.jsp" %>
		<%
			}
		%>
	<div class="nav_1"></div>
    <div class="show">
    	
   		<div class="show_1">
        	 <div id="list">
             	<a href="">
                 <img  id="pic" src="images/1.png"/>
            	</a>
                <ul id="ban_ul">
                    <li onmouseover="show(1)" onmouseout="start()"></li>
                    <li onmouseover="show(2)" onmouseout="start()"></li>
                    <li onmouseover="show(3)" onmouseout="start()"></li>
           		</ul>
             </div>
             <div class="pclogo">
                <a href="javascript:void()" class="aos_download">
                    <i></i>
                    <em class="anzhuo">安卓版</em>
                    <em class="version">V3.7.2</em> 
                </a>  
                <a href="javascript:void()" class="ios_download">
                    <i></i>
                    <em class="anzhuo">iphone版</em>
                    <em class="version">V3.7.0</em> 
                </a> 
                <a href="javascript:void()" class="ipad_download">
                    <i></i>
                    <em class="anzhuo">ipad版</em>
                    <em class="version">V1.5.0</em> 
                </a>
                 <a href="javascript:void()" class="mac_download">
                    <i></i>
                    <em class="anzhuo">Mac版</em>
                    <em class="version">V1.4.4</em> 
                </a>
                 <a href="javascript:void()" class="pc_download">
                    <i></i>
                    <em class="anzhuo">PC版</em>
                    <em class="version">V2.1.0</em> 
                </a>
                <a href="javascript:void()" class="uwp">
                    <i></i>
                    <em class="anzhuo">UWP版</em>
                    <em class="version">V1.2.3</em> 
                </a>
                 <a href="javascript:void()" class="WP">
                    <i></i>
                    <em class="anzhuo">WP版</em>
                    <em class="version">V1.5.0</em> 
                </a>
                <a href="javascript:void()" class="Linux">
                    <i></i>
                    <em class="anzhuo">Linux版</em>
                    <em class="version">V1.0.0</em> 
                </a>
               <div class="pc">
                 <a href="javascript:void()" class="pcu">
                    <em></em>
                    <span class="anzhuo">PC版更新日志</span>
                </a>
             </div>
             
             </div>
             </div> 
             <div id="bg">
                 <div id="code">
                    <p>扫描二维码下载</p> 
                 </div>
             </div>
    </div>
    <div class="content_1">
    	<div class="ziti">
            <span class="span1">千万曲库 首首CD音质</span></br>
            <span class="span2">囊括百万首320Kbps超品质音乐，你在用手机听歌时，</span></br>
            <span class="span3">也能感受到CD音质，更能免费离线听歌</span> 
        </div>
        <div class="b1"><img src="images/b1.jpg" /></div>
    </div>
    <div class="content_2">
   		<div class="b2"><img src="images/b2.jpg"/></div> 
        <span class="p1">千位明星 亲自推荐音乐</span></br>
        <span class="p2">陶喆，羽泉等<a class="red">千位明星已入驻</a>，亲自创建私房歌单，录制独</span></br>
        <span class="p3">家DJ节目，推荐他们心中的好音乐</span>
    </div>
    <div class="content_3">
        <span class="p4">社交关系 发现全新音乐</span></br>
        <span class="p5">你可以<a class="red1">关注明星</a>、DJ和好友，通过浏览他们的动态、收藏和</span></br>
        <span class="p6">分享，发现更多全新好音乐</span>
        <div class="b3"><img src="images/b3.jpg"/></div> 
    </div>
    <div class="content_4">
   		<div class="b4"><img src="images/b4.jpg"/></div> 
        <span class="p7">手机电脑 歌单实时同步</span></br>
        <span class="p8">只要一个账号，你就可以同步在手机、电脑上创建、收藏</span></br>
        <span class="p9">的歌单，<a class="red2">随时随地畅享好音乐</a></span> 
    </div>
    <div class="content_5">
    	 <span class="p10">听歌识曲 助你疯狂猜歌</span></br>
        <span class="p11">歌曲很动听却不知道歌名，歌名在嘴边却想不起来</span></br>
        <span class="p12">用<a class="red1">听歌识曲</a>功能，几秒钟就知道歌名</span>
        <div class="b5"><img src="images/b5.jpg"/></div> 
    </div>
    <div class="content_6">
   		<span class="span1">MyLove音乐 听见好时光</span> 
        <span class="span2">下载MyLove音乐客户端，随时随地畅享动听好音乐</span>
        <div class="b6"><img src="images/b6.jpg" class="img1"/><a href="javascript:void()" id="a1"><img src="images/c_pc1.png"/></a></div>
        <div class="b7"><img src="images/b7.png" class="img2"/><a href="javascript:void()" id="a2"><img src="images/c_ipone1.png"/></a></div>
        <div class="b8"><img src="images/b8.jpg" class="img3"/><a href="javascript:void()" id="a3"><img src="images/c_ipad1.png"/></a></div>
        <div class="b9"><img src="images/b9.png" class="img4"/><a href="javascript:void()" id="a4"><img src="images/c_az1.png"/></a></div>
        <div class="b10"><img src="images/b10.png" class="img5"/><a href="javascript:void()" id="a5"><img src="images/c_wp1.png"/></a></div>
    </div>
	
    <%@include file="bottom.jsp"%>
    <%-- <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>
	</div> --%>
</div>
    <!-- <script src="js/showBtmbar.js"></script> -->
    
	<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>
