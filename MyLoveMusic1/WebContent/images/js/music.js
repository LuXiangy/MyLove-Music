//function show () {
//	var itms=document.getElementById("rdlist").getElementsByTagName("itm");
//	var color;
//	for (var i=0;i<trs.length;i++) {
//		itms[i].onmouseover=function () {
//			color=this.style.background;
//			this.style.background="#999";
//		};
//		itms[i].onmouseout=function () {
//			this.style.background=color;
//		}
//		
//	}
//	
//}
//"回到顶部"按钮的显示或隐藏
document.getElementsByClassName("body1")[0].onscroll = function() {
	var top = document.getElementsByClassName("body1")[0].scrollTop;

	if (top > 0) {

		document.getElementById("back").style.display = "block";
	} else {

		document.getElementById("back").style.display = "none";
	}
}
// 改变nav的背景
function change_hd(obj) {
	var h = document.getElementById("head").getElementsByTagName("a");
	for (var i = 0; i < h.length; i++) {
		h[i].className = "";
	}
	obj.className = "first_a";
}

// 获焦失焦
var ipt = document.getElementById("ipt");
ipt.onfocus = function() {
	if (ipt.placeholder != "") {
		ipt.placeholder = "";
	} else if (ipt.value == "") {
		onblur();
	} else {
		ipt.setAttribute("value", this.value);
	}
}
ipt.onblur = function() {
	ipt.placeholder = "单曲/歌手/专辑/歌单/MV/用户";
}

// 登录框
var other = document.getElementById("other");
var sj = document.getElementById("sj");
var IsMousedown, LEFT, TOP, login;
var mov = document.getElementById("mov");
console.log(mov);
mov.onmousedown = function(e) {
	var e = arguments[0] || window.event;
	login = document.getElementById("aut");
	IsMousedown = true;
	LEFT = e.clientX - parseInt(login.style.left);
	TOP = e.clientY - parseInt(login.style.top);
	document.onmousemove = function(e) {
		var e = arguments[0] || window.event;
		if (IsMousedown) {
			login.style.left = e.clientX - LEFT + "px";
			login.style.top = e.clientY - TOP + "px";
		}
	}
	document.onmouseup = function() {
		IsMousedown = false;
	}
}
var aut = document.getElementById("aut");
var login = document.getElementById("login");
var cls = document.getElementById("cls");
login.onclick = function() {
	aut.style.display = "block";
}
cls.onclick = function() {
	aut.style.display = "none";
}
sj.onclick = function() {
	aut.style.display = "none";
	aut1.style.display = "block";
}
other.onclick = function() {
	aut.style.display = "block";
	aut1.style.display = "none";
}

// 手机号登陆
var sjdl = document.getElementById("sjdl");
var aut1 = document.getElementById("aut-phone");
var IsMousedown, LEFT, TOP, login;
var mov1 = document.getElementById("mov-1");
var cls1 = document.getElementById("cls-1");
var wyyx = document.getElementById("wyyx");
var wydl = document.getElementById("wydl");
console.log(mov1);
mov1.onmousedown = function(e) {
	var e = arguments[0] || window.event;
	login = document.getElementById("aut-phone");
	IsMousedown = true;
	LEFT = e.clientX - parseInt(login.style.left);
	TOP = e.clientY - parseInt(login.style.top);
	document.onmousemove = function(e) {
		var e = arguments[0] || window.event;
		if (IsMousedown) {
			login.style.left = e.clientX - LEFT + "px";
			login.style.top = e.clientY - TOP + "px";
		}
	}
	document.onmouseup = function() {
		IsMousedown = false;
	}
}
sjdl.onclick = function() {
	aut.style.display = "none";
	aut1.style.display = "block";
}
wyyx.onclick = function() {
	aut1.style.display = "block";
}
wydl.onclick = function() {
	aut.style.display = "none";
	aut1.style.display = "block";
}
cls1.onclick = function() {
	aut1.style.display = "none";
}

