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
})
var songSheet = $("#f-ff2").text(); 
//播放歌单下的歌曲
function playSong1(){
	if(songSheet == "MyLove音乐飙升榜"){
		$.post("songServlet",{op:"findByClick"},function(data){
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				if(index == 0){
					parent.addClick(item.sid,item.saddr);
				}
			});
		},"json");
	}else if(songSheet == "MyLove音乐新歌榜"){
		$.post("songServlet",{op:"findAll"},function(data){
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				if(index == 0){
					parent.addClick(item.sid,item.saddr);
				}
			});
		},"json");
	}else if(songSheet == "MyLove音乐原创榜"){
		$.post("songServlet",{op:"findByself"},function(data){
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				if(index == 0){
					parent.addClick(item.sid,item.saddr);
				}
			});
		},"json");
	}
}