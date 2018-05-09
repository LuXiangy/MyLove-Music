<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/daoru.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
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
		<div class="daoru_content">

			<div class="g-mn6">
				<div class="g-mn6c">
					<div class="g-wrap" id="g-w" style="display: block;">
						<h3 class="f-fs1">导入MyLove Music歌曲</h3>
						<div id="ipt-pre" class="m-importbox">

							<li><label>歌曲图片：</label> <input type="file" name="photo"
								id="song_update_photo"
								 onchange="selectImage(this)" /></li>
							<li><label>歌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;词：&nbsp;</label>
								<input type="file" name="lyric" id="lyric"/></li>
							<li><label>歌曲地址：</label> <input type="file" name="saddr" 
								id="song_update_saddr" onChange="showInfo(this)";/></li>
							 <li><img id="previewImg" src="images/zanwu.jpg" width="80" height="80" /></li>
							<a class="u-btn2 u-btn2-2 u-btn2-w2 upload j-flag"
								hidefocus="true" href="#" onclick="UserAddMusic()"> <i>上
									传</i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="bottom.jsp"%>
		<%-- <div class="btmbar">
			<%@include file="page/btmbar.jsp"%>
		</div> --%>

	</div>
	<!-- <a href="" title="回到顶部" id="back"></a>
	<script src="js/showBtmbar.js"></script> -->
	<script src="js/daoru.js"></script>
	 
	<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
	 
	<script type="text/javascript">
	/* var singerInfo=[];//用来存储歌手名信息的主要获取id
	getsingerInfo();//获取歌手信息
	function getsingerInfo(){
		$.ajax({
			url:"singerServlet",
			data:"op=findAll",
			type:"POST",
			dataType:"JSON",
			success:function(data){
				data=JSON.parse(data);
				$.each(data,function(index,item){
					singerInfo[singerInfo.length]=item;
				});
			}	
		});
	}
	
	var sname="";//歌手名
	var songName="";//歌名
	function getFileName(obj) {
		var pos = obj.value.lastIndexOf("/") * 1;
		return obj.value.substring(pos + 1);
	}
	function showInfo(obj) {
		var filename =  getFileName(obj);
		alert(filename);
		var str=filename.split('-');//将歌手和歌名分割
		  sname=str[0];
		  sname=sname.substring(sname.lastIndexOf("\\")+1);//歌手
		  //alert("歌手名为:"+sname);
		  songName=str[1].substring(0,str[1].indexOf('.'));//歌名
		   
		 
	}
	function UserAddMusic() {/*用户添加歌曲 */
			//检测添加歌曲之前是否已经存在歌曲
				/*var singerId=0;//歌手id
				for(var i=0,len=singerInfo.length;i<len;i++){
		      		if($.trim(singerInfo[i].sname)==$.trim(sname)){
		      			singerId=singerInfo[i].sid;
		      		}
		      	}
				$.ajax({
					url:"songServlet",
					data:{op:"findSongByNameAndId",sname:$.trim(songName),singerId:singerId},
					type:"POST",
					dataType:"JSON",
					success:function(data){
						if(data==1){
							 alert("数据库中已经存在歌曲，请勿重复添加!!!!");
							 return;
						}else{
							/* alert(123); */
							 /* $.ajaxFileUpload({
								url:"songServlet?op=addSong",
								secureuri:false,
								fileElementId:['song_update_saddr','lyric','song_update_photo'],
								dataType:"JSON",
								data:{singerId:singerId,sname:$.trim(songName),languages:0,style:0,singerName:sname},
								success:function(data){
									if(data!=1){
										 alert("导入歌曲失败");
										 return;
									}else{
										 alert("导入歌曲成功");
										 return;
									}
								}
							});
						} 
					}	
				});*/
			 
			/* alert("歌手："+sname+"歌名:"+songName+"id:"+singerId);  */

		/* } */
	
	
	/* var image = '';
     function selectImage(file){
         if(!file.files||!file.files[0]){
             return;
         }
         var reader = new FileReader();
         reader.onload = function(evt){
             document.getElementById('previewImg').src = evt.target.result;
             image = evt.target.result;
			  
			  
         }
		
         reader.readAsDataURL(file.files[0]);
     } */
	  
	</script>
</body>
</html>

