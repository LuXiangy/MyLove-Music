var playerlist = new Array();
var currentSong = 0;
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
//播放
function aa() {
	var bb = document.getElementById("ply1");
	bb.style['background-position-y'] = '-165px';
}
//暂停
function cc() {
	var dd = document.getElementById("ply1");
	dd.style['background-position-y'] = '-204px';
}

function objSong(saddr, photo, singername, longs, ssname, lyr) {
	this.saddr = saddr;
	this.photo = photo;
	this.singername = singername;
	this.longs = longs;
	this.ssname = ssname;
	this.lyr = lyr;
}
var saddr = "yangcong.mp3";
var lyri = "";
function addInPlay(saddr, photo, singername, longs, ssname, lyr) {
	saddr = saddr;
	lyri = lyr;
	$("#sname").html(ssname);
	var song = new objSong(saddr, photo, singername, longs, ssname, lyr);
	playerlist.push(song);
	currentSong = playerlist.length - 1;
	$("#na").attr('title', ssname);
	$("#na").html(ssname);
	$("#audio").attr('src', saddr);
	$("#jp_audio_0").attr('src', saddr);
	$("#ph").attr('src', photo);
	$("#st").parent().attr('title', singername);
	$("#st").html(singername);
	$("#longs").html(longs);
	var ply = document.getElementById("ply1");
	ply.style['background-position-y'] = '-165px';
	var rdy = document.getElementsByClassName("rdy")[0];
	rdy.style.width = "0";
	if (audio.paused) {
		audio.play();
		lyric();
		run();
	} else {
		audio.pause();
	}
}


function addClick(sid,addr){
	var str="";
	$("#audio").attr("src",addr).attr("autoplay",true);
	$.post("songServlet",{op:"findSong",sid:sid},function(data){
		data= $.parseJSON(data);
		$.each(data,function(index,item){
			playerlist.push(item);
			currentSong = playerlist.length - 1;
			$("#na").attr("title",item.sname).html("").html(item.sname);
			$("#st").html(item.singerName);
			$("#ph").attr('src', item.photo);
			$("#singerName").attr("title",item.singerName);
			$("#longs").html(item.longs);
			var ply = document.getElementById("ply1");
			ply.style['background-position-y'] = '-165px';
			var rdy = document.getElementsByClassName("rdy")[0];
			rdy.style.width = "0";
			if (audio.paused) {
				audio.play();
				lyric();
				run();
			} else {
				audio.pause();
			}
		});
	},"json")
	
	
	$.post("songServlet",{op:"addClick",sid:sid},function(data){
		
	},"text");
}

// 上一首和下一首
function shang(obj) {
	if (currentSong == 0)
		return;
	else {
		currentSong -= 1;
		lyri = playerlist[currentSong].lyr;
		$("#sname").html(playerlist[currentSong].ssname);
		$("#na").attr('title', playerlist[currentSong].ssname);
		$("#na").html(playerlist[currentSong].ssname);
		$("#audio").attr('src', playerlist[currentSong].saddr);
		saddr = playerlist[currentSong].saddr;
		$("#jp_audio_0").attr('src', saddr);
		$("#ph").attr('src', playerlist[currentSong].photo);
		$("#st").parent().attr('title', playerlist[currentSong].singername);
		$("#st").html(playerlist[currentSong].singername);
		$("#longs").html(playerlist[currentSong].longs);
		var ply = document.getElementById("ply1");
		ply.style['background-position-y'] = '-165px';
		var rdy = document.getElementsByClassName("rdy")[0];
		rdy.style.width = "0";
		run();
		audio.play();
		lyric();
	}

}

function xia(obj) {
	if (currentSong == playerlist.length - 1)
		return;
	else {
		currentSong += 1;
		$("#sname").html(playerlist[currentSong].ssname);
		lyri = playerlist[currentSong].lyr;
		$("#na").attr('title', playerlist[currentSong].ssname);
		$("#na").html(playerlist[currentSong].ssname);
		$("#audio").attr('src', playerlist[currentSong].saddr);
		saddr = playerlist[currentSong].saddr;
		$("#jp_audio_0").attr('src', saddr);

		$("#ph").attr('src', playerlist[currentSong].photo);
		$("#st").parent().attr('title', playerlist[currentSong].singername);
		$("#st").html(playerlist[currentSong].singername);
		$("#longs").html(playerlist[currentSong].longs);
		var ply = document.getElementById("ply1");
		ply.style['background-position-y'] = '-165px';
		var rdy = document.getElementsByClassName("rdy")[0];
		rdy.style.width = "0";
		run();
		audio.play();
		lyric();
	}

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

$(function() {
	lyric();
});

function lyric() {
	getLyric(lyri);
	$("#jquery_jplayer_1").jPlayer("stop");

	$("#jquery_jplayer_1").jPlayer({
		ready : function(event) {
			$(this).jPlayer("setMedia", {
				mp3 : saddr
			// mp3的播放地址
			});
		},
		timeupdate : function(event) {
			if (event.jPlayer.status.currentTime == 0) {
				time = "";
			} else {
				time = event.jPlayer.status.currentTime;
			}
		},
		play : function(event) {
			alert('播放成功');
			$.lrc.start($('#lrc_content').val(), function() {
				return time;
			});
		},
		ended : function(event) {
			$("#lrc_list").removeAttr("style").html("<li>歌曲播放完毕！</li>");
		},
		swfPath : "/js", // 存放jplayer.swf的决定路径
		solution : "html, flash", // 支持的页面
		supplied : "mp3", // 支持的音频的格式
		wmode : "window"
	});
	$("#jquery_jplayer_1").jPlayer({}).jPlayer('play');
}

function getLyric(url) {
	$.ajax({
		url : url,
		dataType : 'text',
		type : 'post',
		scriptCharset : 'utf-8',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			// 这里获得歌词文件
			$("#lrc_content").val("");
			$("#lrc_content").val(data);
		}
	});
}
var flag = 0;
function lookgc() {
	if (flag == 0) {
		$("#gcck").css("opacity", "1");
		flag = 1;
	} else {
		$("#gcck").css("opacity", "0");
		flag = 0;
	}
}
