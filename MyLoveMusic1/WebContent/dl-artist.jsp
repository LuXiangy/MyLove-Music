<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MyLove Music</title>
<link rel="icon" href="images/music.ico"/>
<link rel="stylesheet" href="css/dl-artist.css"/>
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
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
    <div class="mynav">
    	<ul class="nav" id="nv">
        	<li><a href="dl-index.jsp" onClick="change_bg(this)"><em>推荐</em></a></li>
            <li><a href="dl-toplist.jsp" onClick="change_bg(this)"><em>排行榜</em></a></li>
            <li><a href="dl-songlist.jsp" onClick="change_bg(this)"><em>歌单</em></a></li>
            <li><a href="dl-radio.jsp" onClick="change_bg(this)"><em>主播电台</em></a></li>
            <li><a href="dl-artist.jsp"  class="n_tj" onClick="change_bg(this)"><em>歌手</em></a></li>
            <li><a href="dl-cd.jsp" onClick="change_bg(this)"><em></em></a></li>
        </ul>
     </div>
    <div class="content_left">
   		<div class="n-sgernav">
       		<h2 class="tit">推荐</h2>	
            <ul class="f-cb">
           		<li>
               		<a class="z-slt" href="javascript:findSinger()" id="recomend"  onclick="changeClass(this)">推荐歌手</a> 
                </li>
                <li>
               		<a class="cat-flag" href="javascript:findSinger()" onclick="changeClass(this)">入驻歌手</a> 
                </li> 
            </ul> 
            
            <div class="blk">
                <h2 class="tit_2">华语</h2>
                <ul class="f-cb">
                    <li>
                        <a class="cat-flag" href="javascript:findSinger(1)" onclick="changeClass(this)">华语男歌手</a> 
                        <a class="cat-flag" href="javascript:findSinger(2)" onclick="changeClass(this)">华语女歌手</a>
                        <a class="cat-flag" href="javascript:findSinger(3)" onclick="changeClass(this)">华语组合/乐队</a>
                    </li> 
                </ul> 
        	</div>
        	<div class="blk">
                <h2 class="tit_2">欧美</h2>
                <ul class="f-cb">
                    <li>
                        <a class="cat-flag" href="javascript:findSinger(4)" onclick="changeClass(this)">欧美男歌手</a> 
                        <a class="cat-flag" href="javascript:findSinger(5)" onclick="changeClass(this)">欧美女歌手</a>
                        <a class="cat-flag" href="javascript:findSinger(6)" onclick="changeClass(this)">欧美组合/乐队</a>
                    </li> 
                </ul> 
        	</div>
            <div class="blk">
                <h2 class="tit_2">日本</h2>
                <ul class="f-cb">
                    <li>
                        <a class="cat-flag" href="javascript:findSinger(7)" onclick="changeClass(this)">日本男歌手</a> 
                        <a class="cat-flag" href="javascript:findSinger(8)" onclick="changeClass(this)">日本女歌手</a>
                        <a class="cat-flag" href="javascript:findSinger(9)" onclick="changeClass(this)">日本组合/乐队</a>
                    </li> 
                </ul> 
        	</div>
             <div class="blk">
                <h2 class="tit_2">韩国</h2>
                <ul class="f-cb">
                    <li>
                        <a class="cat-flag" href="javascript:findSinger(10)" onclick="changeClass(this)">韩国男歌手</a> 
                        <a class="cat-flag" href="javascript:findSinger(11)" onclick="changeClass(this)">韩国女歌手</a>
                        <a class="cat-flag" href="javascript:findSinger(12)" onclick="changeClass(this)">韩国组合/乐队</a>
                    </li> 
                </ul> 
        	</div>
             <div class="blk">
                <h2 class="tit_2">其他</h2>
                <ul class="f-cb">
                    <li>
                        <a class="cat-flag" href="javascript:findSinger(13)" onclick="changeClass(this)">其他男歌手</a> 
                        <a class="cat-flag" href="javascript:findSinger(14)" onclick="changeClass(this)">其他女歌手</a>
                        <a class="cat-flag" href="javascript:findSinger(15)" onclick="changeClass(this)">其他组合/乐队</a>
                    </li> 
                </ul> 
        	</div>
        </div> 
       
    </div>
    <div class="content_right">
    	<div class="g-wrap1">
            <div class="g-wrap12">
                <div class="u-title-1">
                    <h3>
                        <span class="f-ff2" id="Styletitle">入驻歌手</span> 
                    </h3>         
                    <div class="more">
                         更多>
                    </div>
                </div>
            </div>
            <div class="m-sgerlist">
        	 	<ul class="m-cvrlst" id="firstsingerli">
               		
                </ul>
                
         	</div>
            <div class="g-wrap12" id="hotSingerHead">
                <div class="u-title-1">
                    <h3>
                        <span class="f-ff2">热门歌手</span> 
                    </h3>         
                </div>
            </div>
            <div class="m-sgerlist"  id="hotSingerDiv" >
        	 	<ul class="m-cvrlst" id="hotSinger">
               		
                 </ul>
           </div>
            
         </div> 
         <div class="geshou">
        	<ul class="mingzi" id="allSinger">
           		
               
            </ul> 
         </div>
         
    </div>
    
    
    
    
    <div class="footer">
   		<div class="footer1">
        <a href="" class="left"><span class="span1">独立音乐人招募</span></br><span class="span2">加入我们 即将与超过亿万乐迷互动</span></a>
        <a href="" class="center"><span class="span3">音乐专栏招募计划</span></br><span class="span4">加入我们 与同道中人交流心得</span></a>
        <div class="right">
       		<p class="p1">
           		<a href="">关于MyLove</a><span>-</span>
                <a href="">客户服务</a><span>-</span>
                <a href="">服务条款</a><span>-</span>
                <a href="">网站导航</a>
               MyLove Music公司版权所有&copy;1997-2017
            </p> 
            <p>
           		MyLove科技有限公司运营：
                <a href="">浙网文[2016]0155-055号</a>
                <a href=""><i id="write"></i>意见反馈</a> 
            </p>
        </div>
       	</div>        		 
    </div> 
    <%-- <%@include file="bottom.jsp"%> --%>
     
   </div>
    
     <div class="btmbar" >
       			<%-- <%@include file="page/btmbar.jsp"%>  --%>				    
          </div>  
            <!-- <a id="toTop" title="回到顶部" href="" hidefocus="true" style=" ">回到顶部</a> 
           <script src="js/showBtmbar.js"></script> -->
           <script src="js/dl-artist.js"></script>
   
   <script src="js/autocomplete.js"></script>
   <script src="js/search.js"></script>
</body>
</html>
