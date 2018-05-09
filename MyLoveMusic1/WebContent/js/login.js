var login=document.getElementById("login");//下拉框中的登录选项
var sjdl=document.getElementById("sjdl");//手机号登录的下拉下拉选择
var aut1=document.getElementById("aut-phone");//手机号登录框面板
var mov1=document.getElementById("mov-1");//手机号登录框的手机号登录字样
var cls1=document.getElementById("cls-1");//手机号登录框的关闭id
var other=document.getElementById("other");//手机号登录框中的其他登录方式
var sj=document.getElementById("sj");//登录框中的手机号登录选项
var aut=document.getElementById("aut");//登录面板;
var cls=document.getElementById("cls");//登录框中的关闭id
var zc1=document.getElementById("zc-1");//登录面板中的注册选项
var zc=document.getElementById("aut-zc");//手机号注册框
var zc2=document.getElementById("zc-2");//手机号登录中的免费注册
var zc3=document.getElementById("aut-zc-next");//手机号注册获取验证码面板框
var zc4=document.getElementById("aut-zc-uname");//手机号注册取名字面板框
var cls2=document.getElementById("cls-2");//手机号注册中的关闭id
var ret=document.getElementById("ret1");//手机号注册的返回登录选项
var ret2=document.getElementById("ret2");//手机号注册中获取验证的返回登录选项
var cls3=document.getElementById("cls-3");//手机号注册中获取验证的关闭id
var cls4=document.getElementById("cls-4");//手机号注册中取名字的关闭id
var ret3=document.getElementById("ret3");//密码重置面板中的返回登录
var newpwd=document.getElementById("aut-fgPwd");//密码重置面板框的重新设置密码
var newms=document.getElementById("aut-forget");//密码重置面板框的短信获取
var cls5=document.getElementById("cls-5");//密码重置面板框的重新设置密码的关闭id
var cls6=document.getElementById("cls-6");//密码重置面板框的短信获取的关闭id
var mov=document.getElementById("mov");//登录框字体
var mov1=document.getElementById("mov-1");//手机号登录
var mov2=document.getElementById("mov-2");//
//让登录框可以移动
mov.onmousedown=function(e) {
	var e=arguments[0]||window.event;
	login = document.getElementById("aut");
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

//让手机登录框可以移动
mov1.onmousedown=function(e) {
	var e=arguments[0]||window.event;
	login = document.getElementById("aut-phone");
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
//手机注册框可以移动
mov2.onmousedown=function(e) {
	var e=arguments[0]||window.event;
	login = document.getElementById("aut-zc");
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

//登录框
//点击下拉框中的登录选项，将登录面板打开
login.onclick=function(){
	aut.style.display="block";//登录框面板打开
}
//点击登录框面板的关闭按钮，将登录面板关闭
cls.onclick=function(){
	aut.style.display="none";//登录面板关闭
}
//点击登录框中的手机号登录，将手机号面板打开
sj.onclick=function(){
	aut.style.display="none";//登录框面板
	aut1.style.display="block";//手机号面板
	$("#earning").val("");
}
//手机号登录面板中的返回其他登录
other.onclick=function(){
	aut.style.display="block";
	aut1.style.display="none";
	$("#earning").val("");
}


//选择手机号登录下拉框
sjdl.onclick=function(){
	aut.style.display="none";//登录框
	aut1.style.display="block";//手机号面板
	if(document.getElementById("autodl").ckecked==false){
		$("#usertel").val("");
		$("#userpwd").val("");
	}
}
//点击手机号登录框的关闭按钮
cls1.onclick=function(){
	aut1.style.display="none";
}
//手机号登录框的手机登录
function userLogin() {
	var tel = $("#usertel");
	var password = $("#userpwd");
	var earning = $("#earning");
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
		$.post("userInfoServlet", {
			op : "userLogin",
			tel : tel.val(),
			pwd : password.val()
		}, function(data) {
			var data= JSON.parse(data);
			if (data.usid !=undefined) {
				location.href = "dl-index.jsp";
				$("#usertel").val("");
				$("#userpwd").val("");
				$("#earning").val("");
			} else{
				alert("登录失败,手机号或密码错误");
				return;
			}
		}, "text");
	}
}



//注册
//点击登录面板的注册选项
zc1.onclick=function(){
	zc.style.display="block";//注册面板
	aut1.style.display="none";//手机号面板
	aut.style.display="none";//登录框面板
	$("#zcearning").html("");
	$("#tel").val("");
	$("#zcpwd").val("");
}
//点击手机登录框面板的免费注册选项
zc2.onclick=function(){
	zc.style.display="block";//注册面板
	aut1.style.display="none";//手机号面板
	aut.style.display="none";//登录框面板
	$("#zcearning").html("");
	$("#tel").val("");
	$("#zcpwd").val("");
}
//点击注册面板的关闭选项
cls2.onclick=function(){
	zc.style.display="none";
	$("#zcearning").html("");
	$("#tel").val("");
	$("#zcpwd").val("");
}
//手机注册获取验证码的关闭选项
cls3.onclick=function(){
	zc3.style.display="none";
	$("#zcearning").html("");
	$("#tel").val("");
	$("#zcpwd").val("");
}
//手机注册取名字的关闭选项
cls4.onclick=function(){
	zc4.style.display="none";
	$("#zcearning").html("");
	$("#tel").val("");
	$("#zcpwd").val("");
}
//点击注册面板的返回登录选项
ret.onclick=function(){
	zc.style.display="none";
	aut.style.display="block";
	$("#zcearning").html("");
	$("#tel").html("");
	$("#zcpwd").html("");
}
//点击注册获取验证码面板的返回登录选项
ret2.onclick=function(){
	zc3.style.display="none";
	aut.style.display="block";
	$("#zcearning").html("");
	$("#tel").html("");
	$("#zcpwd").html("");
}

//手机注册时，点击的下一步 验证手机号码是否被注册过
function next1() {
	var tel = $("#tel");//手机号注册中的电话号码输入
	var password = $("#zcpwd");//手机号注册中的密码输入
	var i = $("#earning i:eq(0)");
	var earning = $("#zcearning");
	var regNext = $("#aut-zc-next");//手机号注册中的接受短信验证码框
	var reg = $("#aut-zc");//手机号注册框
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
					telX = telX.substring(0, 3) + "****"
							+ telX.substring(7);
					zctelX.text(telX);
					regNext.css("display", "block");
					settime();
				} else {
					tel.val("");
					password.val("");
					earning.val("");
					alert("该手机已经被注册过！！！")
				}
			}
		});
	}
}
//获得验证码
var countdown = 59;
function settime() {
	var a = $("#sendAgain");//手机号注册中的重新发送
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

//手机号注册后，获取到验证码，然后点击的下一步
function nextCode() {
	var zcCode = $("#aut-zc-next");//注册输入验证码面板
	var zcName = $("#aut-zc-uname");//注册取名面板
	var sendAgain = $("#code").val();//输入的验证码
	var earningCode = $("#earningCode");//手机注册中输入验证码的提示信息
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
//给注册用户进行命名
function zcNametoPage() {
	var regName = $("#aut-zc-uname");//给注册用户取名面板
	var uname = $("#uname");//输入注册名
	var start = $("#start");//注册后开启云音乐
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

//重置密码
//密码重置中的密码重输面板关闭
cls5.onclick=function(){
	newpwd.style.display="none";
}
//密码重置中的短信获取面板关闭
cls6.onclick=function(){
	newms.style.display="none";
}
//打开重置密码面板
function forgetPwd() {
	var logphone = $("#aut-phone");//手机登录面板
	var fgPwd = $("#aut-fgPwd");//重置密码面板
	var autFg = $("#aut-forget");//重置密码获得验证码面板
	fgPwd.css("display", "block");
	logphone.css("display", "none");
}

//重置密码和密码重置获取短信码中的返回登录
function fgReturn() {
	var logphone = $("#aut-phone");//手机登录面板
	var fgPwd = $("#aut-fgPwd");//重置密码面板
	var autFg = $("#aut-forget");//重置密码获得验证码面板
	autFg.css("display", "none");
	fgPwd.css("display", "none");
	logphone.css("display", "block");
}
function fgPwdtoPage() {
	var fgPwd = $("#aut-fgPwd");//重置密码面板
	var autFg = $("#aut-forget");//重置密码获得验证码面板
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
					telX = telX.substring(0, 3) + "****"
							+ telX.substring(7);
					zctelX.text(telX);
					settime1();
					autFg.css("display", "block");
				} else {
					tel.val("");
					password.val("");
					alert("该用户不存在！");
				}
			}
		});
	}
}

