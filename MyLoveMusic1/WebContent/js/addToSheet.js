$(function($){
	findSongsheet();
	
})

	function findSongsheet(){
		var usid=$.trim($("#usid").val());
		$.post("songSheetServlet", {op : "findMy",usid : usid}, function(data) {
			 data= $.parseJSON(data);
			 var str="";
			 var arr=new Array();
			$.each(data,function(index,item){
				if(item.song!=undefined){
					var song=item.song;
					arr=song.split(',');
				}else{
					arr.length=1;
				}
					str+="	<li class='li1'><div class='hd' id="+item.ssid+">";
					str+="<div class='left'><a href='javascript:ToSongSheet(\""+item.ssname+"\",\""+item.photo+"\",\""+item.ssid+"\")'><img src="+item.photo+" width='40px' height='40px' /></a></div>";
					str+="<p class='nam'><a href='javascript:ToSongSheet(\""+item.ssname+"\",\""+item.photo+"\",\""+item.ssid+"\")'>"+item.ssname+"</a></p>";
					str+="<p class='num'><span id='total_"+item.ssid+"'>"+item.song+"</span>首</p></div></li> "; 
					totalSong(item.ssname,item.ssid,usid);//计算出该歌单下有多少首歌曲;
			});
			$("#ALLsongSheet").append($(str));
		}, "json");
	}

