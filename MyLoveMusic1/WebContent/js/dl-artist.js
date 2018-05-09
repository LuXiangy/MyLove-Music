var oldObj;
$(function(){
	$("#nv>#a5>a").attr("class","n_tj");
	$("#head1>span>a").attr("class","first_a");
	oldObj=$("#recomend");
	var firstSinger="";
	var allSingerStr="";
	$.post("singerServlet",{op:"findAll"},function(data){
		data= $.parseJSON(data);
		$.each(data,function(index,item){
			if(index<1){
				firstSinger+="<li><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				firstSinger+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				firstSinger+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 
			}else if(index<5){
				firstSinger+="<li class='li_2'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				firstSinger+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				firstSinger+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}else if(index<6){
				firstSinger+="<li class='li_3'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				firstSinger+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				firstSinger+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}else if(index<10){
				firstSinger+="<li class='li_4'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				firstSinger+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				firstSinger+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}
			
			allSingerStr+="<li class='sm1'><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
			allSingerStr+="<a class='icn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'></a> </li>";
		})
		$("#firstsingerli").append($(firstSinger));
		$("#allSinger").append($(allSingerStr));
	},"json");
	//热门歌手
	var hotSingerStr="";
	$.post("singerServlet",{op:"findByclick"},function(data){
		data= $.parseJSON(data);
		$.each(data,function(index,item){
			if(index<1){
				hotSingerStr+="<li><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				hotSingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				hotSingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 
			}else if(index<5){
				hotSingerStr+="<li class='li_2'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				hotSingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				hotSingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}else if(index<6){
				hotSingerStr+="<li class='li_3'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				hotSingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				hotSingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}else if(index<10){
				hotSingerStr+="<li class='li_4'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				hotSingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				hotSingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}
			
		})
		$("#hotSinger").append($(hotSingerStr));
		
	},"json");
})
function addSingerClick(sid){
	
	$.post("singerServlet",{op:"addClick",sid:sid},function(data){
		
	},"text");
	$.post("singerServlet",{op:"seeHome",sid:sid},function(data){
		if(data>0){
			location.href="dl-singerPerson.jsp"
		}
	},"text");
}

function findSinger(stid,obj){
	$("#hotSingerHead").css("display","none");
	$("#hotSingerDiv").css("display","none");
	var SingerStr="";
	var allSingerStr="";
	$(".g-wrap1").css("height","420px");
	$("#firstsingerli").text("");
	$("#allSinger").text("");
	$.post("singerServlet",{op:"HeadSearch",stid:stid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if(index<1){
				SingerStr+="<li><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				SingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				SingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 
			}else if(index<5){
				SingerStr+="<li class='li_2'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				SingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				SingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}else if(index<6){
				SingerStr+="<li class='li_3'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				SingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				SingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}else if(index<10){
				SingerStr+="<li class='li_4'><div class='u-cover'><img src='"+item.photo+"' width='130px' height='130px'><span id='msk'></span>";
				SingerStr+="<a class='msk' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'></a></div><p><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
				SingerStr+="<a class='f-tdn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'><i class='u-icn'></i></a></p></li>"; 

			}
			allSingerStr+="<li class='sm1'><a class='nm' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的音乐'>"+item.sname+"</a>";
			allSingerStr+="<a class='icn' href='javascript:addSingerClick("+item.sid+")' title='"+item.sname+"的个人主页'></a> </li>";
		})
		$("#firstsingerli").append(SingerStr);
		$("#allSinger").append($(allSingerStr));
	},"json");
}
function changeClass(obj){
	if(oldObj!=obj){
		$(oldObj).attr("class","cat-flag");
		
		$(obj).attr("class","z-slt");
		oldObj=obj;
		$("#Styletitle").text($(obj).text());
	}
}
function change_hd(obj){
	var h=document.getElementById("head").getElementsByTagName("a");
	for(var i=0;i<h.length;i++){
		h[i].className="";
	}
	obj.className="first_a";
}