
function isOdd(i){
	if((i & 1) != 0){
		return true; 
	 } else{
		 return false;		
	 }
		
}

var usid;
$(function(){
	findSong();
})

	function findSong(){
	$("#head1>span>a").attr("class","first_a");
	var str="";
	var ssid=$.trim($("#ssid").val()); 
	//alert(ssid);
	$.post("songSheetServlet",{op:"findSongSsname",ssid:ssid},function(data){
		data= $.parseJSON(data);
		//歌单名
		$("#songSheetName").text(data.ssname);
		$("#songSheetPhoto").attr("src",data.photo);
		
		//用户名
		usid=data.usid;
		$.post("userInfoServlet",{op:"findById",usid:data.usid},function(data){
			if(data!=null){
				$("#personname").text(data.uname);
				$("#personphoto").attr("src",data.photo);
			}
		},"json");
		//标签
		if(data.languages!=null&& data.languages!=0 && data.languages!=1){
			$.post("styleInfoServlet",{op:"findById",sid:data.languages},function(data){
				if(data!=null){
					$("#mark").append("<span class='style'>"+data[0].sname+"</span>");
				}
			},"json");
		}
		if(data.scene!=null&& data.scene!=0 && data.scene!=1){
			$.post("styleInfoServlet",{op:"findById",sid:data.scene},function(data){
				if(data!=null){
					$("#mark").append("<span class='style'>"+data[0].sname+"</span>");
				}
			},"json");
		}
		if(data.style!=null&& data.style!=0 && data.style!=1){
			$.post("styleInfoServlet",{op:"findById",sid:data.style},function(data){
				if(data!=null){
					$("#mark").append("<span class='style'>"+data[0].sname+"</span>");
				}
			},"json");
		}
		if(data.emotion!=null&& data.emotion!=0 && data.emotion!=1){
			$.post("styleInfoServlet",{op:"findById",sid:data.emotion},function(data){
				if(data!=null){
					$("#mark").append("<span class='style'>"+data[0].sname+"</span>");
				}
			},"json");
		}
		if(data.theme!=null&& data.theme!=0 && data.theme!=1){
			$.post("styleInfoServlet",{op:"findById",sid:data.theme},function(data){
				//console.info(data);
				if(data!=null){
					$("#mark").append("<span class='style'>"+data[0].sname+"</span>");
				}
			},"json");
		}
		$("#clickRate").text(data.clickRate);
		$("#playAll").attr("href","javascript:parent.playSongSheet(\""+data.ssname+"\")");//播放歌单下的歌曲;
			var ssname = data.ssname;
					$.post("songServlet",{op:"defaultSong",ssname:ssname},function(data){
						  data= $.parseJSON(data);
						$("#totalSong").text(data.length);
						$.each(data,function(index,item){
							if(index<3){
								if(!isOdd(index)){
									str+=" <tr class='even_1'><td><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk'><span class='ico'>3</span></div>";
					                str+="</div></td><td class='rank'><div class='tt'><img src='"+item.photo+"' width='50px' height='50px'/><span class='ply' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc'>";
					                str+="<span class='txt'><a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></span></div></div></td><td class='sc_md'><div class='md2'>";
					                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz'><a class='md_tj' href=''></a><a class='md_sc' href='javascript:addtosheet("+item.sid+")'></a>";
					                str+="<a class='md_fx' href=''></a><a class='md_xz' href=''></a> </div></td><td class='gs_md'>";
					            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
								}else{
									str+=" <tr class='even'><td><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk'><span class='ico'>7</span></div>";
					                str+="</div></td><td class='rank'><div class='tt'><img src='"+item.photo+"' width='50px' height='50px'/><span class='ply' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc'>";
					                str+="<span class='txt'><a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></span></div></div></td><td class='sc_md'><div class='md2'>";
					                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz'><a class='md_tj' href=''></a><a class='md_sc' href='javascript:addtosheet("+item.sid+")'></a>";
					                str+="<a class='md_fx' href=''></a><a class='md_xz' href=''></a> </div></td><td class='gs_md'>";
					            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
								}
							}else if(index<71){
								if(!isOdd(index)){
									str+=" <tr class='even_2'><td class='td_2'><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
					                str+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc_2'>";
					                str+="<a href='javascript:parent.addClick(\""+item.sid+"\",\""+item.saddr+"\")'>"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
					                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href='javascript:addtosheet("+item.sid+")'></a>";
					                str+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
					            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
								}else{
									str+=" <tr class='even_2'id='color_2' style='background-color: #f7f7f7'><td class='td_2'><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
					                str+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc_2'>";
					                str+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
					                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href='javascript:addtosheet("+item.sid+")'></a>";
					                str+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
					            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
								}
						
							}
							
						});
						$("#myTable").append($(str));
					},"json")
	},"json")
	}


//添加到歌单
var addoToss_sid;
function addtosheet(sid){
	$("#addTo").css("display","block");
	addoToss_sid=sid;
}
//收藏歌单
function CollectionSS(ssid){
	var usid=$.trim($("#usid").val());
	$.post("userInfoServlet",{op:"CollectSS",sid:ssid,usid:usid},function(data){
		if(data==1){
			alert("您已收藏该歌单!请勿重复收藏");
		}else if(data==2){
			alert("收藏成功");
		}
		
	},"text");
}

//点击歌单上面的播放
function playSongSheet2(ssname){
	debugger;
	parent.playSongSheet(ssname);
}