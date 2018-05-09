<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MyLove Music</title>
<link rel="icon" href="images/music.ico"/>
<link rel="stylesheet" href="css/download.css"/>
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<style>
.mynav{
display:none;
}
</style>
<script type="text/javascript">
$(function(){
	$("#head4>span>a").attr("class","first_a");
})
</script>
</head>

<body>
<div class="body1">
	<%@include file="page/login.jsp" %>
	<div class="nav_1"></div>
    
    
    
    
    
    
    <div class="show">
    	
   		<div class="show_1">
        	 <div id="list">
             	<a href="">
                 <img  id="pic" src="images/1.png"/>
            	</a>
                <ul id="ban_ul">
                    <li onmouseover="show(1)" onmouseout="start()"></li>
                    <li onmouseover="show(2)" onmouseout="start()"></li>
                    <li onmouseover="show(3)" onmouseout="start()"></li>
           		</ul>
             </div>
             <div class="pclogo">
                <a href="javascript:void()" class="aos_download">
                    <i></i>
                    <em class="anzhuo">安卓版</em>
                    <em class="version">V3.7.2</em> 
                </a>  
                <a href="javascript:void()" class="ios_download">
                    <i></i>
                    <em class="anzhuo">iphone版</em>
                    <em class="version">V3.7.0</em> 
                </a> 
                <a href="javascript:void()" class="ipad_download">
                    <i></i>
                    <em class="anzhuo">ipad版</em>
                    <em class="version">V1.5.0</em> 
                </a>
                 <a href="javascript:void()" class="mac_download">
                    <i></i>
                    <em class="anzhuo">Mac版</em>
                    <em class="version">V1.4.4</em> 
                </a>
                 <a href="javascript:void()" class="pc_download">
                    <i></i>
                    <em class="anzhuo">PC版</em>
                    <em class="version">V2.1.0</em> 
                </a>
                <a href="javascript:void()" class="uwp">
                    <i></i>
                    <em class="anzhuo">UWP版</em>
                    <em class="version">V1.2.3</em> 
                </a>
                 <a href="javascript:void()" class="WP">
                    <i></i>
                    <em class="anzhuo">WP版</em>
                    <em class="version">V1.5.0</em> 
                </a>
                <a href="javascript:void()" class="Linux">
                    <i></i>
                    <em class="anzhuo">Linux版</em>
                    <em class="version">V1.0.0</em> 
                </a>
               <div class="pc">
                 <a href="javascript:void()" class="pcu">
                    <em></em>
                    <span class="anzhuo">PC版更新日志</span>
                </a>
             </div>
             
             </div>
             </div> 
             <div id="bg">
                 <div id="code">
                    <p>扫描二维码下载</p> 
                 </div>
             </div>
    </div>
    <div class="content_1">
    	<div class="ziti">
            <span class="span1">千万曲库 首首CD音质</span></br>
            <span class="span2">囊括百万首320Kbps超品质音乐，你在用手机听歌时，</span></br>
            <span class="span3">也能感受到CD音质，更能免费离线听歌</span> 
        </div>
        <div class="b1"><img src="images/b1.jpg" /></div>
    </div>
    <div class="content_2">
   		<div class="b2"><img src="images/b2.jpg"/></div> 
        <span class="p1">千位明星 亲自推荐音乐</span></br>
        <span class="p2">陶喆，羽泉等<a class="red">千位明星已入驻</a>，亲自创建私房歌单，录制独</span></br>
        <span class="p3">家DJ节目，推荐他们心中的好音乐</span>
    </div>
    <div class="content_3">
        <span class="p4">社交关系 发现全新音乐</span></br>
        <span class="p5">你可以<a class="red1">关注明星</a>、DJ和好友，通过浏览他们的动态、收藏和</span></br>
        <span class="p6">分享，发现更多全新好音乐</span>
        <div class="b3"><img src="images/b3.jpg"/></div> 
    </div>
    <div class="content_4">
   		<div class="b4"><img src="images/b4.jpg"/></div> 
        <span class="p7">手机电脑 歌单实时同步</span></br>
        <span class="p8">只要一个账号，你就可以同步在手机、电脑上创建、收藏</span></br>
        <span class="p9">的歌单，<a class="red2">随时随地畅享好音乐</a></span> 
    </div>
    <div class="content_5">
    	 <span class="p10">听歌识曲 助你疯狂猜歌</span></br>
        <span class="p11">歌曲很动听却不知道歌名，歌名在嘴边却想不起来</span></br>
        <span class="p12">用<a class="red1">听歌识曲</a>功能，几秒钟就知道歌名</span>
        <div class="b5"><img src="images/b5.jpg"/></div> 
    </div>
    <div class="content_6">
   		<span class="span1">网易云音乐 听见好时光</span> 
        <span class="span2">下载网易云音乐客户端，随时随地畅享动听好音乐</span>
        <div class="b6"><img src="images/b6.jpg" class="img1"/><a href="javascript:void()" id="a1"><img src="images/c_pc1.png"/></a></div>
        <div class="b7"><img src="images/b7.png" class="img2"/><a href="javascript:void()" id="a2"><img src="images/c_ipone1.png"/></a></div>
        <div class="b8"><img src="images/b8.jpg" class="img3"/><a href="javascript:void()" id="a3"><img src="images/c_ipad1.png"/></a></div>
        <div class="b9"><img src="images/b9.png" class="img4"/><a href="javascript:void()" id="a4"><img src="images/c_az1.png"/></a></div>
        <div class="b10"><img src="images/b10.png" class="img5"/><a href="javascript:void()" id="a5"><img src="images/c_wp1.png"/></a></div>
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
    <div class="auto" id="aut" style="top:147px;left:418px;display:none;">
    	<div class="bar" id="mov">
        	<div class="tt">登录</div>
        </div>
        <div class="cnt">
        	<div class="con">
            	<div class="con-t">
                	<div class="main">
                    	<div class="plt"></div>
                        <div class="mgt">
                        	<a href="javascript:void(0)" class="m-btn" id="sj"><i>手机号登录</i></a>
                        </div>
                        <div class="mgt">
                        	<a href="javascript:void(0)" class="m-btn-1" id="zc-1"><i>注&nbsp;&nbsp; 册</i></a>
                        </div>
                    </div>
                    <div class="alt">
                    	<ul>
                        	<li><a href="http://music.163.com/api/sns/authorize?snsType=10&clientType=web2&callbackType=Login&forcelogin=true" target="_blank"><i class="wx"></i>微信登录</a></li>
                            <li><a href="http://music.163.com/api/sns/authorize?snsType=5&clientType=web2&callbackType=Login&forcelogin=true" target="_blank"><i class="QQ"></i>QQ登录</a></li>
                            <li><a href="http://music.163.com/api/sns/authorize?snsType=2&clientType=web2&callbackType=Login&forcelogin=true" target="_blank"><i class="wb"></i>微博登录</a></li>
                            <li><a href="javascript:void(0)" id="wydl"><i class="wy"></i>网易邮箱帐号登录</a></li>
                        </ul>
                    </div>
                </div>
                <div class="con-b">
                	<a href="http://music.163.com/api/sns/authorize?snsType=6&clientType=web2&callbackType=Login&forcelogin=true" class="con-a" target="_blank">腾讯微博登录  ></a>
                </div>
            </div>
        </div>
        <span class="cls" title="点击关闭" id="cls">×</span>
    </div>
    <div class="auto-1" style="display:none;">&nbsp;</div>
    
    <div class="auto" id="aut-phone" style="top:35px;left:418px;display:none;">
    	<div class="bar" id="mov-1">
        	<div class="tt">手机号登录</div>
        </div>
        <div class="cnt">
        	<div class="con">
            	<div class="n-log">
                	<div><input type="text" class="ipt" placeholder="请输入手机号" /></div>
                    <div class="mgt-1"><input type="password" class="ipt" placeholder="请输入密码" /></div>
                    <div class="err" style="display:none;"><i></i></div>
                    <div class="mgt-1">
                    	<label class="lab">
                        	<input type="checkbox" checked="checked" class="u-au" />
                            自动登录
                            <a href="javascript:void(0)" class="forget">忘记密码？</a>
                        </label>
                    </div>
                    <div class="mgt-2">
                    	<a href="dl-download.html" class="u-dl"><i>登&nbsp;&nbsp;录</i></a>
                    </div>
                </div>
                <div class="con-b" id="ret">
                	<a href="javascript:void(0)" class="con-r" id="other">< 其他登录方式</a>
                	<a href="javascript:void(0)" class="con-a" id="zc-2">没有账号？免费注册 ></a>
                </div>
            </div>
        </div>
        <span class="cls" title="点击关闭" id="cls-1">×</span>
    </div>
    <div class="auto-1" style="display:none;">&nbsp;</div>
    
    <div class="auto" id="aut-zc" style="top:35px;left:418px;display:none;">
    	<div class="bar" id="mov-2">
        	<div class="tt">手机号注册</div>
        </div>
        <div class="cnt">
        	<div class="con">
            	<div class="n-log">
                手机号：<br /><br />
                	<div><input type="text" class="ipt" placeholder="请输入手机号" /></div><br />
                密码：<br />    
                	<div class="mgt-1"><input type="password" class="ipt" placeholder="设置登录密码，不少于6位" /></div>
                
                    <div class="err" style="display:none;"><i></i></div>
                    
                    <div class="mgt-2">
                    	<a href="javascript:void(0)" class="u-dl"><i>下一步</i></a>
                    </div>
                </div>
                <div class="con-b" id="ret">
                	<a href="javascript:void(0)" class="con-r" id="ret1">< 返回登录</a>
                </div>
            </div>
        </div>
        <span class="cls" title="点击关闭" id="cls-2">×</span>
    </div>
    <div class="auto-1" style="display:none;">&nbsp;</div>
    
    <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>				   
    
</div>
    <script src="js/download.js"></script>
</body>
</html>