// 注册
var zc = document.getElementById("aut-zc");
console.log(zc);
var zc1 = document.getElementById("zc-1");
var zc2 = document.getElementById("zc-2");
var cls2 = document.getElementById("cls-2");
var ret = document.getElementById("ret1");
zc1.onclick = function() {
	zc.style.display = "block";
	aut1.style.display = "none";
	aut.style.display = "none";
}
zc2.onclick = function() {
	zc.style.display = "block";
	aut1.style.display = "none";
	aut.style.display = "none";
}
cls2.onclick = function() {
	zc.style.display = "none";
}
ret.onclick = function() {
	zc.style.display = "none";
	aut.style.display = "block";
}
var IsMousedown, LEFT, TOP, login;
var mov2 = document.getElementById("mov-2");
mov2.onmousedown = function(e) {
	var e = arguments[0] || window.event;
	login = document.getElementById("aut-zc");
	IsMousedown = true;
	LEFT = e.clientX - parseInt(login.style.left);
	TOP = e.clientY - parseInt(login.style.top);
	document.onmousemove = function(e) {
		var e = arguments[0] || window.event;
		if (IsMousedown) {
			login.style.left = e.clientX - LEFT + "px";
			login.style.top = e.clientY - TOP + "px";
		}
	}
	document.onmouseup = function() {
		IsMousedown = false;
	}
}

// 设置移入移出事件
var btmbar = document.getElementsByClassName("btmbar")[0];
btmbar.addEventListener("mouseover", btmover, false);
// btmbar.onmouseover=btmover;
function btmover() {

	btmbar.style.bottom = "0px";
}
btmbar.addEventListener("mouseout", btmOut, false)
// btmbar.onmouseout= btmOut;
function btmOut() {
	btmbar.style.bottom = "-46px";
}

// 对锁加点击事件
var flg = true;

var btn = document.getElementsByClassName("btn")[0];
btn.addEventListener("click", aaa);
function aaa() {
	if (flg) {
		btn.style['background-position-x'] = '-100px';
		btmbar.removeEventListener("mouseout", btmOut)
		btmbar.style.bottom = "0px";
	} else {
		btmbar.addEventListener("mouseout", btmOut, false)
		btn.style['background-position-x'] = '-80px';
	}
	;
	flg = !flg;
}

// 音乐播放器
// 播放/暂停
function playOrPause(obj) {
	if (audio.paused) {
		audio.play();
		run();
	} else {
		audio.pause();
	}
}
function aa() {
	var bb = document.getElementById("ply1");
	bb.style['background-position-y'] = '-165px';
}
function cc() {
	var dd = document.getElementById("ply1");
	dd.style['background-position-y'] = '-204px';
}

// 上一首和下一首
function shang(obj) {
	var ply = document.getElementById("ply1");
	audio.src = "music/刘涛 - 说不出口.mp3";
	audio.play();
	ply.style['background-position-y'] = '-165px';
	var rdy = document.getElementsByClassName("rdy")[0];
	rdy.style.width = "0";
	run();
	var na = document.getElementById("na");
	var st = document.getElementById("st");
	na.innerText = "说不出口";
	st.innerText = "刘涛";
}

function xia(obj) {
	var ply = document.getElementById("ply1");
	audio.src = "music/PICO太郎 - Pen Pineapple apple Pen - Hoaprox remix.mp3";
	audio.play();
	ply.style['background-position-y'] = '-165px';
	var rdy = document.getElementsByClassName("rdy")[0];
	rdy.style.width = "0";
	run();
	var na = document.getElementById("na");
	var st = document.getElementById("st");
	na.innerText = " Pen Pineapple apple Pen - Hoaprox remix";
	st.innerText = "PICO太郎";
}

// 进度条
var timeout;
function run() {
	if (audio.paused) {
		setTimeout("run", "100000");
	} else {
		var rdy = document.getElementsByClassName("rdy")[0];
		rdy.style.width = parseInt(rdy.style.width) + 2 + "px";
		var curr = getCurrentTime();
		var myem = document.getElementById("myem");
		myem.innerText = curr;
		if (rdy.style.width == "100%") {
			clearInterval(timeout);
		}
	}

}
timeout = window.setInterval("run()", 1000);

// 获取播放时间
function getCurrentTime() {
	var time = audio.currentTime;
	var minute = parseInt(time / 60);
	var second = parseInt(time % 60);
	var t = toTwo(minute) + ":" + toTwo(second);
	return t;
}
function toTwo(n) {
	return n < 10 ? "0" + n : "" + n;
}

// 音量
function vol() {
	var vo = document.getElementById("volu");
	if (vo.style.display == "none") {
		vo.style.display = "block";
	} else {
		vo.style.display = "none";
	}
}
function volu(type) {
	if (type == "up") {
		var volume = audio.volume + 0.1;
		if (volume >= 1) {
			volume = 1;
		}
		audio.volume = volume;
	} else if (type == 'down') {
		var volume = audio.volume - 0.1;
		if (volume <= 0) {
			volume = 0;
		}
		audio.volume = volume;
	}
	document.getElementById("volu").innerHTML = Math.round(audio.volume * 100);
}

