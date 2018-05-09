<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MyLove Music</title>
<link rel="icon" href="images/music.ico"/>
<!-- <link rel="stylesheet" href="css/dl-toplist.css"/> -->
<link rel="stylesheet" href="css/RsongSheet.css"/>
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script>

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
   <div class="mynav">
    	<ul class="nav" id="nv">
        	<li><a href="dl-index.jsp" onClick="change_bg(this)"><em>推荐</em></a></li>
            <li><a href="dl-toplist.jsp"   onClick="change_bg(this)"><em>排行榜</em></a></li>
            <li><a href="dl-songlist.jsp" onClick="change_bg(this)"><em>歌单</em></a></li>
            <li><a href="dl-radio.jsp" onClick="change_bg(this)"><em>主播电台</em></a></li>
            <li><a href="dl-artist.jsp" onClick="change_bg(this)"><em>歌手</em></a></li>
            <!-- <li><a href="dl-cd.jsp" onClick="change_bg(this)"><em></em></a></li> -->
        </ul>
     </div>
   
<input type="hidden" value="${sessionScope.currentLogin.usid }" id="usid"/>
     <input type="hidden" value="${sessionScope.ssid}" id="ssid"/>
    <div class="content_right">
   		<div class="g-wrap">
       		<div class="cnt">
            	<div class="msk1">
           			<img src="images/bs.jpg" width="200px" height="200px" id="songSheetPhoto"/> 
                    <span id="msk"></span>
                </div>
                <div class="m-info">
               		<div class="f-cb" id="headF_cb">
                   		 <h2 class="f-ff2"  id="songSheetName"></h2>
                    </div> 
                    <div class="user">
<!-- <img src="../fileUploadPath/1503219523067_6769.jpg" style="float:left" width="35px" height="35px"  id="personphoto" /> -->
                       
                        <span class="s-fc4" style="color:blue;" onclick="person()" id="personname">熟读深思</span>
                    </div>
                    <div class="btns">
                    
                   		<a class="play" href="javascript:playSongSheet2(${sessionScope.ssname})" id="playAll">
                       		<span>播放</span> 
                            <a class="tj" href=""></a>
                        </a>
                        <a class="ysc" href="javascript:CollectionSS(${sessionScope.ssid })">
                       		<span>(0)</span> 
                        </a>
                        <a class="fx">
                       		<span>(864)</span> 
                        </a>
                        <a class="down">
                       		<span>下载</span> 
                        </a>
                        <a class="talk">
                       		<span>(39149)</span> 
                        </a>
                    </div>
                   <!--  <div id="mark" class="btns"><span style="float:left;">标签：</span></div> -->
                </div>
            </div> 
        </div> 
        <div class="g-wrap12">
        	<div class="u-title-1">
            	<h3>
               		<span class="f-ff2">歌曲列表</span> 
                </h3>
                <span class="sub">
               		<span id="totalSong" style="margin-left:100px">0</span>
                    首歌 
                </span>
                <div class="more">
                播放
               		<strong class="play-count" id="clickRate"></strong>
                     次
                </div>
            </div>
        </div>
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
                        <div class="wp">歌手</div> 
                    </th>
                </tr> 
               
                
               	
                	
                
            </table>
            <div class="g-wrap12">
        	<div class="u-title-1">
            	<h3>
               		<span class="f-ff2">评论</span> 
                </h3>
               <span class="sub" style="margin-left:150px">
               		
                    共0条评论 
                </span>
               		
              
                
            </div>
        </div>
        <div class="pinglun">
       		<div class="head">
            	<img src="images/default_avatar.jpg"/>
            </div> 
            <div class="pl_sjx">
           		<img src="images/pl_sjx.png"/> 
            </div>
            <div class="m-cmmtipt">
           		<textarea  class="area" placeholder="评论" style="width:585px "></textarea> 
            </div>
            <div class="f-cb">
           		<i class="u-icn-36"></i> 
                <i class="u-icn-41"></i> 
                <a href="" class="u-btn-1">评论</a>
                <span class="zs">140</span>
            </div>
        </div>
        <!-- <div class="cmmts">
            <div class="u-page">
           		<div class="u-page_1">
                	<a class="zprv" href="">上一页</a>
                    <a class="zpg1" href="">1</a>
                    <a class="zpg2">2</a>
                    <a class="zpg2">3</a>
                    <a class="zpg2">4</a>
                    <a class="zpg2">5</a>
                    <a class="zpg2">6</a>
                    <a class="zpg2">7</a>
                    <a class="zpg2">8</a>
                    <span class="zdot">...</span>
                    <a class="zpg2">1968</a>
                    <a class="zprv_1" href="">下一页</a>
                </div> 
            </div>
            
        </div> -->
        </div> 	
    </div>
    
  </div>
  <%--  <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>
   </div>     
    
    <a id="toTop" title="回到顶部" href="" hidefocus="true"  style="display:none;">回到顶部</a>
   	<script src="js/showBtmbar.js"></script>--%> 	
  	<script src="js/dl-RsongSheet.js"></script>
  	
  	<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>
