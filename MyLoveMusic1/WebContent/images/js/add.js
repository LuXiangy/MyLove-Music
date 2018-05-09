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