// 快捷键
document.onkeydown = function(event) {
	var e = arguments[0] || window.event;
	var keycode = e.keyCode;
	// 空格 -> 播放暂停
	if (keycode == 32) {
		playOrPause();
		var dd = document.getElementById("ply1");
		dd.style['background-position-y'] = '-204px';
	}
	// ctrl + ↑ -> 音量+
	if (e.ctrlKey && keycode == 38) {
		volu("up");
	}
	if (e.ctrlKey && keycode == 39) {
		audio.currentTime = audio.currentTime + 5;
	}
	// ctrl + ↓ -> 音量-
	if (e.ctrlKey && keycode == 40) {
		volu("down");
	}
}

function mlogin() {
	$("#aut").css("display", "block");
}

function userLogin() {
	var tel = $.trim($("#usertel").val());
	var pwd = $.trim($("#userpwd").val());
	if (tel == "" || pwd == "") {
		alert("请输入完整信息");
		return;
	}
	$.post("userInfoServlet", {
		op : "userLogin",
		tel : tel,
		pwd : pwd
	}, function(data) {
		data = parseInt($.trim(data));
		if (data != null) {
			location.href = "dl-index.jsp";
		} else {
			alert("登录失败,手机号或密码错误");
		}
	}, "text");
}

// 手机注册时，点击的下一步
function next1() {
	var tel = $("#tel");
	var password = $("#zcpwd");
	var i = $("#earning i:eq(0)");
	var earning = $("#earning");
	var regNext = $("#aut-zc-next");
	var reg = $("#aut-zc");
	if (tel.val() == "") {
		earning.css("display", "block");
		earning.html("<i></i>请输入手机号码");
	} else if (tel.val().length != 11) {
		earning.css("display", "block");
		earning.html("<i></i>请输入11位数字的手机号");
	} else if (!tel.val().match(/^1[34578]\d{9}$/)) {
		earning.css("display", "block");
		earning.html("<i></i>手机号码格式不正确");
	} else if (password.val() == "") {
		earning.css("display", "block");
		earning.html("<i></i>请输入登录密码");
	} else if (!password.val().match(/^[\w\W]{6,16}$/)) {
		earning.css("display", "block");
		earning.html("<i></i>请输入6-16位的密码");
	} else {
		$.ajax({
			type : "POST",
			url : "userInfoServlet?op=sendMessage",
			data : "tel=" + tel.val(),
			dataType : "JSON",
			success : function(data) {
				if (data > 0) {
					reg.css("display", "none");
					var zctelX = $("#zctelX");
					var telX = tel.val();
					telX = telX.substring(0, 3) + "****" + telX.substring(7);
					zctelX.text(telX);
					regNext.css("display", "block");
					settime();
				} else {
					tel.val("");
					password.val("");
					alert("该手机已经被注册过！！！")
				}
			}
		});
	}
}
var countdown = 59;
function settime() {
	var a = $("#sendAgain");
	var save = $("#sendAgain i:eq(0)");
	if (countdown == 0) {
		a.attr("href", "javascript:settime()");
		save.html("重新发送");
		countdown = 59;
		clearTimeout(i);
		return;
	} else {
		a.removeAttr('href');
		if (countdown < 10) {
			save.html("00:0" + countdown);
		} else {
			save.html("00:" + countdown);
		}

		countdown--;
	}
	var i = setTimeout(function() {
		settime()
	}, 1000)
}

// 获取到验证码，然后点击的下一步
function nextCode() {
	var zcCode = $("#aut-zc-next");// 注册输入验证码面板
	var zcName = $("#aut-zc-uname");// 注册取名面板
	var sendAgain = $("#code").val();// 输入的验证码
	var earningCode = $("#earningCode");
	if (sendAgain == "") {
		earningCode.css("display", "block");
		earningCode.html("<i></i>请输入验证码");
	} else {
		$.ajax({
			type : "POST",
			url : "userInfoServlet?op=ensure",
			data : "sendAgain=" + sendAgain,
			dataType : "JSON",
			success : function(data) {
				if (data > 0) {
					zcCode.css("display", "none");
					zcName.css("display", "block");
				} else {
					$("#code").val("");
					earningCode.css("display", "block");
					earningCode.html("<i></i>验证码错误");
				}
			}
		});
	}
}

