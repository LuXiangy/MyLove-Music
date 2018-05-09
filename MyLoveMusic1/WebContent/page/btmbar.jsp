<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN">
<link href="css/blue.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/btmbar.css" />
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<style type="text/css">
.music_box {
	margin: 50px auto;
	width: 422px;
	background: url(images/playlist_bg.png) -1014px 0;
	margin-left: auto;
	margin-right: 0px;
	margin-bottom: 46px;
	position: absolute;
    right: 0;
    bottom: -48px;
	
} 
.content {
	width: 402px;
	height: 200px;
	/* overflow: hidden; */
	padding: 10px;
	z-index:1;
	background: url(images/playlist_bg.png) -1014px 0;
}

#lrc_list {
	margin: 10px auto;
	margin-left:80px;
}

#lrc_list li {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
	background: url(images/playlist_bg.png) -1014px 0;
	color: #989898;
	margin-top: 8px;
}

#lrc_list li.hover {
	color: #fff;
	font-weight: bold;
}

 .lytit {
	font-family: Arial, Helvetica, sans-serif;
	left: 595px;
	width: 346px;
	text-align: center;
	height: 39px;
	line-height: 39px;
	color: #fff;
	font-size: 14px;
}
.gc {
	 position: absolute;
	/* position: relative; */
	bottom: 47px;
	width: 986px;
	z-index:1;
	margin-left: -20px;
}
.sname {
	background: url(images/playlist_bg.png) -560px 0 no-repeat;
	width: 421px;
	height: 41px;
	margin-left: 1px;
}
#lrc_content {    
	overflow: hidden;    
	position: relative;  
}
#lrc_content ul{    
	position: absolute;    
}    
#lrc_content ul li{    
	text-align: center;    
	/* line-height: 40px;   */  
}  
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.jplayer.js"></script>
<!-- <script type="text/javascript" src="js/lrc.js"></script> -->
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	//歌词显示
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
</script>
<div class="m-playbar" style="top: -53px; visibility: visible;">
	<div class="updn">
		<div class="f-fl">
			<a class="btn"></a>
		</div>
		<div class="f-f2"></div>
	</div>
	<div class="bg"></div>
	<div class="hand" title="展开播放条"></div>
	<div class="wrap">
		<div class="btns">
			<!-- <a class="prv" href="javascript:;" hidefocus="true" title="上一首(ctrl+←)" onclick="shang(this)">上一首</a> -->
			<a class="prv" href="javascript:;" hidefocus="true" title="上一首(ctrl+←)">上一首</a> 
			<a class="ply" id="ply1" href="javascript:;" hidefocus="true" title="播放/暂停(p)"onclick="playOrPause(this)">播放/暂停</a> 
			<a class="nxt" href="javascript:;" hidefocus="true" title="下一首(ctrl+→)">下一首</a>
			<!-- <a class="nxt" href="javascript:;" hidefocus="true" title="下一首(ctrl+→)" onclick="xia(this)">下一首</a> -->
		</div>
		<div class="j-flag">
			<img src="images/18548761161025632.jpg" height="35px" width="35px"
				id="ph" /> <a class="mask" href="" hidefocus="true"></a>
		</div>
		<div class="play">
			<div class="words">
				<a class="f-thide" id="na" hidefocus="true" href=" "title="${sessionScope.SongName}">${sessionScope.SongName}</a> 
				<span class="by"> <span title="${sessionScope.SongSinger}">
					<a class="" id="st" href="" hidefocus="true">${sessionScope.SongSinger}</a>
				</span>
				</span> <a class="src" href="" title="来自歌单" id="sfrom"></a>
			</div>
			<div class="m-pbar">
				<div class="barbg">
					<div class="rdy" style="width: 0%;"></div>
					<div class="starbg"></div>
				</div>
				<span class="time"> 
					<em id="myem">00:00</em>
					<span id="longs">${sessionScope.SongLongs}</span>
				</span>
			</div>
		</div>
		<div class="oper">
			<a class="icn-add" href="javascript:void(0)" onClick='storeSong("${ sessionScope.SongSaddr}")' hidefocus="true" title="收藏">收藏</a>
			<a class="icn-share" href="" hidefocus="true" title="分享">分享</a>
		</div>
		<div class="ctrl">
			<div class="m-vol" id="volu" style="display: none;">
				<div class="barbg" id="barbg"></div>
				<div class="vbg">
					<div class="curr" id="curr_t" style="height: 78px;"></div>
					<span class="j-t" id="j_t" style="top: 15px;"></span>
				</div>
			</div>
			<a class="icn-vol" onClick="vol()" href="javascript:void(0)"
				hidefocus="true"></a> <a id="icn-one" class="icn-one"
				href="javascript:void(0)" hidefocus="true" title="单曲循环"></a> <span
				class="f-pr"> <span class="tip" style="display: none;">已添加到播放列表</span>
				<a class="icn-list" href="javascript:lookgc()" title="播放列表"
				hidefocus="true">98</a>
			</span>
			<div class="tip-1" style="display: none;">单曲循环</div>
		</div>
	</div>

</div>



<!-- 歌曲歌词显示 -->
<div id="musicBox" class="music_box">
	<div id="jquery_jplayer_1" class="jp-jplayer" style="display: none;"></div>
	<div style="display: none;">
		<div id="jp_container_1" class="jp-audio" style="display: none;">
			<div class="jp-type-single">
				<div class="jp-gui jp-interface" style="display: none;">
					<ul class="jp-controls">
						<li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
						<li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
						<li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
						<li><a href="javascript:;" class="jp-mute" tabindex="1"
							title="mute">mute</a></li>
						<li><a href="javascript:;" class="jp-unmute" tabindex="1"
							title="unmute">unmute</a></li>
						<li><a href="javascript:;" class="jp-volume-max" tabindex="1"
							title="max volume">max volume</a></li>
					</ul>
					<div class="jp-progress">
						<div class="jp-seek-bar">
							<div class="jp-play-bar"></div>
						</div>
					</div>
					<div class="jp-volume-bar">
						<div class="jp-volume-bar-value"></div>
					</div>
					<div class="jp-time-holder">
						<div class="jp-current-time"></div>
						<div class="jp-duration"></div>
						<ul class="jp-toggles">
							<li><a href="javascript:;" class="jp-repeat" tabindex="1"
								title="repeat">repeat</a></li>
							<li><a href="javascript:;" class="jp-repeat-off"
								tabindex="1" title="repeat off">repeat off</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="opacity: 0;" id="gcck">
		<div class="gc">
			<div class="sname">
				<p class="lytit f-ff0 f-thide j-flag" style="margin-left: 53px;"
					id="sname">${sessionScope.SongName}</p>
			</div>
			<div class="content"  id="lrc_content" style="margin-left: 0px;">
				<ul id="lrc_list" style="padding-left: 0px;">
					<li>点击开始播放……</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<audio src="${ sessionScope.SongSaddr}" id="audio" controls onPlay="aa()" onPause="cc()" loop="loop"></audio>
<link rel="stylesheet" href="css/style.css">
<!-- <script src="js/jquery.js"></script> -->
<!-- <script type="text/javascript" src="js/jquery.jplayer.js"></script> -->
