<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>全部歌单-歌单-网易云音乐</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/songlist.css" />
</head>

<body>
<div class="body1">
	<%@include file="page/login.jsp" %>
    <div class="s-bd" id="bd">
    	<div class="all">
        	<div class="u-title">
            	<h3>
                	<span class="s-all">全部</span>
                    <a href="javascript:void(0)" class="u-a" id="hidden-link">
                        <i>选择分类<em class="u-icn"></em></i>
                    </a>
                </h3>
                <div class="u-btn">
                	<a href="#" class="a1">热门</a>
                    <a href="#" class="a2">最新</a>
                </div>
            </div>
            <div id="hiddenBox" class="select" style="display:none;">
            	<div class="hd">
                	<i class="icn">
                    	
                    </i>
                </div>
                <div class="bd">
                	<h3><a href="javascript:void(0)" class="a-btn"><em>全部风格</em></a></h3>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-0"></i>语种</dt>
                        <dd>
                        	<a href="javascript:void(0)" class="s-fc1">华语</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">欧美</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">日语</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">韩语</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">粤语</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">小语种</a><span class="line">|</span>
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-1"></i>风格</dt>
                        <dd>
                        	<a href="javascript:void(0)" class="s-fc1">流行</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">摇滚</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">民谣</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">电子</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">舞曲</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">说唱</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">轻音乐</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">爵士</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">乡村</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">R&B/Soul</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">古典</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">民族</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">英伦</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">金属</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">朋克</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">蓝调</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">雷鬼</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">世界音乐</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">拉丁</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">另类/独立</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">New Age</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">古风</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">后摇</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">Bossa Nova</a><span class="line">|</span>
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-2"></i>场景</dt>
                        <dd>
                        	<a href="javascript:void(0)" class="s-fc1">清晨</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">夜晚</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">学习</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">工作</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">午休</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">下午茶</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">地铁</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">驾车</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">运动</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">旅行</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">散步</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">酒吧</a><span class="line">|</span>
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-3"></i>情感</dt>
                        <dd>
                        	<a href="javascript:void(0)" class="s-fc1">怀旧</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">清新</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">浪漫</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">性感</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">伤感</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">治愈</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">放松</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">孤独</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">感动</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">兴奋</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">快乐</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">安静</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">思念</a><span class="line">|</span>
                        </dd>
                    </dl>
                    <dl class="f-cb">
                    	<dt><i class="u-icon-4"></i>主题</dt>
                        <dd class="last">
                        	<a href="javascript:void(0)" class="s-fc1">影视原声</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">ACG</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">校园</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">游戏</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">70后</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">80后</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">90后</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">网络歌曲</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">KTV</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">经典</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">翻唱</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">吉他</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">钢琴</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">器乐</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">儿童</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">榜单</a><span class="line">|</span>
                            <a href="javascript:void(0)" class="s-fc1">00后</a><span class="line">|</span>
                        </dd>
                    </dl>
                </div>
                <div class="ft"></div>
            </div>
            <ul class="gd">
            	<li>
                	<div class="u-cover">
                                	<img src="images/109951162795302216.jpg" />
                                    <a href="" class="ul_mya" title="情深是我，缘浅是我和你"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">10万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="情深是我，缘浅是我和你">情深是我，缘浅是我和你</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="墨_安澜" class="nm-ico">墨_安澜</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18758767881972627.jpg" />
                                    <a href="" class="ul_mya" title="[日系女声]你眼泪的源头，是内心的秘密"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">33817</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="[日系女声]你眼泪的源头，是内心的秘密">[日系女声]你眼泪的源头，是内心的秘密</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="肥阳frank丿Reol-Arufakun" class="nm-ico">肥阳frank丿Reol-Arufakun</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/109951162794387783.jpg" />
                                    <a href="" class="ul_mya" title="[纸短情长 小心轻放]我吹过清风喝过烈酒"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">53166</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="[纸短情长 小心轻放]我吹过清风喝过烈酒">[纸短情长 小心轻放]我吹过清风喝过烈酒</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="我们说好不分梨" class="nm-ico">我们说好不分梨</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3250156393666106.jpg" />
                                    <a href="" class="ul_mya" title="励志摇滚男声丨勇敢去活！趁生命气息逗留"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">24215</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="励志摇滚男声丨勇敢去活！趁生命气息逗留">励志摇滚男声丨勇敢去活！趁生命气息逗留</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="漆黑丶烈焰使" class="nm-ico">漆黑丶烈焰使</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3250156393731906.jpg" />
                                    <a href="" class="ul_mya" title="韩语：霸气开场！hold不住的爆炸节奏"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">45791</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="韩语：霸气开场！hold不住的爆炸节奏">韩语：霸气开场！hold不住的爆炸节奏</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="小曦芭" class="nm-ico">小曦芭</a>
                                    
                                </p>
                </li>
                
                <li>
                	<div class="u-cover">
                                	<img src="images/18818141509869883.jpg" />
                                    <a href="" class="ul_mya" title="国人钢琴|悠扬琴音，优雅与淳朴"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">24万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="国人钢琴|悠扬琴音，优雅与淳朴">国人钢琴|悠扬琴音，优雅与淳朴</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="maaaad" class="nm-ico">maaaad</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/109951162794190343.jpg" />
                                    <a href="" class="ul_mya" title="⚡️ 2016百威风暴storm电音节上海站现场"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">60万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="⚡️ 2016百威风暴storm电音节上海站现场">⚡️ 2016百威风暴storm电音节上海站现场</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="-GIRLHOODH-" class="nm-ico">-GIRLHOODH-</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/109951162793199350.jpg" />
                                    <a href="" class="ul_mya" title="「窒息女嗓」节奏里无法抗拒的毒糖果"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">32036</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="「窒息女嗓」节奏里无法抗拒的毒糖果">「窒息女嗓」节奏里无法抗拒的毒糖果</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="朩朩青尘" class="nm-ico">朩朩青尘</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                 <li>
                	<div class="u-cover">
                                	<img src="images/18511377765775811.jpg" />
                                    <a href="" class="ul_mya" title="一听就上瘾的外语歌。"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">30万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="一听就上瘾的外语歌。">一听就上瘾的外语歌。</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="右心丶" class="nm-ico">右心丶</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18710389370382398.jpg" />
                                    <a href="" class="ul_mya" title="『轻摇滚』断虹霁雨，秋空煜煜"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">39万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="『轻摇滚』断虹霁雨，秋空煜煜">『轻摇滚』断虹霁雨，秋空煜煜</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="ChrisZen" class="nm-ico">ChrisZen</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/1416170992884551.jpg" />
                                    <a href="" class="ul_mya" title="韩剧心动瞬间，少女心爆棚的BGM"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">23万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="韩剧心动瞬间，少女心爆棚的BGM">韩剧心动瞬间，少女心爆棚的BGM</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="Mrs-闵" class="nm-ico">Mrs-闵</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18721384486662159.jpg" />
                                    <a href="" class="ul_mya" title="「日系」活力电音，一场电音与女毒的轰炸"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">81222</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="「日系」活力电音，一场电音与女毒的轰炸">「日系」活力电音，一场电音与女毒的轰炸</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="wow-麻美_小雨快乐" class="nm-ico">wow-麻美_小雨快乐</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18690598161109437.jpg" />
                                    <a href="" class="ul_mya" title="禅意电子 Chillstep ｜静如处子动若脱兔"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">10万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="禅意电子 Chillstep ｜静如处子动若脱兔">禅意电子 Chillstep ｜静如处子动若脱兔</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="药童INNO" class="nm-ico">药童INNO</a>
                                    <sup class="u-icn u-icn2"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/1419469527798351.jpg" />
                                    <a href="" class="ul_mya" title="【日系纯音】旅行之后，用一曲纯音舒缓身心"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">17万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="【日系纯音】旅行之后，用一曲纯音舒缓身心">【日系纯音】旅行之后，用一曲纯音舒缓身心</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="亚涅斯特" class="nm-ico">亚涅斯特</a>
                                   
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/109951162794387783.jpg" />
                                    <a href="" class="ul_mya" title="【旧时华语】不是所有的卑微，都会开出花来"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">33万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="【旧时华语】不是所有的卑微，都会开出花来">【旧时华语】不是所有的卑微，都会开出花来</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="可尼晏" class="nm-ico">可尼晏</a>
                                   
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3417282154637737.jpg" />
                                    <a href="" class="ul_mya" title="早上还在赖床？来一单鸡血歌让你不再犯困❤"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">26万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="早上还在赖床？来一单鸡血歌让你不再犯困❤">早上还在赖床？来一单鸡血歌让你不再犯困❤</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="薛之谦的丈母娘" class="nm-ico">薛之谦的丈母娘</a>
                                   
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18677404021869447.jpg" />
                                    <a href="" class="ul_mya" title="【韩语】轻快的恋爱小调"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">25万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="【韩语】轻快的恋爱小调">【韩语】轻快的恋爱小调</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="顾辛总攻" class="nm-ico">顾辛总攻</a>
                                   
                                </p>
                </li>
                 <li>
                	<div class="u-cover">
                                	<img src="images/1380986604648775.jpg" />
                                    <a href="" class="ul_mya" title="华语hip-hop 真正的饶舌Rap"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">32万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="华语hip-hop 真正的饶舌Rap">华语hip-hop 真正的饶舌Rap</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="诶呦_大牛" class="nm-ico">诶呦_大牛</a>
                                   
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/109951162795324848.jpg" />
                                    <a href="" class="ul_mya" title="東方彩鸟邦乐•三味线与和曲的幽雅"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">14万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="東方彩鸟邦乐•三味线与和曲的幽雅">東方彩鸟邦乐•三味线与和曲的幽雅</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="PurionPurion" class="nm-ico">PurionPurion</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3413983636223737.jpg" />
                                    <a href="" class="ul_mya" title="澄澈女声♪如那涓涓细流滋润你心田"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">18万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="澄澈女声♪如那涓涓细流滋润你心田">澄澈女声♪如那涓涓细流滋润你心田</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="Legendarylovers" class="nm-ico">Legendarylovers</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18833534672659345.jpg" />
                                    <a href="" class="ul_mya" title="【海绵宝宝】厉害了我的哥，海绵宝宝玩硬核"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">34万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="【海绵宝宝】厉害了我的哥，海绵宝宝玩硬核">【海绵宝宝】厉害了我的哥，海绵宝宝玩硬核</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="空虚小编" class="nm-ico">空虚小编</a>
                                    <sup class="u-icn u-icn-1"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18768663486610127.jpg" />
                                    <a href="" class="ul_mya" title="Enya精选集：新世纪的天籁之音"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">13万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="Enya精选集：新世纪的天籁之音">Enya精选集：新世纪的天籁之音</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="xept" class="nm-ico">xept</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18793952254080183.jpg" />
                                    <a href="" class="ul_mya" title="年轮里唱给你，关于时间的歌。"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">57万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="年轮里唱给你，关于时间的歌。">年轮里唱给你，关于时间的歌。</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="卡斯帕" class="nm-ico">卡斯帕</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18494885091337672.jpg" />
                                    <a href="" class="ul_mya" title="『倾听电影』每座心灵的孤岛，互为彼岸"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">20万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="『倾听电影』每座心灵的孤岛，互为彼岸">『倾听电影』每座心灵的孤岛，互为彼岸</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="蝶影丛虫" class="nm-ico">蝶影丛虫</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3265549597276368.jpg" />
                                    <a href="" class="ul_mya" title="九月最IN电子音乐推荐"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">20万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="九月最IN电子音乐推荐">九月最IN电子音乐推荐</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="welphenEDM" class="nm-ico">welphenEDM</a>
                                    <sup class="u-icn u-icn-1"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3438172871579810.jpg" />
                                    <a href="" class="ul_mya" title="百段爱的佳话•百首不朽恋曲"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">119万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="百段爱的佳话•百首不朽恋曲">百段爱的佳话•百首不朽恋曲</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="yin雪燕" class="nm-ico">yin雪燕</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3427177775166450.jpg" />
                                    <a href="" class="ul_mya" title="Billboard:16年乐坛最炙手可热的新生代艺人"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">80798</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="Billboard:16年乐坛最炙手可热的新生代艺人">Billboard:16年乐坛最炙手可热的新生代艺人</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="welphenEDM" class="nm-ico">welphenEDM</a>
                                    <sup class="u-icn u-icn-1"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/109951162793495690.jpg" />
                                    <a href="" class="ul_mya" title="蓝调老炮教你如何撩妹"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">111万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="蓝调老炮教你如何撩妹">蓝调老炮教你如何撩妹</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="来治猩猩的小王子" class="nm-ico">来治猩猩的小王子</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18703792300554395.jpg" />
                                    <a href="" class="ul_mya" title="PPAP双胞胎，市野莉佳&市野莉子"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">36513</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="PPAP双胞胎，市野莉佳&市野莉子">PPAP双胞胎，市野莉佳&市野莉子</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="ZLZTL" class="nm-ico">ZLZTL</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/1383185643831443.jpg" />
                                    <a href="" class="ul_mya" title="【韩】闲暇逸致 沉迷于这自带灵魂的嗓音。"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">15万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="【韩】闲暇逸致 沉迷于这自带灵魂的嗓音。">【韩】闲暇逸致 沉迷于这自带灵魂的嗓音。</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="一颗沮丧的橙子" class="nm-ico">一颗沮丧的橙子</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18542164091197011.jpg" />
                                    <a href="" class="ul_mya" title="「纯音/阅读」静心享受这惬意的时光。"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">33万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="「纯音/阅读」静心享受这惬意的时光。">「纯音/阅读」静心享受这惬意的时光。</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="野良兔" class="nm-ico">野良兔</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/3420580736026170.jpg" />
                                    <a href="" class="ul_mya" title="『静心纯音』钢琴的哼唱，让世界安静下来"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">127万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="『静心纯音』钢琴的哼唱，让世界安静下来">『静心纯音』钢琴的哼唱，让世界安静下来</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="maaaad" class="nm-ico">maaaad</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18558656765563519.jpg" />
                                    <a href="" class="ul_mya" title="韩国女团全收录，每团一首精选"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">214万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="韩国女团全收录，每团一首精选">韩国女团全收录，每团一首精选</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="LalisaManoban" class="nm-ico">LalisaManoban</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/18749971788855841.jpg" />
                                    <a href="" class="ul_mya" title="治愈孤独‖不要怕 就算世界无童话"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">262万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="治愈孤独‖不要怕 就算世界无童话">治愈孤独‖不要怕 就算世界无童话</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="天下第一二公子" class="nm-ico">天下第一二公子</a>
                                    
                                </p>
                </li>
                <li>
                	<div class="u-cover">
                                	<img src="images/1367792480573721.jpg" />
                                    <a href="" class="ul_mya" title="「日语唱见」一瞬间的感动，一辈子的追随。"></a>
                                    <div class="bottom">
                                    	<a href="" class="play"></a>
                                        <span class="icon_play"></span>
                                        <span class="num">51万</span>
                                    </div>
                                </div>
                                <p class="dec">
                                	<a href="" class="tit" title="「日语唱见」一瞬间的感动，一辈子的追随。">「日语唱见」一瞬间的感动，一辈子的追随。</a>
                                </p>
                                <p class="myp">
                                	<span class="s-by">by</span>
                                    <a href="#" title="肥阳frank丿Reol-Arufakun" class="nm-ico">肥阳frank丿Reol-Arufakun</a>
                                    <sup class="u-icn"></sup>
                                </p>
                </li>
            </ul>
            <div id="page">
            	<div class="u-page" id="u-p">
                	<input type="button" class="prev" value="上一页" onClick="pre()" />
                    <a href="songlist.html" class="a" onClick="change_pg(this)">1</a>
                    <a href="songlist2.html" class="selected" onClick="change_pg(this)">2</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">3</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">4</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">5</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">6</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">7</a>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">8</a>
                    <span class="el">...</span>
                    <a href="javascript:void(0)" class="a" onClick="change_pg(this)">42</a>
                    <input type="button" class="nex" value="下一页" onClick="next()" />
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    <div id="footer">
    	<div class="footer1">
        <a href="" class="left"><span class="span1">独立音乐人招募计划</span></br><span class="span2">加入我们 即将与超过亿万乐迷互动</span></a>
        <a href="" class="center"><span class="span3">音乐专栏招募计划</span></br><span class="span4">加入我们 与同道中人交流心得</span></a>
        <div class="right">
       		<p class="p1">
           		<a href="">关于网易</a><span>-</span>
                <a href="">客户服务</a><span>-</span>
                <a href="">服务条款</a><span>-</span>
                <a href="">网站导航</a>
                网易公司版权所有&copy;1997-2017
            </p> 
            <p>
           		杭州网易雷火科技有限公司运营：
                <a href="">浙网文[2016]0155-055号</a>
                <a href=""><i id="write"></i>意见反馈</a> 
            </p>
        </div>
       	</div>
    </div>
    

    
    
    <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>			    
    
</div>
    <a href="" title="回到顶部" id="back"></a>
    <script src="js/songlist.js"></script>
</body>
</html>