// 给注册用户进行命名
function zcNametoPage() {
	var regName = $("#aut-zc-uname");
	var uname = $("#uname");
	var start = $("#start");
	var earningName = $("#earningName");
	if (uname.val() == "") {
		earningName.css("display", "block");
		earningName.html("<i></i>请输入昵称");
	} else if (!uname.val().match(/^[\u4e00-\u9fa5]{2,}|[a-zA-Z]{4,}$/)) {
		earningName.css("display", "block");
		earningName.html("<i></i>昵称不能少于4个字母或2个汉字");
	} else {
		start.html("<i>注册中...</i>");
		var tel = $("#tel");
		var pwd = $("#zcpwd");
		var uname = $("#uname");
		$.ajax({
			url : "userInfoServlet?op=addUser",
			type : "POST",
			data : "tel=" + $("#tel").val() + "&pwd=" + $("#zcpwd").val()
					+ "&uname=" + $("#uname").val(),
			dataType : "JSON",
			success : function(data) {
				alert(data);
				if (data > 0) {
					regName.css("display", "none");
					tel.val("");
					pwd.val("");
					uname.val("");
					alert("注册成功");
				} else {
					alert("注册失败");
					zcnuname.style.display = "none";
				}
			}
		});
	}
}

function forgetPwd() {
	var logphone = $("#aut-phone");// 手机登录面板
	var fgPwd = $("#aut-fgPwd");// 重置密码面板
	var autFg = $("#aut-forget");// 重置密码获得验证码面板
	fgPwd.css("display", "block");
	logphone.css("display", "none");
}

function fgPwdtoPage() {
	var fgPwd = $("#aut-fgPwd");// 重置密码面板
	var autFg = $("#aut-forget");// 重置密码获得验证码面板
	var tel = $("#fgtel");
	var password = $("#fPassword");
	var i = $("#fgearning i:eq(0)");
	var earning = $("#fgearning");
	if (tel.val() == "") {
		earning.css("display", "block");
		earning.html("<i></i>请输入手机号码");
	} else if (tel.val().length != 11) {
		earning.css("display", "block");
		earning.html("<i></i>请输入11位数字的手机号");
	} else if (!tel.val().match(/^1[34578]\d{9}$/)) {
		earning.css("display", "block");
		earning.html("<i></i>手机号码格式不正确");
	} else if (password.val() == "") {
		earning.css("display", "block");
		earning.html("<i></i>请输入登录密码");
	} else {
		$.ajax({
			type : "POST",
			url : "userInfoServlet?op=identify",
			data : "tel=" + tel.val(),
			dataType : "JSON",
			success : function(data) {
				if (data >= 0) {
					fgPwd.css("display", "none");
					var zctelX = $("#fgTelCode");
					var telX = tel.val();
					telX = telX.substring(0, 3) + "****" + telX.substring(7);
					zctelX.text(telX);
					settime1();
					autFg.css("display", "block");
					tel.val("");
					password.val("");
				} else {
					tel.val("");
					password.val("");
					alert("该用户不存在！");
				}
			}
		});
	}
}

var countdown1 = 59;
function settime1() {
	var a = $("#fgsendAgain");
	var save = $("#fgsendAgain i:eq(0)");
	if (countdown1 == 0) {
		a.attr("href", "javascript:settime()");
		save.html("重新发送");
		countdown1 = 59;
		clearTimeout(i);
		return;
	} else {
		a.removeAttr('href');
		if (countdown1 < 10) {
			save.html("00:0" + countdown1);
		} else {
			save.html("00:" + countdown1);
		}

		countdown1--;
	}
	var i = setTimeout(function() {
		settime1()
	}, 1000)
}

function fgnextCode() {
	var zcCode = $("#aut-forget");// 重置密码验证码面板
	var aut = $("#aut");// 登录面板
	var tel = $("#fgtel").val();
	var pwd = $("#fPassword").val();
	var sendAgain = $("#fgcode").val();// 输入的验证码
	var earningCode = $("#fgearningCode");
	if (sendAgain == "") {
		earningCode.css("display", "block");
		earningCode.html("<i></i>请输入验证码");
	} else {
		$.ajax({
			type : "POST",
			url : "userInfoServlet?op=findPwd",
			data : "sendAgain=" + sendAgain + "&tel=" + tel + "&pwd="
					+ $("#fPassword").val(),
			dataType : "JSON",
			success : function(data) {
				if (data > 0) {
					alert("修改密码成功");
					zcCode.css("display", "none");
					aut.css("display", "block");
				} else if (data == 0) {
					earningCode.css("display", "block");
					earningCode.html("<i></i>验证码错误");
				} else {
					alert("修改密码失败");
				}
			}
		});
	}
}