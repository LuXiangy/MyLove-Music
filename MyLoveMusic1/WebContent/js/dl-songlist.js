//选择分类
var hiddenBox=document.getElementById("hiddenBox");
var hiddenlink=document.getElementById("hidden-link");
hiddenlink.onclick=function(){
	if(hiddenBox.style.display=="none"){
		hiddenBox.style.display="block";
	}else{
		hiddenBox.style.display="none";
	}
}

//改变page的背景
function change_pg(obj){
	var a=document.getElementById("u-p").getElementsByTagName("a");
	for(var i=0;i<a.length;i++){
		a[i].className="";
	}
	obj.className="selected";
}
function pre(){
	var prev=document.getElementById("u-p").getElementsByClassName("prev");
	var a=document.getElementById("u-p").getElementsByTagName("a");
	for(var i=0;i<a.length;i++){
		if(i>=1){
			a[i-1].className=a[i].className;
			a[i].className="";
		}
	}
}
function next(){
	var a=document.getElementById("u-p").getElementsByTagName("a");
	for(var j=0;j<a.length;j++){
		console.log(j);
		if(j<1){
			a[j+1].className=a[j].className;
			a[j].className="";
		}
	}
}


$(function(){
	$("#nv>#a3>a").attr("class","n_tj");
	$("#head1>span>a").attr("class","first_a");
	//选择分类,是根据语种，风格，场景，情感去分类;
	$.post("styleInfoServlet",{op:"findAll"},function(data){
		var languageStr="";
		var styleStr="";
		var sceneStr="";
		var emotionStr="";
		var themeStr="";
		$.each(data,function(index,item){
			if(item.flag==1){//根据语种进行分类
				languageStr+="<a href=\"javascript:showSongSheetlanguages('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\">|</span>";
			}else if(item.flag==2){//根据风格进行分类
				styleStr+="<a href=\"javascript:showSongSheetstyle('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\">|</span>";
			}else if(item.flag==3){//根据场景进行分类
				sceneStr+="<a href=\"javascript:showSongSheetscene('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\">|</span>";
			}else if(item.flag==4){//根据情感进行分类
				emotionStr+="<a href=\"javascript:showSongSheetemotion('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\">|</span>";
			}else if(item.flag==5){//根据主题进行分类
				themeStr+="<a href=\"javascript:showSongSheettheme('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\">|</span>";

			}
		});
		$("#songSheet_languages").append($(languageStr));
		$("#songSheet_style").append($(styleStr));
		$("#songSheet_scene").append($(sceneStr));
		$("#songSheet_emotion").append($(emotionStr));
		$("#songSheet_theme").append($(themeStr));
	},"json");
	//歌单显示
	var songSheetStr="";
	var RsongSheetStr="";
	var usid = $.trim($("#usid").val());
	var sss = 0;
		$.post("songSheetServlet",{op:"headFind",usid:usid},function(data){
			data= $.parseJSON(data);
			$.each(data.rows,function(index,item){
				if(item.ssname!="默认歌单" &&item.ssname!="我喜欢" &&item.ssname!=undefined){
					songSheetStr+="<li><div class='u-cover'><img src="+item.photo+" /><a href='' class='ul_mya' title='"+item.ssname+"'></a>";
					songSheetStr+="<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+item.clickRate+"万</span></div></div>";
					songSheetStr+="<p class='dec'><a href='javascript:showRSongSheet("+item.ssid+")' class='tit' title='"+item.ssname+"'>"+item.ssname+"</a></p><p class='myp'>";
					songSheetStr+="<span class='s-by'>by</span><a href='#' title='' class='nm-ico' ><span class='name_"+item.usid+"'></span></a>";
					songSheetStr+="<sup class='u-icn'></sup></p></li>";
					$.post("userInfoServlet",{op:"findById",usid:item.usid},function(data){
						if(data != null){
							$(".name_"+data.usid).text(data.uname);
							$(".name_"+data.usid).attr("title",data.uname);
						}
					},"json");
				}
			});
			
			$("#SongSheetShow").append(songSheetStr);
		},"json");
	/*}*/
})

//显示推荐歌单
function showRSongSheet(ssid){
	$.post("songSheetServlet",{op:"sendSsid",ssid:ssid},function(data){
		if(data>0){
			location .href="dl-RsongSheet.jsp";
		}
	},"text");
}

