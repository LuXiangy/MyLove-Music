//登录框
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

var aut = document.getElementById("aut");// 登录面板
var login = document.getElementById("login");// 搜索旁的登录字样

var cls = document.getElementById("cls");// 登录面板的关闭按钮
var cls3 = document.getElementById("cls-3");// 手机号注册获得验证码面板的关闭按钮
var cls4 = document.getElementById("cls-4");// 手机号注册取名面板的关闭按钮
var zcCode = document.getElementById("aut-zc-next");// 手机注册获得验证码面板
var zcName = document.getElementById("aut-zc-uname");//手机号注册取名面板
var rets = document.getElementById("ret2")// 手机号注册获得验证码面板中的返回登录

cls3.onclick = function() {
	zcCode.style.display = "none";
}
cls4.onclick = function() {
	zcName.style.display = "none";
}
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
rets.onclick = function() {
	aut.style.display = "none";
	zcCode.style.display = "block";
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
var cls1 = document.getElementById("cls-1");//手机登录框的关闭键
var cls5 = document.getElementById("cls-5");//重置密码框的关闭键
var wyyx = document.getElementById("wyyx");
var wydl = document.getElementById("wydl");
var fgPwd= document.getElementById("aut-fgPwd");//重置密码框面板
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
//点击登录框的关闭键
cls1.onclick = function() {
	aut1.style.display = "none";
}
//将重置密码框点击关闭
/*cls5.onclick = function() {
	fgPwd.style.display = "none";
}*/

// 注册
var zc = document.getElementById("aut-zc");
console.log(zc);
var zcNext = document.getElementById("aut-zc-next");
var fgtel = document.getElementById("aut-fgPwd");
var fgPwd = document.getElementById("aut-forget");

var zc1 = document.getElementById("zc-1");
var zc2 = document.getElementById("zc-2");
var cls2 = document.getElementById("cls-2");
var cls5 = document.getElementById("cls-5");
var cls6 = document.getElementById("cls-6");
var ret = document.getElementById("ret1");
var ret2 = document.getElementById("ret2");
var ret3 = document.getElementById("ret3");
var ret4 = document.getElementById("ret4");
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
cls5.onclick = function() {
	fgtel.style.display = "none";
}
cls6.onclick = function() {
	fgPwd.style.display = "none";
}
ret.onclick = function() {
	zc.style.display = "none";
	aut.style.display = "block";
}
ret2.onclick = function() {
	zcNext.style.display = "none";
	aut.style.display = "block";
}

ret3.onclick = function() {
	fgtel.style.display = "none";
	aut.style.display = "block";
}
ret4.onclick = function() {
	fgPwd.style.display = "none";
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
