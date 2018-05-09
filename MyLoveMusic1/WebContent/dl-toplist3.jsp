<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MyLove Music</title>
<link rel="icon" href="images/music.ico" />
<link rel="stylesheet" href="css/dl-toplist.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
</head>
<body>
	<div class="body1">
		<%
			 UserInfo userInfo1 =(UserInfo)session.getAttribute("currentLogin");
			if (userInfo1 == null) {
		%>
		<%@include file="page/login.jsp"%>
		<%
			} else {
		%>
		<%@include file="page/alLogin.jsp" %>
		<%
			}
		%>
		<div class="mynav">
			<ul class="nav" id="nv">
				<li><a href="dl-index.jsp" onClick="change_bg(this)"><em>推荐</em></a></li>
				<li><a href="dl-toplist.jsp" class="n_tj"
					onClick="change_bg(this)"><em>排行榜</em></a></li>
				<li><a href="dl-songlist.jsp" onClick="change_bg(this)"><em>歌单</em></a></li>
				<li><a href="dl-radio.jsp" onClick="change_bg(this)"><em>主播电台</em></a></li>
				<li><a href="dl-artist.jsp" onClick="change_bg(this)"><em>歌手</em></a></li>
				<!-- <li><a href="dl-cd.jsp" onClick="change_bg(this)"><em></em></a></li> -->
			</ul>
		</div>


		<div class="content_left">
			<div class="top">
				<h2>MyLove音乐特色榜</h2>
				<ul class="top_1">
					<li class="left_2">
						<div class="div1"></div>
						<p class="p1">
							<a href="dl-toplist.jsp">MyLove音乐飙升榜</a>
						</p>
						<p class="p2">每天更新</p>
					</li>
					<li class="left_3">
						<div class="div2"></div>
						<p class="p1">
							<a href="dl-toplist2.jsp">MyLove音新歌榜</a>
						</p>
						<p class="p2">每天更新</p>
					</li>
					<li class="left_1">
						<div class="div3"></div>
						<p class="p1">
							<a href="dl-toplist3.jsp">网易原创歌曲榜</a>
						</p>
						<p class="p2">每周四更新</p>
					</li>
					<li class="left_4">
						<div class="div4"></div>
						<p class="p1">
							<a href="javascript:void()">MyLove音乐热歌榜</a>
						</p>
						<p class="p2">每周四更新</p>
					</li>
				</ul>
			</div>
			<div class="bottom">
				<h2>全球媒体榜</h2>
				<ul>
					<li class="left_5">
						<div class="div5"></div>
						<p class="p1">
							<a href="javascript:void()">MyLove音乐ACG 音乐榜</a>
						</p>
						<p class="p2">每周四更新</p>
					</li>
					<li class="left_6">
						<div class="div6"></div>
						<p class="p1">
							<a href="javascript:void()">MyLove音乐古典音乐榜</a>
						</p>
						<p class="p2">每周四更新</p>
					</li>
					<li class="left_7">
						<div class="div7"></div>
						<p class="p1">
							<a href="javascript:void()">MyLove音乐电音榜</a>
						</p>
						<p class="p2">刚刚更新</p>
					</li>
					<li class="left_8">
						<div class="div8"></div>
						<p class="p1">
							<a href="javascript:void()">UK排行榜周榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_9">
						<div class="div9"></div>
						<p class="p1">
							<a href="javascript:void()">美国Billboard周榜</a>
						</p>
						<p class="p2">每周三更新</p>
					</li>
					<li class="left_10">
						<div class="div10"></div>
						<p class="p1">
							<a href="javascript:void()">Beatport全球电子舞曲榜</a>
						</p>
						<p class="p2">每周四更新</p>
					</li>
					<li class="left_11">
						<div class="div11"></div>
						<p class="p1">
							<a href="javascript:void()">法国NRJ Vos Hits周榜</a>
						</p>
						<p class="p2">刚刚更新</p>
					</li>
					<li class="left_12">
						<div class="div12"></div>
						<p class="p1">
							<a href="javascript:void()">K T V 唛榜</a>
						</p>
						<p class="p2">刚刚更新</p>
					</li>
					<li class="left_13">
						<div class="div13"></div>
						<p class="p1">
							<a href="javascript:void()">iTunes榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_14">
						<div class="div14"></div>
						<p class="p1">
							<a href="javascript:void()">日本Oricon榜</a>
						</p>
						<p class="p2">每周三更新</p>
					</li>
					<li class="left_15">
						<div class="div15"></div>
						<p class="p1">
							<a href="javascript:void()">韩国Melon排行榜周榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_16">
						<div class="div16"></div>
						<p class="p1">
							<a href="javascript:void()">韩国Melon原声周榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_17">
						<div class="div17"></div>
						<p class="p1">
							<a href="javascript:void()">韩国Mnet排行榜周榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_18">
						<div class="div18"></div>
						<p class="p1">
							<a href="javascript:void()">Hit FM Top榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_19">
						<div class="div19"></div>
						<p class="p1">
							<a href="javascript:void()">台湾Hito排行榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_20">
						<div class="div20"></div>
						<p class="p1">
							<a href="javascript:void()">中国TOP排行榜(港台榜)</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_21">
						<div class="div21"></div>
						<p class="p1">
							<a href="javascript:void()">中国TOP排行榜(内地榜)</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_22">
						<div class="div22"></div>
						<p class="p1">
							<a href="javascript:void()">香港电台中文歌曲龙虎榜</a>
						</p>
						<p class="p2">刚刚一更新</p>
					</li>
					<li class="left_23">
						<div class="div23"></div>
						<p class="p1">
							<a href="javascript:void()">华语金曲榜</a>
						</p>
						<p class="p2">每周一更新</p>
					</li>
					<li class="left_24">
						<div class="div24"></div>
						<p class="p1">
							<a href="javascript:void()">中国嘻哈榜</a>
						</p>
						<p class="p2">刚刚更新</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="content_right">
			<div class="g-wrap">
				<div class="cnt">
					<div class="msk1">
						<img src="images/2902710698975677.jpg" width="150px"
							height="150px" /> <span id="msk"></span>
					</div>
					<div class="m-info">
						<div class="f-cb">
							<h2 class="f-ff2" id="f-ff2">MyLove音乐原创榜</h2>
						</div>
						<div class="user">
							<i class="u-icn"></i> <span class="sep">最近更新：10月01日</span> <span
								class="s-fc4">（每天更新）</span>
						</div>
						<div class="btns">
                   		<a class="play" href='javascript:playSong1()'>
                       		<span>播放</span> 
                            <a class="tj" href='javascript:playSong1()'></a>
                        </a>
							</a> <a class="ysc"> <span>(192020)</span>
							</a> <a class="fx"> <span>(864)</span>
							</a> <a class="down"> <span>下载</span>
							</a> <a class="talk"> <span>(39149)</span>
							</a>
						</div>

					</div>
				</div>
			</div>
			<div class="g-wrap12">
				<div class="u-title-1">
					<h3>
						<span class="f-ff2">歌曲列表</span>
					</h3>
					<span class="sub"> <span id="totalSong"></span> 首歌
					</span>
					<div class="more">
						播放 <strong class="play-count">124721080</strong> 次
					</div>
				</div>
			</div>
			<div class="biaoge">
				<table class="m-table" id="myTable">
					<tr class="one">
						<th class="first"></th>
						<th width="400px">
							<div class="wp">标题</div>
						</th>
						<th class="w2-1">
							<div class="wp">时长</div>
						</th>
						<th class="w3">
							<div class="wp">歌手</div>
						</th>
					</tr>





				</table>
				<div class="g-wrap12">
					<div class="u-title-1">
						<h3>
							<span class="f-ff2">评论</span>
						</h3>
						<span class="sub"> 共39361条评论 </span>

					</div>
				</div>
				<div class="pinglun">
					<div class="head">
						<img src="images/default_avatar.jpg" />
					</div>
					<div class="pl_sjx">
						<img src="images/pl_sjx.png" />
					</div>
					<div class="m-cmmtipt">
						<textarea class="area" placeholder="评论" style="width: 585px"></textarea>
					</div>
					<div class="f-cb">
						<i class="u-icn-36"></i> <i class="u-icn-41"></i> <a href=""
							class="u-btn-1">评论</a> <span class="zs">140</span>
					</div>
				</div>
				<div class="cmmts">
					<h3 class="u-hd4">精彩评论</h3>
					<div class="itm">
						<div class="head">
							<img src="images/3426078262784660.jpg" />
						</div>
						<div class="f-brk">
							<a class="s-fc7" href="/user/home?id=314718325">谦虚的小喵酱</a>
							：终于补了不能说的秘密，没有现在青春片的车祸，留学，堕胎，奢华。小清新，剧情也不落俗套。最重要的的是配乐太好听了！！！
						</div>
						<div class="rp">
							<div class="time">04:00</div>
							<a> <i class="zan"></i>
							<div class="span_1">(60)&nbsp|&nbsp;回复</div>
							</a>
						</div>
					</div>
					<div class="itm_1">
						<div class="head">
							<img src="images/3252355415516075.jpg" />
						</div>
						<div class="f-brk">
							<a class="s-fc7" href="/user/home?id=314718325">00后杰迷喜欢无敌歌曲告白气球</a>
							：杰伦的告白气球飙到有点凶啊
						</div>
						<div class="rp">
							<div class="time">08:41</div>
							<a> <i class="zan"></i>
							<div class="span_1">(80)&nbsp|&nbsp;回复</div>
							</a>
						</div>
					</div>
					<div class="itm_1">
						<div class="head">
							<img src="images/1413971969195462.jpg" />
						</div>
						<div class="f-brk">
							<a class="s-fc7" href="/user/home?id=314718325">小-_-柒</a>
							：我只是来数数告白气球有几个的，居然又是三个。🍃
						</div>
						<div class="rp">
							<div class="time">07:31</div>
							<a> <i class="zan"></i>
							<div class="span_1">(26)&nbsp|&nbsp;回复</div>
							</a>
						</div>
					</div>
					<div class="itm_1">
						<div class="head">
							<img src="images/3432675303837294.jpg" />
						</div>
						<div class="f-brk">
							<a class="s-fc7" href="/user/home?id=314718325">因为周杰伦注册的</a>
							：告白气球又飙车
						</div>
						<div class="rp">
							<div class="time">09:11</div>
							<a> <i class="zan"></i>
							<div class="span_1">(99)&nbsp|&nbsp;回复</div>
							</a>
						</div>
					</div>
					<h3 class="u-hd4">最新评论(85998)</h3>
					<div class="itm_1">
						<div class="head">
							<img src="images/3252355415799560.jpg" />
						</div>
						<div class="f-brk">
							<a class="s-fc7" href="/user/home?id=314718325">嘟哈砰咔</a>
							：年底秘密，百老汇音乐剧<img src="images/emoji_360.png" />
						</div>
						<div class="rp">
							<div class="time">01:11</div>
							<a> <i class="zan"></i>
							<div class="span_1">(19)&nbsp|&nbsp;回复</div>
							</a>
						</div>
					</div>
					<div class="itm_1">
						<div class="head">
							<img src="images/3306231465146445.jpg" />
						</div>
						<div class="f-brk">
							<a class="s-fc7" href="/user/home?id=314718325">最最爱的杰伦</a> ：这个可以<img
								src="images/emoji_357.png" />
						</div>
						<div class="rp">
							<div class="time">05:11</div>
							<a> <i class="zan"></i>
							<div class="span_1">(55)&nbsp|&nbsp;回复</div>
							</a>
						</div>
					</div>
					<div class="u-page">
						<div class="u-page_1">
							<a class="zprv" href="">上一页</a> <a class="zpg1" href="">1</a> <a
								class="zpg2">2</a> <a class="zpg2">3</a> <a class="zpg2">4</a> <a
								class="zpg2">5</a> <a class="zpg2">6</a> <a class="zpg2">7</a> <a
								class="zpg2">8</a> <span class="zdot">...</span> <a class="zpg2">1968</a>
							<a class="zprv_1" href="">下一页</a>
						</div>
					</div>

				</div>
			</div>
		</div>

			    <%@include file="bottom.jsp"%>
	</div>
	<%-- <div class="btmbar">
		<%@include file="page/btmbar.jsp"%>

	</div> --%>

	<!-- <a id="toTop" title="回到顶部" href="" hidefocus="true"
		style="display: none;">回到顶部</a> -->


		<!-- <script src="js/showBtmbar.js"></script> -->
	    <script src="js/dl-toplist3.js"></script>

</body>
<%@include file="page/addTosheet.jsp"%>
<script src="js/autocomplete.js"></script>
<script src="js/search.js"></script>
</html>
