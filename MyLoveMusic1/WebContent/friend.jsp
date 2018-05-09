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
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav{
display:none;
}
</style>
<script type="text/javascript">
$(function(){

	$("#head3>span>a").attr("class","first_a");
})
</script>
</head>
<body>
<div class="body1">
	<%@include file="page/login.jsp" %>

<div class="nav_1"></div>
    
    
    
    
    
   
   <div id="content">
    	<div id="content_top">
    		<span class="b">你可以关注明星和好友品味他们的私房歌单</br>通过他们的动态发现更多精彩音乐 </span>
    		<div id="content2">
    		
    		</div>
    	</div>
    </div>
	
	
	
	
	
	
	
   <!-- <div id="footer">
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
    </div> -->
     <%@include file="bottom.jsp" %>
     </div>
  
    
    <%-- <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>				    
    
    
</div> --%>
    <a href="#" title="回到顶部" id="back"></a>
    <script src="js/friend.js"></script>
</body>
</html>