//重置密码后获得短信
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
	var zcCode = $("#aut-forget");//重置密码验证码面板
	var tel = $("#fgtel");
	var pwd = $("#fPassword");
	var sendAgain = $("#fgcode").val();//输入的验证码
	var earningCode = $("#fgearningCode");
	if (sendAgain == "") {
		earningCode.css("display", "block");
		earningCode.html("<i></i>请输入验证码");
	} else {
		$.ajax({
			type : "POST",
			url : "userInfoServlet?op=findPwd",
			data : "sendAgain=" + sendAgain + "&tel=" + tel.val() + "&pwd="+ pwd.val(),
			dataType : "JSON",
			success : function(data) {
				if (data > 0) {
					alert("修改密码成功");
					$("#fgtel").val("");
					$("#fPassword").val("");
					$("#fgearningCode").val("");
					zcCode.css("display", "none");
					aut1.css("display", "block");
				} else if (data == 0) {
					$("#fgtel").val("");
					$("#fPassword").val("");
					$("#fgearningCode").val("");
					earningCode.css("display", "block");
					earningCode.html("<i></i>验证码错误");
				} else {
					$("#fgtel").val("");
					$("#fPassword").val("");
					$("#fgearningCode").val("");
					alert("修改密码失败");
				}
			}
		});
	}
}
