<%@page import="com.yc.wyyyy.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove music</title>
<!-- <link rel="short icon" href="images/music.ico" /> -->
<link rel="stylesheet" href="css/dl-index.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
var flag=0;
$(function(){
	$("#head1").attr("class","findMusic");
	$("#head1>span>a").attr("class","first_a");
})
function addIntegral(usid){
	if(flag==1){
		alert("今日已签到请勿重复签到");
		return;
	}
	$.post("userInfoServlet",{op:"addIntegral",usid:usid},function(data){
		data=parseInt($.trim(data));
		if(data>0){
			alert("签到成功");
			
		}
		flag=1;
	},"text");
}
</script>
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
	<input type="hidden" value="${sessionScope.currentLogin.usid}" id="usid" />
    <div class="mynav">
    	<ul class="nav" id="nv">
        	<li><a href="dl-index.jsp" class="n_tj" onClick="change_bg(this)"><em>推荐</em></a></li>
            <li><a href="dl-toplist.jsp" onClick="change_bg(this)"><em>排行榜</em></a></li>
            <li><a href="dl-songlist.jsp" onClick="change_bg(this)"><em>歌单</em></a></li>
            <li><a href="dl-radio.jsp" onClick="change_bg(this)"><em>主播电台</em></a></li>
            <li><a href="dl-artist.jsp" onClick="change_bg(this)"><em>歌手</em></a></li>
        </ul>
     </div>
    <div id="banner">
    	<div id="d1"><a href="javascript:void(0)" id="dla"></a></div>
    	<div id="banner_t">
        	<a href=""><img src="images/banner_1.jpg" alt="图片" title="图片" id="pic" /></a>
            <ul id="ban_ul">
            	<a href=""><li onMouseOver="changePic(1)" onMouseOut="start()"></li></a>
                <a href=""><li onMouseOver="changePic(2)" onMouseOut="start()"></li></a>
                <a href=""><li onMouseOver="changePic(3)" onMouseOut="start()"></li></a>
                <a href=""><li onMouseOver="changePic(4)" onMouseOut="start()"></li></a>
                <a href=""><li onMouseOver="changePic(5)" onMouseOut="start()"></li></a>
                <a href=""><li onMouseOver="changePic(6)" onMouseOut="start()"></li></a>
                <a href=""><li onMouseOver="changePic(7)" onMouseOut="start()"></li></a>
                <a href=""><li onMouseOver="changePic(8)" onMouseOut="start()"></li></a>
            </ul>
        </div>
        <div id="download">
        	<div class="div_a"><a href="dl-download.html"></a></div>
            <div class="div_s"><span>PC 安卓 iPhone WP iPad Mac 六大客户端</span></div>
        </div>
        <div id="dr"><a href="javascript:void(0)" id="dra"></a></div>
    </div>
    <div id="content">
    	<div class="article">
        	<div class="article_left">
            	<div class="left_con">
                	<div class="rmtj">
                    	<div class="tj_l">
                        	<span class="quan"></span>
                            <a href="" class="left_con_a">热门推荐</a>
                        </div>
                        <div class="tj_m">
                        </div>
                        <div class="tj_r">
                        	<a href="dl-songlist.jsp">更多</a><i class="left_con_i"></i>
                        </div> 
                        <ul class="tj_ul" id="headSongSheet">
                        	
                        </ul>      
                    </div>
                    <div class="null"><a href=""><img src="images/ad.jpg"><i></i></a></div>
                    <div class="xdsj">                   	
                        <div class="rmtj">
                            <div class="tj_l">
                                <span class="quan"></span>
                                <a href="" class="left_con_a">新碟上架</a>
                            </div>
                            <div class="tj_r">
                                <a href="">更多</a><i class="left_con_i"></i>
                            </div> 
                        </div>
                        <div class="disc">
                    		<div class="inner" id="a_roll">
                            	<a href="javascript:void(0)" class="l_a" id="l_a"></a>
                                <div class="roll">
                                	
                                   
                                   
                                    <ul id="roll_ul">
                                    	<li>
                                        	<div class="u_cov">
                                            	<img src="images/17922039532951715.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1369991503018202.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1371091014397929.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1389782712504915.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1390882223811503.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                    	<li>
                                        	<div class="u_cov">
                                            	<img src="images/3394192420511868.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/3417282151248927.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/17922039532951715.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/18676304509663787.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/18685100602523981.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                            <li>
                                        	<div class="u_cov">
                                            	<img src="images/17922039532951715.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1369991503018202.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1371091014397929.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1389782712504915.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/1390882223811503.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/3394192420511868.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/3417282151248927.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/17922039532951715.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/18676304509663787.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                        <li>
                                        	<div class="u_cov">
                                            	<img src="images/18685100602523981.jpg" />
                                                <a href="#" class="msk" title="Illuminate (Deluxe)"></a>
                                                <a href="#" class="i_play" title="播放"></a>
                                            </div>
                                            <p>
                                            	<a href="" title="Illuminate (Deluxe)" class="tit s_fc0">Illuminate (Deluxe)</a>
                                            </p>
                                            <p title="Shawn Mendes">
                                            	<a href="" class="s_fc3">Shawn Mendes</a>
                                            </p>
                                        </li>
                                    
                                    	
                                    </ul>
                                </div>
                                <a href="javascript:void(0)" class="r_a" id="r_a"></a>
                            </div>
                   	    </div>
                    </div>
                    <div class="bd">
                   		 <div class="rmtj">
                            <div class="tj_l">
                                <span class="quan"></span>
                                <a href="" class="left_con_a">榜单</a>
                            </div>
                            <div class="tj_r">
                                <a href="dl-toplist.jsp">更多</a><i class="left_con_i"></i>
                            </div> 
                        </div>
                        <div class="blist">
                        	<dl class="blk">
                            	<dt class="top">
                                	<div class="cover">
                                    	<img class="b_img" src="images/7744959906898786.jpg" />
                                        <a href="dl-toplist.jsp" class="msk" title="飙升榜"></a>
                                    </div>
                                    <div class="tit">
                                    	<a href="dl-toplist.jsp" title="飙升榜">
                                        	<h3 class="fs">MyLove飙升榜</h3>
                                        </a>
                                        <div class="btn1">
                                        	<a href='javascript:parent.playSong("1")' title="播放" class="bf"></a>
                                            <a href="#" title="收藏" class="sc"></a>
                                        </div>
                                    </div>
                                </dt>
                                <dd id="fastest">
                                	<ol id="ol">
                                       
                                    </ol>
                                    <div class="more"><a href="dl-toplist.jsp" class="ckqb">查看全部&gt;</a></div>                                    
                                </dd>
                            </dl>
                            <dl class="blk">
                            	<dt class="top">
                                	<div class="cover">
                                    	<img class="b_img" src="images/18519074346815324.jpg" />
                                        <a href="dl-toplist2.jsp" class="msk" title="新歌榜"></a>
                                    </div>
                                    <div class="tit">
                                    	<a href="dl-toplist2.jsp" title="新歌榜">
                                        	<h3 class="fs">MyLove新歌榜</h3>
                                        </a>
                                        <div class="btn1">
                                        	<a href='javascript:parent.playSong(2)' title="播放" class="bf"></a>
                                            <a href="#" title="收藏" class="sc"></a>
                                        </div>
                                    </div>
                                </dt>
                                <dd id="newSong">
                                	<ol id="ol">
                                        
                                    </ol>
                                    <div class="more"><a href="dl-toplist2.jsp" class="ckqb">查看全部&gt;</a></div>                                    
                                </dd>
                            </dl>
                            <dl class="blk blk_1">
                            	<dt class="top">
                                	<div class="cover">
                                    	<img class="b_img" src="images/2902710698975677.jpg" />
                                        <a href="dl-toplist3.jsp" class="msk" title="原创歌曲榜"></a>
                                    </div>
                                    <div class="tit">
                                    	<a href="dl-toplist3.jsp" title="原创歌曲榜">
                                        	<h3 class="fs">MyLove原创榜</h3>
                                        </a>
                                        <div class="btn1">
                                        	<a href='javascript:parent.playSong(3)' title="播放" class="bf"></a>
                                            <a href="#" title="收藏" class="sc"></a>
                                        </div>
                                    </div>
                                </dt>
                                <dd id="selfinfo">
                                	<ol id="ol">
                                    
                                    </ol>
                                    <div class="more"><a href="dl-toplist3.jsp" class="ckqb">查看全部&gt;</a></div>                                    
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <%
            	if(userInfo1!=null){
            		if(userInfo1.getPhoto()==null){
                		userInfo1.setPhoto("images/yclogo.png");
                	}
                	if(userInfo1.getUname()==null){
                		userInfo1.setUname(userInfo1.getTel());
                	}
            	}
            %>
            <div class="article_right">
            <%
            		if(userInfo1!=null){
            %>
           <div class="right_top">
            		<div class="f-cb">
                    	<a href="javascript:void(0)" class="hea"><img src="<%=userInfo1.getPhoto() %>" style="width:80px;height:80px;"></a>
                        <div class="in" id="getIntegral">
                        	<h4><a href="javascript:void(0)" class="user"><%=userInfo1.getUname() %></a></h4>
                            <p><a href="javascript:void(0)" class="u-lv">0<i class="rig"></i></a></p>
                            <div class="qd">
                            	<a href="javascript:addIntegral(<%=userInfo1.getUsid() %>)" class="sign" id="qd-a"><i>签到</i></a>
                            </div>
                            <div id="jifen" style="display:none;"><i id="u-jf">你已获得2积分</i>
                            </div>
                        </div>
                    </div>
                    <ul class="dny">
                    	<li class="fst">
                        	<a href="javascript:void(0)">
                            	<strong id="count">0</strong>
                                <span>动态</span>
                            </a>
                        </li>
                        <li>
                        	<a href="follow.jsp">
                            	<strong id="count1"><%=userInfo1.getFollow() %></strong>
                                <span>关注</span>
                            </a>
                        </li>
                        <li class="lst">
                        	<a href="javascript:void(0)">
                            	<strong id="count2">0</strong>
                                <span>粉丝</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <%
            		}else{
                %>
                <div class="right_top">
						<div class="p">
							<p>登录MyLove音乐，可以享受无限收藏的乐趣，并且无限同步到手机</p>
						</div>
						<div class="denglu">
							<a href="javascript:userLogin1()" id="login-1">用户登录</a>
						</div>
				</div>
				<%
            		}
				%>
                <div class="rzgs">
                	<h3 class="rzgs_h3">
                		<span>入驻歌手</span>
                    	<a href="dl-artist.jsp" class="rzgs_a">查看全部 &gt;</a>
                    </h3>
                    <ul class="rzgs_ul" id="Fivesinger">
                    	
                       
                    </ul>
                    <div>
                    	<a href="javascript:void(0)" class="sq"><i>申请成为MyLove Music音乐人</i></a>
                    </div>
                </div>
                <div class="DJ">
                	<h3 class="rzgs_h3">热门DJ</h3>
                    <ul class="ul_dj">
                    	<li>
                        	<a href="" class="a_dj"><img src="images/5994537394864711.jpg" /></a>
                            <div class="div_dj">
                            	<p>
                                	<a href="" class="star">灵伟</a>
                                    <sup class="sup_dj"></sup>
                                </p>
                                <p>电台DJ、资深乐评人</p>
                            </div>
                        </li>
                        <li>
                        	<a href="" class="a_dj"><img src="images/3412884110281507.jpg" /></a>
                            <div class="div_dj">
                            	<p>
                                	<a href="" class="star">庞舸</a>
                                    <sup class="sup_dj"></sup>
                                </p>
                                <p>深圳电台飞扬971主持人</p>
                            </div>
                        </li>
                         <li>
                        	<a href="" class="a_dj"><img src="images/1409573914738725.jpg" /></a>
                            <div class="div_dj">
                            	<p>
                                	<a href="" class="star">林海</a>
                                    <sup class="sup_dj"></sup>
                                </p>
                                <p>著名音乐节目主持人</p>
                            </div>
                        </li>
                        <li>
                        	<a href="" class="a_dj"><img src="images/3368903628058175.jpg" /></a>
                            <div class="div_dj">
                            	<p>
                                	<a href="" class="star">阿鹏叔</a>
                                    <sup class="sup_dj"></sup>
                                </p>
                                <p>桒惪SOUND创办人</p>
                            </div>
                        </li>
                        <li>
                        	<a href="" class="a_dj"><img src="images/3440371884651965.jpg" /></a>
                            <div class="div_dj">
                            	<p>
                                	<a href="" class="star">DJ晓苏</a>
                                    <sup class="sup_dj"></sup>
                                </p>
                                <p>独立DJ，CRI环球旅游广播特邀DJ</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@include file="bottom.jsp" %>
  </div>
	
    <%--   <div class="btmbar" >
       			 <%@include file="page/btmbar.jsp"%> 
       			<!-- <IFRAME ID="Frame1" SRC="page/btmbar.jsp" allowTransparency="true"></IFRAME>	 -->			    
</div>  --%> 
    <a href="" title="回到顶部" id="toTop"></a>
  <%
    	if (userInfo1 == null) {
    %>
     <script src="js/index.js"></script>
     <%
    	}else{
     %>
    <script src="js/dl-index.js"></script>
    <%
    	}
    %> 
    <script type="text/javascript" src="js/addToSheet.js"></script>
    <%@include file="page/addTosheet.jsp"%>
    
   <script src="js/autocomplete.js"></script>
   <script src="js/search.js"></script>
</body>
</html>
