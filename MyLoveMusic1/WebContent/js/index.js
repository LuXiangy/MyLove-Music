// 改变nav的背景
function change_bg(obj) {
	var a = document.getElementById("nv").getElementsByTagName("a");
	for (var i = 0; i < a.length; i++) {
		a[i].className = "";
	}
	obj.className = "n_tj";
}

function change_hd(obj) {
	var h = document.getElementById("head").getElementsByTagName("a");
	for (var i = 0; i < h.length; i++) {
		h[i].className = "";
	}
	obj.className = "first_a";
}

// banner
var timer;
var index = 0;

function changePic(id) {
	if (Number(id)) {
		// 如果传进来的参数是个数字(也就是说鼠标移上某一个li,触发onMouseOver事件)，清除定时器,不再轮播,显示当前图片
		clearInterval(timer);
		index = id;
	} else {
		// 网页加载之后就执行
		// 首先，判定index
		index = index % 8 + 1;// 保证index从1~8
	}

	// 设置图片
	document.getElementById("pic").setAttribute("src",
			"images/banner_" + index + ".jpg");
	document.getElementById("banner").style.backgroundImage = "url(images/"
			+ index + ".jpg)";
	// js里面没有background,只有backgroundImage

	// 改变li的class,让其高亮显示
	var ul = document.getElementById("ban_ul");
	var lis = ul.getElementsByTagName("li");
	for (var i = 0; i < lis.length; i++) {
		lis[i].setAttribute("class", "li_out");
		if (i == index - 1) {
			lis[i].setAttribute("class", "li_over");
		}
	}

}

changePic();

timer = window.setInterval("changePic()", 3000);

function start() {
	timer = window.setInterval("changePic()", 3000);
}

// 点击切换图片
var dla = document.getElementById("dla");
var dra = document.getElementById("dra");

dla.onclick = function() {
	var pic = document.getElementById("pic");
	clearInterval(timer);
	index--;
	while (index == 0) {
		index = 8;
	}
	pic.setAttribute("src", "images/banner_" + index + ".jpg");
	document.getElementById("banner").style.backgroundImage = "url(images/"
			+ index + ".jpg)";

	// 改变li的class,让其高亮显示
	var ul = document.getElementById("ban_ul");
	var lis = ul.getElementsByTagName("li");
	for (var i = 0; i < lis.length; i++) {
		lis[i].setAttribute("class", "li_out");
		if (i == index - 1) {
			lis[i].setAttribute("class", "li_over");
		}
	}
	start();
}

dra.onclick = function() {
	var pic = document.getElementById("pic");
	clearInterval(timer);
	index++;
	while (index == 9) {
		index = 1;
	}
	pic.setAttribute("src", "images/banner_" + index + ".jpg");
	document.getElementById("banner").style.backgroundImage = "url(images/"
			+ index + ".jpg)";

	// 改变li的class,让其高亮显示
	var ul = document.getElementById("ban_ul");
	var lis = ul.getElementsByTagName("li");
	for (var i = 0; i < lis.length; i++) {
		lis[i].setAttribute("class", "li_out");
		if (i == index - 1) {
			lis[i].setAttribute("class", "li_over");
		}
	}
	start();
}

// 新碟上架
var la = document.getElementById("l_a");
var ra = document.getElementById("r_a");

la.onclick = function() {
	var ul = document.getElementById("roll_ul");
	var sty = getStyle(ul, "transition");
	ul.style.left = "-645px";
	console.log(sty);
}
ra.onclick = function() {
	var ul = document.getElementById("roll_ul");
	var sty = getStyle(ul, "transition");
	ul.style.left = "0px";
	console.log(sty);
}

function getStyle(ele, name) {
	if (ele.currentStyle) { // IE下的处理
		return ele.currentStyle[name];
	} else { // 标准浏览器处理
		return getComputedStyle(ele, false)[name];
	}
}

var aud = document.getElementById("audio");