//显示语种类型的类别
function showSongSheetlanguages(languages){
	var usid = $.trim($("#usid").val());
	var songSheetStr="";
	var s=$("#style_"+languages).text();
	$("#nowStyle").text(s);
	$("#SongSheetShow").text("");
	$.post("songSheetServlet",{op:"search",languages:languages,usid:usid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if(item.ssname!="默认歌单" &&item.ssname!="我喜欢" &&item.ssname!="undefined"){
				songSheetStr+="<li><div class='u-cover'><img src="+item.photo+" /><a href='javascript:showRSongSheet("+ item.ssid+ ")' class='ul_mya' title="+ item.ssname + "></a>";
				songSheetStr+="<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+item.clickRate+"万</span></div></div>";
				songSheetStr+="<p class='dec'><a href='javascript:showRSongSheet("+item.ssid+")' class='tit' title='"+item.ssname+"'>"+item.ssname+"</a></p><p class='myp'>";
				songSheetStr+="<span class='s-by'>by</span><a href='#' title='' class='nm-ico' ><span class='name_"+item.usid+"'></span></a>";
				songSheetStr+="<sup class='u-icn'></sup></p></li>";
				$.post("userInfoServlet",{op:"findById",usid:item.usid},function(data){
					if(data != null){
						$(".name_"+data.usid).text(data.uname);
						$(".name_"+data.usid).attr("title",data.uname);
					}
				},"json");
			}
		});
		
		$("#SongSheetShow").append(songSheetStr);
	},"json");
	$("#hiddenBox").css("display","none");
}
//根据风格进行分类
function showSongSheetstyle(style){
	var usid = $.trim($("#usid").val());
	var songSheetStr="";
	var s=$("#style_"+style).text();
	$("#nowStyle").text(s);
	$("#SongSheetShow").text("");
	$.post("songSheetServlet",{op:"search",style:style,usid:usid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if(item.ssname!="默认歌单" &&item.ssname!="我喜欢" &&item.ssname!="undefined"){
				songSheetStr+="<li><div class='u-cover'><img src="+item.photo+" /><a href='' class='ul_mya' title='"+item.ssname+"'></a>";
				songSheetStr+="<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+item.clickRate+"万</span></div></div>";
				songSheetStr+="<p class='dec'><a href='javascript:showRSongSheet("+item.ssid+")' class='tit' title='"+item.ssname+"'>"+item.ssname+"</a></p><p class='myp'>";
				songSheetStr+="<span class='s-by'>by</span><a href='#' title='' class='nm-ico' ><span class='name_"+item.usid+"'></span></a>";
				songSheetStr+="<sup class='u-icn'></sup></p></li>";
				$.post("userInfoServlet",{op:"findById",usid:item.usid},function(data){
					if(data != null){
						$(".name_"+data.usid).text(data.uname);
						$(".name_"+data.usid).attr("title",data.uname);
					}
				},"json");
			}
		});
		
		$("#SongSheetShow").append(songSheetStr);
	},"json");
	$("#hiddenBox").css("display","none");
}
//根据情感进行分类
function showSongSheetemotion(emotion){
	var usid = $.trim($("#usid").val());
	var songSheetStr="";
	var s=$("#style_"+emotion).text();
	$("#nowStyle").text(s);
	$("#SongSheetShow").text("");
	$.post("songSheetServlet",{op:"search",emotion:emotion,usid:usid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if(item.ssname!="默认歌单" &&item.ssname!="我喜欢" &&item.ssname!="undefined"){
				songSheetStr+="<li><div class='u-cover'><img src="+item.photo+" /><a href='' class='ul_mya' title='"+item.ssname+"'></a>";
				songSheetStr+="<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+item.clickRate+"万</span></div></div>";
				songSheetStr+="<p class='dec'><a href='javascript:showRSongSheet("+item.ssid+")' class='tit' title='"+item.ssname+"'>"+item.ssname+"</a></p><p class='myp'>";
				songSheetStr+="<span class='s-by'>by</span><a href='#' title='' class='nm-ico' ><span class='name_"+item.usid+"'></span></a>";
				songSheetStr+="<sup class='u-icn'></sup></p></li>";
				$.post("userInfoServlet",{op:"findById",usid:item.usid},function(data){
					if(data != null){
						$(".name_"+data.usid).text(data.uname);
						$(".name_"+data.usid).attr("title",data.uname);
					}
				},"json");
			}
		});
		
		$("#SongSheetShow").append(songSheetStr);
	},"json");
	$("#hiddenBox").css("display","none");
}
//根据场景进行分类
function showSongSheetscene(scene){
	var usid = $.trim($("#usid").val());
	var songSheetStr="";
	var s=$("#style_"+scene).text();
	$("#nowStyle").text(s);
	$("#SongSheetShow").text("");
	$.post("songSheetServlet",{op:"search",scene:scene,usid:usid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if(item.ssname!="默认歌单" &&item.ssname!="我喜欢" &&item.ssname!="undefined"){
				songSheetStr+="<li><div class='u-cover'><img src="+item.photo+" /><a href='' class='ul_mya' title='"+item.ssname+"'></a>";
				songSheetStr+="<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+item.clickRate+"万</span></div></div>";
				songSheetStr+="<p class='dec'><a href='javascript:showRSongSheet("+item.ssid+")' class='tit' title='"+item.ssname+"'>"+item.ssname+"</a></p><p class='myp'>";
				songSheetStr+="<span class='s-by'>by</span><a href='#' title='' class='nm-ico' ><span class='name_"+item.usid+"'></span></a>";
				songSheetStr+="<sup class='u-icn'></sup></p></li>";
				$.post("userInfoServlet",{op:"findById",usid:item.usid},function(data){
					if(data != null){
						$(".name_"+data.usid).text(data.uname);
						$(".name_"+data.usid).attr("title",data.uname);
					}
				},"json");
			}
		});
		$("#SongSheetShow").append(songSheetStr);
	},"json");
	$("#hiddenBox").css("display","none");
}
//根据主题进行分类
function showSongSheettheme(theme){
	var usid = $.trim($("#usid").val());
	var songSheetStr="";
	var s=$("#style_"+theme).text();
	$("#nowStyle").text(s);
	$("#SongSheetShow").text("");
	$.post("songSheetServlet",{op:"search",theme:theme,usid:usid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if(item.ssname!="默认歌单" &&item.ssname!="我喜欢" &&item.ssname!="undefined"){
				songSheetStr+="<li><div class='u-cover'><img src="+item.photo+" /><a href='' class='ul_mya' title='"+item.ssname+"'></a>";
				songSheetStr+="<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+item.clickRate+"万</span></div></div>";
				songSheetStr+="<p class='dec'><a href='javascript:showRSongSheet("+item.ssid+")' class='tit' title='"+item.ssname+"'>"+item.ssname+"</a></p><p class='myp'>";
				songSheetStr+="<span class='s-by'>by</span><a href='#' title='' class='nm-ico' ><span class='name_"+item.usid+"'></span></a>";
				songSheetStr+="<sup class='u-icn'></sup></p></li>";
				$.post("userInfoServlet",{op:"findById",usid:item.usid},function(data){
					if(data != null){
						$(".name_"+data.usid).text(data.uname);
						$(".name_"+data.usid).attr("title",data.uname);
					}
				},"json");
			}
		});
		
		$("#SongSheetShow").append(songSheetStr);
	},"json");
	$("#hiddenBox").css("display","none");
}
//选择全部风格
function showAllSongSheet(){
	var usid = $.trim($("#usid").val());
	$("#nowStyle").text("全部");
	$("#SongSheetShow").text("");
	//歌单显示
	var songSheetStr="";
	$.post("songSheetServlet",{op:"headFind",usid:usid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if(item.ssname!="默认歌单" &&item.ssname!="我喜欢" &&item.ssname!="undefined"){
				songSheetStr+="<li><div class='u-cover'><img src="+item.photo+" /><a href='' class='ul_mya' title='"+item.ssname+"'></a>";
				songSheetStr+="<div class='bottom'><a href='javascript:parent.playSongSheet(\""+item.ssname+"\")' class='play'></a><span class='icon_play'></span><span class='num'>"+item.clickRate+"万</span></div></div>";
				songSheetStr+="<p class='dec'><a href='javascript:showRSongSheet("+item.ssid+")' class='tit' title='"+item.ssname+"'>"+item.ssname+"</a></p><p class='myp'>";
				songSheetStr+="<span class='s-by'>by</span><a href='#' title='' class='nm-ico' ><span class='name_"+item.usid+"'></span></a>";
				songSheetStr+="<sup class='u-icn'></sup></p></li>";
				$.post("userInfoServlet",{op:"findById",usid:item.usid},function(data){
					if(data != null){
						$(".name_"+data.usid).text(data.uname);
						$(".name_"+data.usid).attr("title",data.uname);
					}
				},"json");
			}
		});
		
		$("#SongSheetShow").append(songSheetStr);
	},"json");
	$("#hiddenBox").css("display","none");
}

		