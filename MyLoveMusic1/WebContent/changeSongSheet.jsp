<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/setting.css" />
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/showpic.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<style>
.mynav{
display:none;
}

</style>
<script type="text/javascript">
$(function($) {

	$("#head2>span>a").attr("class", "first_a");
	var usid = $.trim($("#usid").val());
	$.post("songSheetServlet", {op : "findMy",usid : usid}, function(data) {

	}, "json");
})
var beforePhoto;

function selectFile(){  
    //触发 文件选择的click事件  
    $("#singer_update_photo").trigger("click");  
    beforePhoto="";
}
//修改歌单
function changeInfo(usid){
	var uname=$.trim($("#uname").val());
	var mark=$.trim($("#signature").val());
	var province=$.trim($("#province").val());
	var city=$.trim($("#citya").val());
	
	var birth=$.trim($("#birth_year").val())+"/"+$.trim($("#birth_month").val())+"/"+$.trim($("#birth_day").val());
	var sex= $('input[name="sex"]:checked').val();
	beforePhoto=$.trim($("#beforeStr").val());

	$.ajaxFileUpload({
		url:"userInfoServlet?op=updateUser",
		secureuri:false,
		fileElementId:"singer_update_photo",
		dataType:"text",
		data:{uname:uname,mark:mark,birth:birth,province:province,city:city,email:beforePhoto,usid:usid,sex:sex},
		success:function(data,status){
			data=parseInt($.trim(data));
			if(data>0){
				alert("修改成功");
				location.href="setting.jsp"
			}else{
				alert("修改失败");
			}
			
		}
	});
}
function getSex(){
	  var value="";
	  var radio=$("sex");
	  for(var i=0;i<radio.length;i++){
		if(radio[i].checked==true){
		  value=radio[i].value;
		  break;
		}
	  }
	  return value;
	}
  
</script>
</head>

<body>
<div class="body1">
 <input type="hidden" id="usid" value="${sessionScope.currentLogin.usid}"/>
	<%@include file="page/alLogin.jsp" %>
	
   	<div class="nav_1"></div>
    <div class="mymusic">
    	<div class="m-bd">
      		<div class="u-title">
           		<h3>
               		<span class="f-ff2">编辑歌单信息</span> 
                </h3> 
            </div> 
            <div class="u-title_1">
                <ul class="m-tabs f-cb">
                    
                    
                </ul> 
            </div> 
            
            <div class="n-base">
           		<form action="login.html"  method="post">
                	歌单名：<input style="height:33px;" type="text" name="uname"  maxlength="11"   size="50" placeholder="请输入昵称" value="${sessionScope.currentSongSheet.ssname}" id="uname"/><br/><br/><br/>
				标签<a href="">选择标签</a>
               
              
                <br/>
               
                 
                 <div class="avatar f-pr">
                 <div id="showpic" >
                 <img src="${sessionScope.currentSongSheet.photo}" width='135px' height='120px' />
                 <input type="hidden" id="beforeStr" value="${sessionScope.currentSongSheet.photo}"/>
                 </div>
                	 
                	 <input type="file" name="photo" id="singer_update_photo" onchange="setImagePreviews(this,'showpic')"   style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/>   
                     <a id="upload" class="upload" href="javascript:selectFile()" onchange="setImagePreviews(this,'singer_update_showpic')">更换头像</a>
                 </div>
                 <div class="itm ft">
                 	<a href="javascript:changeInfo(${sessionScope.currentSongSheet.usid})" class="baocun">
                    <img src="images/save.jpg"/>
                    </a>  		
                 </div>
                  </form> 
            </div>      
        </div>
    </div>
   	<div id="footer">
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
        
        
    </div>
    
    </div>
    
	
    <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%> 				    
        
</div>
	<a id="toTop" title="回到顶部" href="" hidefocus="true" style="display:none;">回到顶部</a>
    <script src="js/setting.js"></script>
</body>
</html>