//排行榜显示
$(function($) {
	$("#nv>#a1>a").attr("class","n_tj");
	$("#head1>span>a").attr("class","first_a");
	var str="";
	
	//新歌榜
	$.post("songServlet",{op:"findAll"},function(data){
		  data= $.parseJSON(data);
		
		$.each(data,function(index,item){
			if(index<3){
				str+="<li ><span class='no'>"+(index+1)+"</span>";
				str+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='nm' title='"+item.sname+"'>"+item.sname+"</a><div class='open'>";
				str+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='bg1' title='播放'></a>";
			}else if(index<10){
				str+="<li><span >"+(index+1)+"</span>";
				str+="<a href='javascript:addClick("+item.sid+",\""+item.saddr+"\")' class='nm' title='"+item.sname+"'>"+item.sname+"</a><div class='open'>";
				str+="<a href='javascript:addClick("+item.sid+",\""+item.saddr+"\")' class='bg1' title='播放'></a>";
			}
		});
		
		$("#newSong>#ol").append($(str));
		
	},"json");
	//原创榜
	var str1="";
	$.post("songServlet",{op:"findByself"},function(data){
		  data= $.parseJSON(data);
		$.each(data,function(index,item){
			if(index<3){
				str1+="<li ><span class='no'>"+(index+1)+"</span>";
				str1+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='nm' title='"+item.sname+"'>"+item.sname+"</a><div class='open'>";
				str1+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='bg1' title='播放'></a>";
			}else if(index<10){
				str1+="<li ><span >"+(index+1)+"</span>";
				str1+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='nm' title='"+item.sname+"'>"+item.sname+"</a><div class='open'>";
				str1+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='bg1' title='播放'></a>";
			}
		});
		$("#selfinfo>#ol").append($(str1));
	},"json");
	//飙升榜
	var str2="";
	$.post("songServlet",{op:"findByClick"},function(data){
		  data= $.parseJSON(data);
		$.each(data,function(index,item){
			if(index<3){
				str2+="<li ><span class='no'>"+(index+1)+"</span>";
				str2+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='nm' title='"+item.sname+"'>"+item.sname+"</a><div class='open'>";
				str2+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='bg1' title='播放'></a>";
			}else if(index<10){
				str2+="<li ><span >"+(index+1)+"</span>";
				str2+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='nm' title='"+item.sname+"'>"+item.sname+"</a><div class='open'>";
				str2+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' class='bg1' title='播放'></a>";
			}
		});
		$("#fastest>#ol").append($(str2));
	},"json");
	
	//入驻歌手
	var singerStr="";
	$.post("singerServlet",{op:"findByclick"},function(data){
		data= $.parseJSON(data);
		$.each(data,function(index,item){
				//proposals[proposals.length]=item.sname+"----歌手";//搜索自动补全
			if(index<5){
				singerStr+="<li><a href='javascript:addSingerClick("+item.sid+")'><div class='head'><img src='"+item.photo+"' width='60px' height='60px' /></div>";
				singerStr+="<div class='info'><h4><span>"+item.sname+"</span></h4> <p>"+item.stname+"</p></div></a></li>";
			}
		});
		$("#Fivesinger").append($(singerStr));
	},"json");
	
	// 歌单获取
	var RsongSheetStr = "";
	var sss = 0;
	//var usid = $.trim($("#usid").val());
	$.post("songSheetServlet",{op : "MheadFind"},function(data) {
		data = $.parseJSON(data);
		$.each(data.rows,function(index, item) {
							if (item.ssname != "默认歌单"&& item.ssname != "我喜欢"&& item.ssname != "undefined"&& sss < 8) {
								RsongSheetStr += "<li><div class='u_cover'><img src="+ item.photo+ " /><a href='javascript:showRSongSheet("+ item.ssid+ ")' class='ul_mya' title="+ item.ssname + "></a>";
								RsongSheetStr += "<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+ item.clickRate+ "万</span></div>";
								RsongSheetStr += "</div><p class='dec'><a href='javascript:showRSongSheet("+ item.ssid+ ")' class='tit' title="+ item.ssname+ ">"+ item.ssname+ "</a> </p></li>";
								sss = sss + 1;
							}
						});
		$("#headSongSheet").append(RsongSheetStr);
	}, "json");
});
// 显示推荐歌单
function showRSongSheet(ssid) {
	$.post("songSheetServlet", {
		op : "sendSsid",
		ssid : ssid
	}, function(data) {
			location.href = "dl-RsongSheet.jsp";
	}, "text");
}
//点击入驻歌手的跳转
function addSingerClick(sid) {
	$.post("singerServlet", {
		op : "addClick",
		sid : sid
	}, function(data) {

	}, "text");
	$.post("singerServlet", {
		op : "seeHome",
		sid : sid
	}, function(data) {
		if (data > 0) {
			location.href = "dl-singerPerson.jsp"
		}
	}, "text");
}

//点击用户登录字体进行用户登录
function userLogin1(){
	var aut=document.getElementById("aut");//登录面板;
	aut.style.display="block";//登录框面板打开
}