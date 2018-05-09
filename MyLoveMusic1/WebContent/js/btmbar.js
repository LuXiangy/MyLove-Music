var aud = document.getElementById("audio");
//音乐播放器
//播放/暂停
function playOrPause(obj) {
	if (aud.paused) {
		aud.play();
		run();
	} else {
		aud.pause();
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

//进度条
var timeout;
var rdy = document.getElementsByClassName("rdy")[0];
var lon
var starbg = document.getElementsByClassName("starbg")[0];
function run() {
	if (aud.paused) {
		setTimeout("run", "100000");
	} else {
		
		rdy.style.width = parseInt(rdy.style.width) + 1 + "px";
		starbg.style.left=parseInt(rdy.style.width)-3 + "px";
		var curr = getCurrentTime();
		var myem = document.getElementById("myem");
		myem.innerText = curr;
		var longs= document.getElementById("longs").innerText;
		/*if (rdy.style.width == "100%") {
			clearInterval(timeout);
		}*/
		if(curr.trim()==longs.trim()){
			  next(constantSid,constantSid);//自动跳到下一首
		}
	}
}
timeout = window.setInterval("run()", 1000);//设置一个定时器，1秒钟执行以下run()函数

function clearInterval() {
	rdy.style.width ="0px";
}
//获取播放时间
function getCurrentTime() {
	var time = aud.currentTime;
	var minute = parseInt(time / 60);
	var second = parseInt(time % 60);
	var t = toTwo(minute) + ":" + toTwo(second);
	return t;
}
function toTwo(n) {
	return n < 10 ? "0" + n : "" + n;
}

function vol() {
	var vo = document.getElementById("volu");
	var circle = document.getElementById('j_t');
	var changdu = document.getElementById('curr_t');
	var e = event || arguments.callee.caller.arguments[0]; // 前为IE后为火狐
	var y = e.clientY || e.pageY;
	var postX;
	if (vo.style.display == "none") {
		vo.style.display = "block";

		circle.onmousedown = function(event) {

			var event = event || window.event;
			var distanceY = event.clientY - circle.offsetTop;
			document.onmousemove = function(event) {
				var event = event || window.event;
				var moveD = event.clientY - distanceY;

				if (moveD <= 0) {
					moveD = 0;
				} else if (moveD >= 82) {
					moveD = 82;
				}

				circle.style.top = moveD + 'px';

				var voice = (82 - moveD) / 82;
				aud.volume = voice;
				changdu.style.height = 88 - moveD + 'px';
				return false;
			}
			document.onmouseup = function() {
				document.onmousemove = null;
				document.onmouseup = null;
			}
			return false;
		}
	} else {
		vo.style.display = "none";
	}
}

function volu(type) {
	if (type == "up") {
		var volume = aud.volume+0.3;
		if (volume >= 1) {
			volume = 1;
		} else {
			aud.volume += 0.3;
		}
	} else if (type == "down") {
		var volume = aud.volume - 0.3;
		if (volume <= 0) {
			volume = 0;
		}else{
			aud.volume -= 0.3;
		}
	}
}

//快捷键
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
		aud.currentTime = aud.currentTime + 5;
	}
	// ctrl + ↓ -> 音量-
	if (e.ctrlKey && keycode == 40) {
		volu("down");
	}
}

var lyri = "";
var saddr = "";
var songTime = "";//获得播放歌曲的时间；
var constantSid="";
function addClick(sid, addr){
	constantSid=sid;
	var str = "";
	var rdy = document.getElementsByClassName("rdy")[0];
	rdy.style.width = "0px";
	saddr = addr;
	$("#audio").attr("src", addr).attr("autoplay", true);
	run();//进度条
	$.post("songServlet", {
		op : "findSong",
		sid : sid
	}, function(data) {
		data = $.parseJSON(data);
		$.each(data, function(index, item) {
			$("#na").attr("title", item.sname).html("").html(item.sname);
			$("#st").html(item.singerName);
			$("#sname").html(item.sname);
			$("#singerName").attr("title", item.singerName);
			$("#longs").html(item.longs);
			$("#ph").attr('src', item.photo);
			songTime = item.longs;
			lyri = item.lyric;
				getLyric(lyri);
			
		});
	}, "json")
	$.post("songServlet", {
		op : "addClick",
		sid : sid
	}, function(data) {
	}, "text");
	$(".prv").attr("onclick", "pref(" + sid + "," + sid + ")");
	$(".nxt").attr("onclick", "next(" + sid + "," + sid + ")");
}
/*//检测是否播放完毕
var playOut;
function playOut() {
	if (aud.currentTime == songTime) {
		clearInterval(timeout);
	}
}
playOut = window.setInterval("playOut()", 1000);//设置一个定时器，1秒钟执行以下playOut()函数
*/


//播放歌单
var s=new Array();
//播放歌单
function playSongSheet(ssname) {
	$.post("songSheetServlet", {
		op : "findSongSheet",
		ssname: ssname
	}, function(data) {
			data= $.parseJSON(data);
			if(data!=null){
				$.each(data,function(index,item){
					if(index == 0){
						$.post("songServlet", {
							op : "findSong",
							sid : item.song
						}, function(data) {
							data = $.parseJSON(data);
							if(data == "" || data == undefined || data == null){
								alert("此歌单中没有收藏歌曲!");
							}else{
								addClick(data[0].sid, data[0].saddr);
							}
						}, "json");
					}
				});
			}
	}, "json");
}
//上一首
function pref(ssid,index){
	if(index==1){
		alert("已经是第一首");
		index=2;
	}else{
			index = index-1;
			$.post("songServlet",{op:"findSong",sid:index},function(data){
				data= $.parseJSON(data);
				addClick(data[0].sid,data[0].saddr);
			},"json");
	}
	$(".prv").attr("onclick","pref("+ssid+","+(index-1)+")"); 
	$(".nxt").attr("onclick","next("+ssid+","+(index-1)+")"); 
	
}

