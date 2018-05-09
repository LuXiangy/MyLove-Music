<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>云音乐飙升版 - 排行榜 - 网易云音乐</title>
<link rel="icon" href="images/music.ico"/>
<link rel="stylesheet" href="css/toplist.css"/>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script>

function isOdd(i){
	if((i & 1) != 0){
		return true; 
	 } else{
		 return false;		
	 }
		
}

$(function(){
	$("#nv>#a2>a").attr("class","n_tj");
	$("#head1>span>a").attr("class","first_a");
	var str="";
	$.post("songServlet",{op:"findAll"},function(data){
		  data= $.parseJSON(data);
		  $("#totalSong").text(data.length);
		$.each(data,function(index,item){
			if(index<3){
				if(!isOdd(index)){
					str+=" <tr class='even_1'><td><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk'><span class='ico'>3</span></div>";
	                str+="</div></td><td class='rank'><div class='tt'><img src='"+item.photo+"' width='50px' height='50px'/><span class='ply' onclick='addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc'>";
	                str+="<span class='txt'><a href='javascript:addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></span></div></div></td><td class='sc_md'><div class='md2'>";
	                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz'><a class='md_tj' href=''></a><a class='md_sc' href=''></a>";
	                str+="<a class='md_fx' href=''></a><a class='md_xz' href=''></a> </div></td><td class='gs_md'>";
	            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
				}else{
					str+=" <tr class='even'><td><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk'><span class='ico'>7</span></div>";
	                str+="</div></td><td class='rank'><div class='tt'><img src='"+item.photo+"' width='50px' height='50px'/><span class='ply' onclick='addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc'>";
	                str+="<span class='txt'><a href='javascript:addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></span></div></div></td><td class='sc_md'><div class='md2'>";
	                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz'><a class='md_tj' href=''></a><a class='md_sc' href=''></a>";
	                str+="<a class='md_fx' href=''></a><a class='md_xz' href=''></a> </div></td><td class='gs_md'>";
	            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
				}
			}else if(index<71){
				if(!isOdd(index)){
					str+=" <tr class='even_2'><td class='td_2'><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
	                str+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc_2'>";
	                str+="<a href='javascript:addClick(\""+item.sid+"\",\""+item.saddr+"\")'>"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
	                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href=''></a>";
	                str+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
	            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
				}else{
					str+=" <tr class='even_2'id='color_2' style='background-color: #f7f7f7'><td class='td_2'><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
	                str+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc_2'>";
	                str+="<a href='javascript:addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
	                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href=''></a>";
	                str+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
	            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
			
				}
		
			}
			
		});
		$("#myTable").append($(str));
		
	},"json")		
})
function addClick(sid,addr){
	var str="";
	$("#audio").attr("src",addr).attr("autoplay",true);
	$.post("songServlet",{op:"findSong",sid:sid},function(data){
		data= $.parseJSON(data);
		$.each(data,function(index,item){
			$("#na").attr("title",item.sname).html("").html(item.sname);
			$("#st").html(item.singerName);
			$("#singerName").attr("title",item.singerName);
			$("#longs").html(item.longs);
		});
	},"json")
	
	
	$.post("songServlet",{op:"addClick",sid:sid},function(data){
		
	},"text");
}
</script>
</head>

<body>
<div class="body1">

	<%@include file="page/login.jsp" %>
		
	
   

    <div class="content_left">
   		<div class="top">
       		<h2>云音乐特色榜</h2> 
            <ul class="top_1">
           		<li class="left_2">
               		<div class="div1"></div> 
                        <p class="p1">
                            <a href="toplist.jsp">云音乐飙升榜</a> 
                        </p>
                    <p class="p2">每天更新</p>
                </li>
                <li class="left_1">
               		 <div class="div2"></div> 
                        <p class="p1">
                            <a href="toplist2.jsp">云音新歌榜</a> 
                        </p>
                     <p class="p2">每天更新</p>
                </li>
                <li class="left_3">
                	 <div class="div3"></div> 
                        <p class="p1">
                            <a href="toplist3.jsp">网易原创歌曲榜</a> 
                        </p>
                     <p class="p2">每周四更新</p>
                </li>
                <li class="left_4">
               		 <div class="div4"></div> 
                        <p class="p1">
                            <a href="javascript:void()">云音乐热歌榜</a> 
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
                            <a href="javascript:void()">云音乐ACG	音乐榜</a> 
                        </p>
                    <p class="p2">每周四更新</p>
                </li> 
                <li class="left_6">
               		<div class="div6"></div> 
                        <p class="p1">
                            <a href="javascript:void()">云音乐古典音乐榜</a> 
                        </p>
                    <p class="p2">每周四更新</p>
                </li>
                <li class="left_7">
               		<div class="div7"></div> 
                        <p class="p1">
                            <a href="javascript:void()">云音乐电音榜</a> 
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
           			<img src="images/18519074346815324.jpg" width="150px" height="150px"/> 
                    <span id="msk"></span>
                </div>
                <div class="m-info">
               		<div class="f-cb">
                   		 <h2 class="f-ff2">云音乐新歌榜</h2>
                    </div> 
                    <div class="user">
                   		<i class="u-icn"></i>
                        <span class="sep">最近更新：10月01日</span>
                        <span class="s-fc4">（每天更新）</span>
                    </div>
                    <div class="btns">
                   		<a class="play" href="">
                       		<span>播放</span> 
                            <a class="tj" href=""></a>
                        </a>
                        <a class="ysc">
                       		<span>(192020)</span> 
                        </a>
                        <a class="fx">
                       		<span>(864)</span> 
                        </a>
                        <a class="down">
                       		<span>下载</span> 
                        </a>
                        <a class="talk">
                       		<span>(39149)</span> 
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
                <span class="sub">
               		<span id="totalSong"></span>
                    首歌 
                </span>
                <div class="more">
                播放
               		<strong class="play-count">124721080</strong>
                     次
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
                <span class="sub">
               		
                    共39361条评论 
                </span>
                
            </div>
        </div>
        <div class="pinglun">
       		<div class="head">
            	<img src="images/default_avatar.jpg"/>
            </div> 
            <div class="pl_sjx">
           		<img src="images/pl_sjx.png"/> 
            </div>
            <div class="m-cmmtipt">
           		<textarea  class="area" placeholder="评论" style="width:585px "></textarea> 
            </div>
            <div class="f-cb">
           		<i class="u-icn-36"></i> 
                <i class="u-icn-41"></i> 
                <a href="" class="u-btn-1">评论</a>
                <span class="zs">140</span>
            </div>
        </div>
        <div class="cmmts">
        	<h3 class="u-hd4">精彩评论</h3>
            <div class="itm">
           		<div class="head">
               		<img src="images/3426078262784660.jpg"/> 
                </div> 
                <div class="f-brk">
               		<a class="s-fc7" href="/user/home?id=314718325">谦虚的小喵酱</a>
