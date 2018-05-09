$(function($){
	var sid=$.trim($("#sid").val());
	var songSStr="";
	$.post("songServlet",{op:"Headsearch",singerId:sid},function(data){
		data= $.parseJSON(data);
		$.each(data.rows,function(index,item){
			if((index & 1) != 0){
				songSStr+=" <tr class='even_2'><td class='td_2'><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
				songSStr+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc_2'>";
				songSStr+="<a href='javascript:parent.addClick(\""+item.sid+"\",\""+item.saddr+"\")' >"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
				songSStr+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href='javascript:addtosheet("+item.sid+")'></a>";
				songSStr+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
				songSStr+="</div></td></tr>";
			}else{
				songSStr+=" <tr class='even_2'id='color_2' style='background-color: #f7f7f7'><td class='td_2'><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
				songSStr+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc_2'>";
				songSStr+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")' >"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
				songSStr+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href='javascript:addtosheet("+item.sid+")'></a>";
				songSStr+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
				songSStr+="</td></tr>";
		
			}
			$("#myTable").append($(songSStr));
			songSStr="";
		});
	},"json");
	var usid=$.trim($("#usid").val());
	var flag=0;
	$.post("userInfoServlet",{op:"findById",usid:usid},function(data){
		var f=new Array();
		if(data!=null){
			if(data.follow!=undefined){
				f=(data.follow).split(",");
			}
		}
		for(var i=0;i<f.length;i++){
			if(f[i]==sid){
				flag=1;
				$("#Follow").attr("src","images/alFollow.png");
				$("#Follow").mouseover(function(){
					$("#Follow").attr("src","images/cancelfollow.png");
				});
				$("#Follow").mouseout(function(){
					$("#Follow").attr("src","images/alFollow.png");
				});
				$("#Follow").parent().attr("href","javascript:cancelFollow("+sid+")");
			}
		}
	},"json");
})
//添加到歌单
var addoToss_sid;
function addtosheet(sid){
	$("#addTo").css("display","block");
	addoToss_sid=sid;
}

//关注
function follow(singerId){
	var usid=$.trim($("#usid").val());
	
	$.post("userInfoServlet",{op:"addFollow",usid:usid,follow:singerId},function(data){
		if(data>0){
			$("#Follow").attr("src","images/alFollow.png");
			$("#Follow").mouseover(function(){
				$("#Follow").attr("src","images/cancelfollow.png");
			});
			$("#Follow").mouseout(function(){
				$("#Follow").attr("src","images/alFollow.png");
			});
			$("#Follow").parent().attr("href","javascript:cancelFollow("+sid+")");
		}
	},"text");
}
//取消关注
function cancelFollow(sid){
	var usid=$.trim($("#usid").val());
	$.post("userInfoServlet",{op:"cancelFollow",usid:usid,sid:sid},function(data){
		if(data>0){
			$("#Follow").attr("src","images/follow.png");
			$("#Follow").mouseover(function(){
				$("#Follow").attr("src","images/follow.png");
			});
			$("#Follow").mouseout(function(){
				$("#Follow").attr("src","images/follow.png");
			});
			$("#Follow").parent().attr("href","javascript:follow("+sid+")");
		}
	},"text");
}