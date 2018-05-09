<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/dl-songlist.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
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
	<input type="hidden" value="${sessionScope.currentLogin.usid}" id="usid" />
	<div class="mynav">
    	<ul class="nav" id="nv">
        	<li><a href="dl-index.jsp"  onClick="change_bg(this)"><em>推荐</em></a></li>
            <li><a href="dl-toplist.jsp" onClick="change_bg(this)"><em>排行榜</em></a></li>
            <li><a href="dl-songlist.jsp" class="n_tj" onClick="change_bg(this)"><em>歌单</em></a></li>
            <li><a href="dl-radio.jsp" onClick="change_bg(this)"><em>主播电台</em></a></li>
            <li><a href="dl-artist.jsp" onClick="change_bg(this)"><em>歌手</em></a></li>
            <li><a href="dl-cd.jsp" onClick="change_bg(this)"><em></em></a></li>
        </ul>
     </div>
    <div class="s-bd" id="bd">
    	<div class="all">
        	<div class="u-title">
            	<h3>
                	<span class="s-all" id="nowStyle">全部</span>
                    <a href="javascript:void(0)" class="u-a" id="hidden-link">
                        <i>选择分类<em class="u-icn"></em></i>
                    </a>
                </h3>
                <div class="u-btn">
                	<a href="#" class="a1">热门</a>
                    <a href="#" class="a2">最新</a>
                </div>
            </div>
            <div id="hiddenBox" class="select" style="display:none;">
            	<div class="hd">
                	<i class="icn">
                    	
                    </i>
                </div>
                <div class="bd">
                	<h3><a href="javascript:showAllSongSheet()" class="a-btn"><em>全部风格</em></a></h3>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-0"></i>语种</dt>
                        <dd id="songSheet_languages">
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-1"></i>风格</dt>
                        <dd id="songSheet_style">
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-2"></i>场景</dt>
                        <dd id="songSheet_scene">	
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-3"></i>情感</dt>
                        <dd id="songSheet_emotion">	
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-4"></i>主题</dt>
                        <dd class="last" id="songSheet_theme">	
                        </dd>
                    </dl>
                </div>
                <div class="ft"></div>
            </div>
            <ul class="gd" id="SongSheetShow">
            	
            </ul>
            <!-- <div id="page">
            	<div class="u-page" id="u-p">
                	<input type="button" class="prev" value="上一页" onClick="pre()" />
                    <a href="songlist.html" class="selected" onClick="change_pg(this)">1</a>
                    <a href="songlist2.html" class="a" onClick="change_pg(this)">2</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">3</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">4</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">5</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">6</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">7</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">8</a>
                    <span class="el">...</span>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">42</a>
                    <input type="button" class="nex" value="下一页" onClick="next()" />
                </div>
            </div> -->
        </div>
    </div>
			<%@include file="bottom.jsp"%>    
   <%--  <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>
    </div> --%>
    
   	 				    
    
</div>
	<%-- <%@include file="page/addTosheet.jsp"%> --%>
    <!-- <a href="" title="回到顶部" id="back"></a>
    <script src="js/showBtmbar.js"></script> -->
    <script src="js/dl-songlist.js"></script>
    
    <script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>