：终于补了不能说的秘密，没有现在青春片的车祸，留学，堕胎，奢华。小清新，剧情也不落俗套。最重要的的是配乐太好听了！！！ 
                </div>
                <div class="rp">
               		<div class="time">04:00</div>
                    <a>
                    	<i class="zan"></i><div class="span_1">(60)&nbsp|&nbsp;回复</div>
                    </a>
                </div>
            </div>
           <div class="itm_1">
           		<div class="head">
               		<img src="images/3252355415516075.jpg"/> 
                </div> 
                <div class="f-brk">
               		<a class="s-fc7" href="/user/home?id=314718325">00后杰迷喜欢无敌歌曲告白气球</a>
					：杰伦的告白气球飙到有点凶啊 
                </div>
                <div class="rp">
               		<div class="time">08:41</div>
                    <a>
                    	<i class="zan"></i><div class="span_1">(80)&nbsp|&nbsp;回复</div>
                    </a>
                </div>
            </div>
            <div class="itm_1">
           		<div class="head">
               		<img src="images/1413971969195462.jpg"/> 
                </div> 
                <div class="f-brk">
               		<a class="s-fc7" href="/user/home?id=314718325">小-_-柒</a>
					：我只是来数数告白气球有几个的，居然又是三个。🍃 
                </div>
                <div class="rp">
               		<div class="time">07:31</div>
                    <a>
                    	<i class="zan"></i><div class="span_1">(26)&nbsp|&nbsp;回复</div>
                    </a>
                </div>
            </div>
            <div class="itm_1">
           		<div class="head">
               		<img src="images/3432675303837294.jpg"/> 
                </div> 
                <div class="f-brk">
               		<a class="s-fc7" href="/user/home?id=314718325">因为周杰伦注册的</a>
					：告白气球又飙车 
                </div>
                <div class="rp">
               		<div class="time">09:11</div>
                    <a>
                    	<i class="zan"></i><div class="span_1">(99)&nbsp|&nbsp;回复</div>
                    </a>
                </div>
            </div>
            <h3 class="u-hd4">最新评论(85998)</h3>
            <div class="itm_1">
           		<div class="head">
               		<img src="images/3252355415799560.jpg"/> 
                </div> 
                <div class="f-brk">
               		<a class="s-fc7" href="/user/home?id=314718325">嘟哈砰咔</a>
					：年底秘密，百老汇音乐剧<img src="images/emoji_360.png"/> 
                </div>
                <div class="rp">
               		<div class="time">01:11</div>
                    <a>
                    	<i class="zan"></i><div class="span_1">(19)&nbsp|&nbsp;回复</div>
                    </a>
                </div>
            </div>
             <div class="itm_1">
           		<div class="head">
               		<img src="images/3306231465146445.jpg"/> 
                </div> 
                <div class="f-brk">
               		<a class="s-fc7" href="/user/home?id=314718325">最最爱的杰伦</a>
					：这个可以<img src="images/emoji_357.png"/> 
                </div>
                <div class="rp">
               		<div class="time">05:11</div>
                    <a>
                    	<i class="zan"></i><div class="span_1">(55)&nbsp|&nbsp;回复</div>
                    </a>
                </div>
            </div>
            <div class="u-page">
           		<div class="u-page_1">
                	<a class="zprv" href="">上一页</a>
                    <a class="zpg1" href="">1</a>
                    <a class="zpg2">2</a>
                    <a class="zpg2">3</a>
                    <a class="zpg2">4</a>
                    <a class="zpg2">5</a>
                    <a class="zpg2">6</a>
                    <a class="zpg2">7</a>
                    <a class="zpg2">8</a>
                    <span class="zdot">...</span>
                    <a class="zpg2">1968</a>
                    <a class="zprv_1" href="">下一页</a>
                </div> 
            </div>
            
        </div>
        </div> 	
    </div>
    
    <div class="footer">
   		<div class="footer1">
            <a href="" class="left"><span class="span1">独立音乐人招募</span></br><span class="span2">加入我们 即将与超过亿万乐迷互动</span></a>
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
        </div>
   <div class="btmbar" >
       			<%@include file="page/btmbar.jsp"%>
                
        </div>     
    
    <a id="toTop" title="回到顶部" href="" hidefocus="true"  style="display:none;">回到顶部</a>
    
  
    
   
    <script src="js/toplist.js"></script>
    
</body>
</html>
