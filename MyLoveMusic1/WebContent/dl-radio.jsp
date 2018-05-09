<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/dl-radio.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script>
$(function(){
	$("#head1>span>a").attr("class","first_a");
	$("#nv>#a4>a").attr("class","n_tj");
})
</script>
</head>

<body>
<div class="body1">
	<%
			Object ll = session.getAttribute("currentLogin");
			if (ll == null) {
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
        	<li><a href="dl-index.jsp"  onClick="change_bg(this)"><em>推荐</em></a></li>
            <li><a href="dl-toplist.jsp" onClick="change_bg(this)"><em>排行榜</em></a></li>
            <li><a href="dl-songlist.jsp"  onClick="change_bg(this)"><em>歌单</em></a></li>
            <li><a href="dl-radio.jsp" class="n_tj" onClick="change_bg(this)"><em>主播电台</em></a></li>
            <li><a href="dl-artist.jsp" onClick="change_bg(this)"><em>歌手</em></a></li>
            <li><a href="dl-cd.jsp" onClick="change_bg(this)"><em></em></a></li>
        </ul>
     </div>
    <div class="rdcontent">
    	<div class="radio">
    		<ul class="rdtype">
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image:url(images/1zhubo.png);"></div>
    					<em>明星做主播</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2chuangzuo.png)"></div>
    					<em>创作|翻唱</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/3tuokouxiu.png)"></div>
    					<em class="sange">脱口秀</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/4meiwen.png)"></div>
    					<em>美文读物</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/5yiyue.png)"></div>
    					<em>音乐故事</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/6qinggan.png)"></div>
    					<em>情感调频</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/7xiaoshuo.png)"></div>
    					<em>有声小说</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/8renwen.png)"></div>
    					<em>人文历史</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/9waiyu.png)"></div>
    					<em>外语世界</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-1erciyuan.png)"></div>
    					<em class="sange">二次元</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-2lvtu.png)"></div>
    					<em>旅途|城市</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-3yule.png)"></div>
    					<em>娱乐|影视</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-43D.png)"></div>
    					<em class="sange">3D|电子</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-5jiaoyu.png)"></div>
    					<em>校园|教育</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-6qinzi.png)"></div>
    					<em>亲子宝贝</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-7guangbo.png)"></div>
    					<em class="sange">广播剧</em>
    				</a>
    			</li>
    			<li  >
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-8quyi.png)"></div>
    					<em>相声曲艺</em>
    				</a>
    			</li>
    			<li class="apply">
    				<a href="">
    					<div class="icon" style="background-image: url(images/2-9apply.png)"></div>
    					<em>我要做主播</em>
    				</a>
    			</li>
    		</ul>
    		<div class="rdtop">
    			<div class="rdtop_left">
    				<div class="rdup">
    					<h3>
    						<a class="tj2" href="">推荐节目</a>
    					</h3>
    					<a class="more3" href="">更多></a>
    				</div>
    				
    				<!--<div class="rdlist">-->
    				<ul class="rdlist">
    					<li class="itm">
    						<a class="player" title="播放">
    							<img src="images/content(l1).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">人文历史</a>
    					</li>
    					<li class="itm_bg">
    						<a class="player">
    							<img src="images/content(l2).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">创作|翻唱</a>
    					</li>
    					<li class="itm">
    						<a class="player">
    							<img src="images/content(l3).jpg" />
    							<i class="bofang" title="播放"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">美文读物</a>
    						
    					</li>
    					<li class="itm_bg">
    						<a class="player">
    							<img src="images/content(l4).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">创作|翻唱</a>
    					</li>

    					<li class="itm">
    						<a class="player">
    							<img src="images/content(l5).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">外文世界</a>
    					</li>
    					<li class="itm_bg">
    						<a class="player">
    							<img src="images/content(l6).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">创作|翻唱</a>
    					</li>

    					<li class="itm">
    						<a class="player">
    							<img src="images/content(l7).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">情感|调频</a>
    					</li>
    					<li class="itm_bg">
    						<a class="player">
    							<img src="images/content(l8).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">情感|调频</a>
    					</li>

    					<li class="itm">
    						<a class="player">
    							<img src="images/content(l7).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">创作|翻唱</a>
    					</li>
    					<li class="itm_bg">
    						<a class="player">
    							<img src="images/content(l10).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ">
    							<h3><a class="Beaty" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h3>
    							<p><a class="kete" href="" title="科特 KurtSchneide">科特 KurtSchneider </a></p>
    						</div>
    						<a class="czk" href="">创作|翻唱</a>
    					</li>

    				</ul>
    				<!--</div>-->
    			</div>
    			<div class="rdtop_right">
    				<div class="rdup">
    					<h3>
    						<a class="tj2" href="">节目排行榜</a>
    					</h3>
    					<a class="more3" href="">更多></a>
    				</div>
    				
    				
    				
    				
    				<ul class="rdlist">
    					<li class="itm">
    						<div class="number">
    							<em class="rednum">01</em>
    							<span class="shangshengb">
    								<i class="new3" ></i>1
    							</span>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r1).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="" style="width: 90%;">
    								<i></i>
    							</i>
    						</span>
    					</li>
    					
    					
    					<li class="itm_bg">
    						<div class="number">
    							<em class="rednum">02</em>
    							<i class="new" ></i>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r2).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="que" style="">
    								<i class="jj"></i>
    							</i>
    						</span>
    					</li>
    					
    					<li class="itm">
    						<div class="number">
    							<em class="rednum">03</em>
    							<span class="shangshengb">
    								<i class="new3" ></i>3
    							</span>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r6).jpg"/>
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="" style="width: 90%;">
    								<i></i>
    							</i>
    						</span>
    					</li>
    					
    					
    					<li class="itm_bg">
    						<div class="number">
    							<em class="rednum">04</em>
    							<span class="xiajiangb">
    								<i class="new2" ></i>4
    							</span>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r4).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="que" style="">
    								<i class="jj"></i>
    							</i>
    						</span>
    					</li>
    					
    					<li class="itm">
    						<div class="number">
    							<em class="rednum">05</em>
    							<i class="new" ></i>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r5).jpg" />
    							<a href=""><i class="bofang" ></i></a>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="" style="width: 90%;">
    								<i></i>
    							</i>
    						</span>
    					</li>
    					
    					
    					<li class="itm_bg">
    						<div class="number">
    							<em class="rednum">06</em>
    							<i class="new" ></i>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r6).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="que" style="">
    								<i class="jj"></i>
    							</i>
    						</span>
    					</li>
    					
    					<li class="itm">
    						<div class="number">
    							<em class="rednum">07</em>
    							<i class="new" ></i>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r7).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="" style="width: 90%;">
    								<i></i>
    							</i>
    						</span>
    					</li>
    					
    					
    					<li class="itm_bg">
    						<div class="number">
    							<em class="rednum">08</em>
    							<i class="new" ></i>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r8).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="que" style="">
    								<i class="jj"></i>
    							</i>
    						</span>
    					</li>
    					<li class="itm">
    						<div class="number">
    							<em class="rednum">09</em>
    							<span class="xiajiangb">
    								<i class="new2" ></i>5
    							</span>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r9).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="" style="width: 90%;">
    								<i></i>
    							</i>
    						</span>
    					</li>
    					
    					
    					<li class="itm_bg">
    						<div class="number">
    							<em class="rednum">10</em>
    							<i class="new" ></i>
    						</div>
    						<a class="player2">
    							<img class="2img" src="images/content(r10).jpg" />
    							<i class="bofang"></i>
    						</a>
    						<div class="gequ2">
    							<h4 class="ming"><a class="Beaty2" href="" title="Beaty博物馆.遇见他">Beaty博物馆.遇见他</a></h4>
    							<p class="singer"><a class="kete2" href="" title="科特 KurtSchneider">科特 KurtSchneider </a></p>
    						</div>
    						<span class="dianjilv">
    							<i class="que" style="">
    								<i class="jj"></i>
    							</i>
    						</span>
    					</li>
    					
    					
    				</ul>
    			</div>
    		</div>
    		<div class="rdmore">
    			<div class="rmtitle">
    				<h3 class="rmh3">
    					<span class="f-ff2">
    						<a class="tj2" href="">音乐故事</a>
    						<span class="tj2_dian">·</span>电台
    					</span>
    				</h3>
    				<a class="more4">更多></a>
    			</div>
    			<ul class="rmlist">
    				<li >
    					<a class="cvr">
    						<img src="images/yinyuedj L1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="艳秋电台">艳秋电台</a>
    						</h3>
    						<p class="note">这治愈系声音得听</p>
    					</div>
    				</li>
    				<li class="">
    					<a class="cvr">
    						<img src="images/yinyuedj R1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="爱摇电台">爱摇电台</a>
    						</h3>
    						<p class="note">爱摇滚，爱生活</p>
    					</div>
    				</li>
    				<li class="lir" >
    					<a class="cvr">
    						<img src="images/yinyuedj L2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="艳我爱电影秋电台">艳我爱电影秋电台</a>
    						</h3>
    						<p class="note">电影哪些动听的音乐</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/yinyuedj R2 .jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="轻纱缦下花朵朵">轻纱缦下花朵朵</a>
    						</h3>
    						<p class="note">每首歌都有一个故事</p>
    					</div>
    				</li>
    			</ul>
    		</div>
    		<div class="rdmore">
    			<div class="rmtitle">
    				<h3 class="rmh3">
    					<span class="f-ff2">
    						<a class="tj2" href="" title="美文读物">美文读物</a>
    						<span class="tj2_dian">·</span>
    						电台
    					</span>
    				</h3>
    				<a class="more4">更多></a>
    			</div>
    			<ul class="rmlist">
    				<li>
    					<a class="cvr">
    						<img src="images/meiwendj L1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="代你朗读">代你朗读</a>
    						</h3>
    						<p class="note">每周明星陪你读好书</p>
    					</div>
    				</li>
    				<li >
    					<a class="cvr">
    						<img src="images/meiwendj R1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="有毒的文字">有毒的文字</a>
    						</h3>
    						<p class="note">那些文字有毒，让你无法自拔</p>
    					</div>
    				</li>
    				<li class="lir" >
    					<a class="cvr">
    						<img src="images/meiwendj L2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="当BOB来敲门">当BOB来敲门</a>
    						</h3>
    						<p class="note">你遇到弄你的Bob猫了吗</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/meiwendj R2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="杰克糖的故事盒">杰克糖的故事盒</a>
    						</h3>
    						<p class="note">声音甜甜的唐甜甜</p>
    					</div>
    				</li>
    			</ul>
    		</div>
    		<div class="rdmore">
    			<div class="rmtitle">
    				<h3 class="rmh3">
    					<span class="f-ff2">
    						<a class="tj2" href="" >脱口秀</a>
    						<span class="tj2_dian">·</span>电台
    					</span>
    				</h3>
    				<a class="more4">更多></a>
    			</div>
    			<ul class="rmlist">
    				<li>
    					<a class="cvr">
    						<img src="images/tuokouxiudj L1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="有没有电台">有没有电台</a>
    						</h3>
    						<p class="note">阿乔送你一锅毒鸡汤</p>
    					</div>
    				</li>
    				<li >
    					<a class="cvr">
    						<img src="images/tuokouxiudj R1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="彬彬有理">彬彬有理</a>
    						</h3>
    						<p class="note">教你怎么用男人</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/tuokouxiudj L2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="灼妹的趣味世界~">灼妹的趣味世界~</a>
    						</h3>
    						<p class="note">带你们一起看大神</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/tuokouxiudj R2 .jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="主播元元的冷知识">主播元元的冷知识</a>
    						</h3>
    						<p class="note">听三分钟够吹一年</p>
    					</div>
    				</li>
    			</ul>
    		</div>
    		<div class="rdmore">
    			<div class="rmtitle">
    				<h3 class="rmh3">
    					<span class="f-ff2">
    						<a class="tj2" href="">情感调频</a>
    						<span class="tj2_dian">·</span>电台
    					</span>
    				</h3>
    				<a class="more4">更多></a>
    			</div>
    			<ul class="rmlist">
    				<li>
    					<a class="cvr">
    						<img src="images/qinggandj L1.jpg"/>
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="米莉.听见花开">米莉.听见花开</a>
    						</h3>
    						<p class="note">米莉倾听你的故事</p>
    					</div>
    				</li>
    				<li >
    					<a class="cvr">
    						<img src="images/qinggandj R1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="睡不着电台|story">睡不着电台|story</a>
    						</h3>
    						<p class="note">深夜里陪你流浪</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/qinggandj L2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="小森林电台">小森林电台</a>
    						</h3>
    						<p class="note">唐宁的专属电台</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/qinggandj R2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href=""  title="亭林听说">亭林听说</a>
    						</h3>
    						<p class="note">韩寒乐队亭林镇独唱团官方电台</p>
    					</div>
    				</li>
    			</ul>
    		</div>
    		<div class="rdmore">
    			<div class="rmtitle">
    				<h3 class="rmh3">
    					<span class="f-ff2">
    						<a class="tj2" href=""  title="">创作|翻唱</a>
    						<span class="tj2_dian">·</span>电台
    					</span>
    				</h3>
    				<a class="more4">更多></a>
    			</div>
    			<ul class="rmlist">
    				<li>
    					<a class="cvr">
    						<img src="images/chuangz L1.jpg"/>
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href=""  title="记得醒来【蓝电台】">记得醒来【蓝电台】</a>
    						</h3>
    						<p class="note">缠绵的声音听了不想起床</p>
    					</div>
    				</li>
    				<li >
    					<a class="cvr">
    						<img src="images/chuangz R1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href=""  title="Vkの歌曲电台">Vkの歌曲电台</a>
    						</h3>
    						<p class="note">用心唱歌的网瘾少年</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/chuangzvL2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href=""  title="白若溪的电台">白若溪的电台</a>
    						</h3>
    						<p class="note">一听就被迷住的声音</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/chuangz R2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="Smile_小千">Smile_小千</a>
    						</h3>
    						<p class="note">实力派男神美少千</p>
    					</div>
    				</li>
    			</ul>
    		</div>
    		<div class="rdmore">
    			<div class="rmtitle">
    				<h3 class="rmh3">
    					<span class="f-ff2">
    						<a class="tj2" href="">人文历史</a>
    						<span class="tj2_dian">·</span>电台
    					</span>
    				</h3>
    				<a class="more4">更多></a>
    			</div>
    			<ul class="rmlist">
    				<li>
    					<a class="cvr">
    						<img src="images/renwen L1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="一首歌的时间，一页书">一首歌的时间，一页书</a>
    						</h3>
    						<p class="note">一首歌一页书</p>
    					</div>
    				</li>
    				<li >
    					<a class="cvr">
    						<img src="images/renwen R1.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="PAGE SEVEN 胡先笙">PAGE SEVEN 胡先笙</a>
    						</h3>
    						<p class="note">胡先笙为您解读这个世界</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/renwen L2.jpg"/>
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="加州101电台">加州101电台</a>
    						</h3>
    						<p class="note">全方位满足你的好奇心</p>
    					</div>
    				</li>
    				<li class="lir">
    					<a class="cvr">
    						<img src="images/renwen R2.jpg" />
    					</a>
    					<div class="cnt">
    						<h3 class="rmlh3">
    							<a class="" href="" title="围炉夜话">围炉夜话</a>
    						</h3>
    						<p class="note">食物背后不为人知的故事</p>
    					</div>
    				</li>
    			</ul>
    		</div>
    	</div>
    </div>
				<%@include file="bottom.jsp"%>
    
    <%-- <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>
        
    </div> --%>
    
   				   
    
</div>
    <!-- <a href="" title="回到顶部" id="back"></a>
   	<script src="js/showBtmbar.js"></script> -->
   	
   	<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>