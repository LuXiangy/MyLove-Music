<%@page import="java.util.List"%>
<%@page import="com.yc.wyyyy.bean.SongSheet"%>
<%@page import="com.yc.wyyyy.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/dl-music.css" />
<link rel="stylesheet" href="easyui/css/easyui.css">
<link rel="stylesheet"  href="easyui/css/icon.css">
<link rel="stylesheet"  href="easyui/css/demo.css">
<link rel="stylesheet" href="css/autocomplete.css">

<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="easyui/js/jquery.min.js"></script>
<script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/showpic.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<style type="text/css">
.mynav {
	display: none;
}
</style>
</head>

<body id="MyBody">
	<input type="hidden" value="${sessionScope.currentLogin.usid}"
		id="usid" />
		<!-- <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width:120px;">
									<div data-options="name:'play'">播放</div>
									<div>
										<span>下一首播放</span>
									</div>
									<div data-options="iconCls:'icon-save',name:'share'">分享</div>
									<div data-options="iconCls:'icon-save',name:'change'" >编辑歌单</div>
									<div data-options="iconCls:'icon-print',disabled:true">下载全部</div>
									<div class="menu-sep"></div>
									<div data-options="name:'delete'">删除歌单</div>
							</div> -->
	<div class="body1">

		<div id="header">
			<%@include file="page/alLogin.jsp"%>
		</div>
		<div class="nav_1"></div>
		<div class="mymusic" id="mySongSheet">
			<div class="m-bd">
				<div class="bd-l" >
					<div class="l-1">
						<a href="javascript:showMy()" class="n-s"><i></i>创建的歌单(<label id="totalsize"></label>)</a>
						<a href="javascript:showAdd()" onclick="showAdd()" class="n-a"><i>新建</i></a>
					</div>
					<div id="mySongSheethhh">
						
							
				</div>
				<!-- <div class="l-2">
						<a href="javascript:showCollect()" class="n-s"><i></i>收藏的歌单(<label id="allCollect">0</label>)</a>
				</div> -->
				<div id="myCollectSongSheet">
				</div>
			</div>
				
						
				<div class="bd-r">
	<div class="content_right" id="showSSheet">
   		<div class="g-wrap">
       		<div class="cnt">
            	<div class="msk1">
           			<img src="images/MyLikeBg.png" width="200px" height="200px" id="songsheetPhoto"/> 
                    <span id="msk"></span>
                </div>
                <div class="m-info" id="headerMark">
               		<div class="f-cb" id="headF_cb">
                   		 <h2 class="f-ff2" id="songsheetName"></h2>
                    </div> 
                    <div class="user">
                        <img src="${sessionScope.currentLogin.photo }" width="35px" height="35px" style="float:left" id="personphoto"/>
                        <span class="s-fc4" style="color:blue;" onclick="person()" id="personname">${sessionScope.currentLogin.uname }</span>
                    </div>
                    <div class="btns">
                   		<a class="play" href='javascript:playSongSheet2(\""+${sessionScope.ssname}+"\")' id="playAll">
                       		<span>播放</span> 
                            <a class="tj"  href=""></a>
                        </a>
                       
                        <a class="fx">
                       		<span>(0)</span> 
                        </a>
                        <a class="down">
                       		<span>下载</span> 
                        </a>
                        <a class="talk">
                       		<span>(0)</span> 
                        </a>
                    </div>
                    
                </div>
            </div> 
        </div> 
        <div class="g-wrap12">
        	<div class="u-title-1">
            	<h3>
               		<span class="f-ff2">歌曲列表</span> 
                </h3>
                <span class="sub">
               		<span id="totalSong" style="margin-left:100px"></span>首歌 
                </span>
                <div class="more">播放<strong class="play-count" id="clickRate"></strong>次
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
      
        </div> 	
    </div>
				<div id="changeInfo" style="display:none;margin-left:30px">
					<div class="u-title">
		           		<h3>
		               		<span class="f-ff2" style="font-size:20px">编辑歌单信息</span> 
		               		
		               		
		               		
		                </h3> 
		                <br/><br><br/><br>
		                <hr/>
		            </div> 
		            <div class="n-base" style="margin-top:34px">
		           		<form action="login.html"  method="post">
		           		<br><br>
		                	歌单名：&nbsp;&nbsp;  <input style="height:33px;" type="text" name="uname"  maxlength="11"   size="30" placeholder="请输入昵称"  id="ssname"/><br/><br/><br/>
						
						标签：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				
                	
                    <a href="javascript:showBox()"id="hidden-link">
                       <i style="color:blue">选择标签</i>
                    </a>
                    <span id="mask">
               </span>
                  
		   <div class="all">
        	
            <div id="hiddenBox" class="select" style="display:none;">
           
		<div class="bar" id="mov-hidden">
			<div class="tt">选择标签</div>
		</div>
		<div class="n-log" id="changeSs">	
                <div class="bd" >
                	
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
                
                <a
							href="javascript:addStyle()"
							class="u-dl" id="sure"><i>确&nbsp;&nbsp;认</i></a>	
							<br/>	<br/>
                </div>
              <span class="cls" title="点击关闭" id="cls-2" onclick="close()">×</span>
            </div>
      
            </div>
		                
		                 <div class="avatar f-pr">
		                 <div id="showpic" >
		                 <img src="images/MyLikeBg.png"  width='140px' height='120px' id="mysPhoto"/>
		                 <input type="hidden" id="beforeStr" />
		                 </div>
		                	 
		                	 <input type="file" name="photo" id="singer_update_photo" onchange="setImagePreviews(this,'showpic')"   style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/>   
		                     <a id="upload" class="upload" href="javascript:selectFile()" onchange="setImagePreviews(this,'singer_update_showpic')">更换头像</a>
		                 </div>
		                 <div class="itm ft">
		                 	<a href="javascript:changeSongSheet()" class="baocun" id="save">
		                    <img src="images/save.jpg"/>
		                    </a>  		
		                 </div>
		                  </form> 
		            </div>      
				</div>
			</div>
		</div>
</div>

		<%-- <div class="btmbar">
			<%@include file="page/btmbar.jsp"%>
		</div> --%>
	</div>
	

	<!-- <script src="js/showBtmbar.js"></script> -->
	<%@include file="page/addTosheet.jsp"%>
 	<script src="js/dl-music.js"></script>
 	
 	<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
	
</body>
</html>