//下一首
function next(ssid,index){
	if(index==s.length){
		index=0;
	}else{
				index = index+1;
				$.post("songServlet",{op:"findSong",sid:index},function(data){
					data= $.parseJSON(data);
					addClick(data[0].sid,data[0].saddr);
				},"json");
	}
	$(".prv").attr("onclick","pref("+ssid+","+(index+1)+")"); 
	$(".nxt").attr("onclick","next("+ssid+","+(index+1)+")"); 
} 

//设置循环播放
var icnOne = document.getElementById("icn-one");
document.getElementById("icn-one").onclick = function(){
	var title = $("#icn-one").attr("title");
	if(title == "单曲循环"){
		icnOne.style['background-position-x'] = '-3px';
		$("#icn-one").attr("title","循环播放");
	}else if(title =="循环播放"){
		$("#icn-one").attr("title","随机播放");
		icnOne.style['background-position-x'] = '-66px';
		icnOne.style['background-position-y'] = '-248px';
	}else if(title == "随机播放"){
		$("#icn-one").attr("title","单曲循环");
		icnOne.style['background-position-x'] = '-66px';
		icnOne.style['background-position-y'] = '-344px';
	}
}
//播放排行榜歌单下的歌曲
function playSong(songSheet){
	if(songSheet == 1){
		$.post("songServlet",{op:"findByClick"},function(data){
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				if(index == 0){
					addClick(item.sid,item.saddr);
				}
			});
		},"json");
	}else if(songSheet == 2){
		$.post("songServlet",{op:"findAll"},function(data){
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				if(index == 0){
					addClick(item.sid,item.saddr);
				}
			});
		},"json");
	}else if(songSheet == 3){
		$.post("songServlet",{op:"findByself"},function(data){
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				if(index == 0){
					addClick(item.sid,item.saddr);
				}
			});
		},"json");
	}
}
//显示歌词
function getLyric(url) {
	$("#lrc_list").find("li").remove();
	if (url ==""||url == undefined||url =="undefined") {
		$('#lrc_content ul').append("<li>暂无歌词……</li>");
		return;
	}
	$.ajax({
		url : url,
		dataType : 'text',
		type : 'post',
		scriptCharset : 'utf-8',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			// 这里获得歌词文件
			$("#lrc_list").find("li").remove();
			if (url ==""||url == undefined||url =="undefined") {
				$('#lrc_content ul').append("<li>暂无歌词……</li>");
				return;
			} else {
				// 获取页面上的audio标签
				var lyric = parseLyric(data);
				var audio = document.getElementById("audio");
				// 显示歌词的元素
				for (var i = 0, li; i < lyric.length; i++) {
					var li = $('<li>' + lyric[i][1] + '</li>');
					$('#lrc_content ul').append(li);
				}
				// 监听ontimeupdate事件
				audio.ontimeupdate = function(e) {
				    //遍历所有歌词，看哪句歌词的时间与当然时间吻合
				    for (var i = 0, l = lyric.length; i < l; i++) {
				        if (this.currentTime /*当前播放的时间*/ > lyric[i][0]) {
				            //显示到页面lyricContainer.textContent = that.lyric[i][1];
				        	$('#lrc_content ul').css('top',-i*25+200+'px'); //让歌词向上移动    
				        	$('#lrc_content ul li').css('color','#fff');    
				        	$('#lrc_content ul li:nth-child('+(i+1)+')').css('color','red'); //高亮显示当前播放的哪一句歌词  
				        };
				    };
				};
			}
			 
		}
	});
}

// 歌词同步部分
function parseLyric(text) {
	// 将文本分隔成一行一行，存入数组
	var lines = text.split('\n');
	// 用于匹配时间的正则表达式，匹配的结果类似[xx:xx.xx]
	var pattern = /\[\d{2}:\d{2}.\d{2}\]/g;
	// 保存最终结果的数组
	var result = [];
	// 去掉不含时间的行
	while (!pattern.test(lines[0])) {
		 lines = lines.slice(1);
	}
	// 上面用'\n'生成生成数组时，结果中最后一个为空元素，这里将去掉
	lines[lines.length - 1].length === 0 && lines.pop();
	lines.forEach(function(v /* 数组元素值 */, i /* 元素索引 */, a /* 数组本身 */) {
		// 提取出时间[xx:xx.xx]
		var time = v.match(pattern);
		// 提取歌词
		var value = v.replace(pattern, '');
		// 因为一行里面可能有多个时间，所以time有可能是[xx:xx.xx][xx:xx.xx][xx:xx.xx]的形式，需要进一步分隔
		time.forEach(function(v1, i1, a1) {
			// 去掉时间里的中括号得到xx:xx.xx
			var t = v1.slice(1, -1).split(':');
			// 将结果压入最终数组
			result.push([ parseInt(t[0], 10) * 60 + parseFloat(t[1]), value ]);
		});
	});
	// 最后将结果数组中的元素按时间大小排序，以便保存之后正常显示歌词
	result.sort(function(a, b) {
		return a[0] - b[0];
	});
	return result;
}
