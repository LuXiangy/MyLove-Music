//添加歌单
var clsdlg=document.getElementById("cls-dlg");
var clsaddto=document.getElementById("cls-addTo");
var addTo=document.getElementById("addTo");
var dlg=document.getElementById("dlg");
clsdlg.onclick=function(){
	dlg.style.display="none";
}
clsaddto.onclick=function(){
	addTo.style.display="none";
}

var IsMousedown, LEFT, TOP, login;
var movaddTo=document.getElementById("mov-addTo");
movaddTo.onmousedown=function(e) {
	var e=arguments[0]||window.event;
	login = document.getElementById("addTo");
	IsMousedown = true;
	LEFT = e.clientX - parseInt(login.style.left);
	TOP = e.clientY - parseInt(login.style.top);
	document.onmousemove = function(e) {
		var e=arguments[0]||window.event;
		if (IsMousedown) {
			login.style.left = e.clientX - LEFT + "px";
			login.style.top = e.clientY - TOP + "px";
		}
	}
	document.onmouseup=function(){
		IsMousedown=false;
	}
}
var IsMousedown, LEFT, TOP, login;
var movdlg=document.getElementById("mov-dlg");
movdlg.onmousedown=function(e) {
	var e=arguments[0]||window.event;
	login = document.getElementById("dlg");
	IsMousedown = true;
	LEFT = e.clientX - parseInt(login.style.left);
	TOP = e.clientY - parseInt(login.style.top);
	document.onmousemove = function(e) {
		var e=arguments[0]||window.event;
		if (IsMousedown) {
			login.style.left = e.clientX - LEFT + "px";
			login.style.top = e.clientY - TOP + "px";
		}
	}
	document.onmouseup=function(){
		IsMousedown=false;
	}
}



var flag=0;
//将歌曲收藏到歌单中
function ToSongSheet(ssname,photo,ssid){//此ssid为歌单编号
	$.post("songSheetServlet",{op:"findSongSheet",ssid:ssname},function(data){//找寻出点击的歌单信息。
		data= $.parseJSON(data);
		/*var ss=new Array();
		for(var i=0;i<ss.length;i++){
			if(ss[i]==addoToss_sid){
				flag=1;
			}
		}*/
		 /*for(var i=0;i<data.size;i++){
			if(data[i].song ==addoToss_sid){
				flag=1;
			}
		} */
		toSheet(ssname,photo,ssid);
		/*flag=0;*/
	},"json");

}

function toSheet(ssname,photo,ssid){
	if(flag!=1){
	var usid=$.trim($("#usid").val());
		$.post("songSheetServlet",{op:"addSong",ssname:ssname,song:addoToss_sid,photo:photo,usid:usid},function(data){
			if(data>0){
					var length=parseInt($("#total_"+ssid).text());
					$("#total_"+ssid).text(length+1);
					alert("添加成功");
					$("#addTo").css("display", "none");
			}else{
				alert("该歌曲添加失败，请重新添加");
			}
		},"text")
	}else{
		$("#addTo").css("display", "none");
		alert("该歌曲已存在，请勿重复添加");
	}
}

function showAdd() {
	$('#dlg').css("display", "block");
}
$("#cls-dlg").onclick=function(){
	$('#dlg').css("display", "none");
}

function totalSong(ssname,ssid,usid){
	$.post("songSheetServlet", {op:"songSheetSong",ssname:ssname,usid:usid},function(data) {
		//data= $.parseJSON(data);
		/*alert(data);*/
		$("#total_"+ssid).html(data);
	},"json");
}
//添加新歌单
function addSongSheet(usid) {
	var usid=$.trim($("#usid").val());
	var ssname = $.trim($("#songSheetName").val());
	$.post("songSheetServlet",{op:"addsongSheet",usid:usid,ssname:ssname}, function(data) {
		if (data > 0) {
			alert("添加成功");
			/*$.post("songSheetServlet", {op : "findMy",usid : usid}, function(data) {
					
			}, "json");*/
			$('#dlg').css("display", "none");
			window.location.href="dl-music.jsp";
		} else {
			alert("添加失败");
		}
	}, "text");
}

