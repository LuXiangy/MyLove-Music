function isOdd(i){
	if((i & 1) != 0){
		return true; 
	 } else{
		 return false;		
	 }
		
}
var beforePhoto;
var languages;
var style;
var scene;
var emotion;
var theme;
var ssid=0;
var songSStr="";
	$(function() {
		findMySongSheet()
	});
	var SongSheetStr = "";
	function findMySongSheet(){
		$("#head2>span>a").attr("class", "first_a");
		var usid = $.trim($("#usid").val());
		$.post("songSheetServlet", {op : "findMy",usid : usid}, function(data) {//用户所创建的歌单
			 data= $.parseJSON(data);
			 var arr=new Array();
			  $("#totalsize").text(data.length);//已创建的歌单有多少首
			$.each(data,function(index,item){
				if(item.song!=undefined){
					arr=item.song.split(',');
				}else{
					arr.length=1;
				}
				if(item.ssname=="默认歌单"){
					$("#songsheetName").text(item.ssname);
					$("#songsheetPhoto").attr("src",item.photo);
					$("#clickRate").text(item.clickRate);
					//$("#playAll").attr("href","javascript:playAll("+item.ssid+")");//播放该歌单下的第一首歌曲。
				}
				SongSheetStr = " <ul class='l-2' id='ul_"+item.ssid+"' style='height:40px'><li class='li1' >";
				SongSheetStr+=" <div class='gd' id='"+item.ssid+"'>";
				SongSheetStr+=" <div class='left'><a href='javascript:show(\""+item.ssname+"\",\""+item.photo+"\",\""+item.clickRate+"\",\""+item.ssid+"\")'><img src='"+item.photo+"' width='40px' height='40px' class='gdphoto' /></a></div>";
				SongSheetStr+=" <p class='nam'><a href='javascript:show(\""+item.ssname+"\",\""+item.photo+"\",\""+item.clickRate+"\",\""+item.ssid+"\")'>"+item.ssname+"</a></p>";
				SongSheetStr+=" <p class='num'><span id='total_"+item.ssid+"'>"+item.song+"</span>首</p>";
				SongSheetStr+="</div> </li></ul>";
				$("#mySongSheethhh").append(SongSheetStr);
				//totalSong1(item.ssname,item.ssid,usid);//计算出该歌单下有多少首歌曲;
			})
					
		}, "json");
		
		var str="";
		var usid = $.trim($("#usid").val());
		$.post("songServlet",{op:"defaultSongSheet",usid:usid},function(data){
			 data= $.parseJSON(data);
			$("#totalSong").text(data.length);
			 //alert(data.length);
			$.each(data,function(index,item){
						str+=" <tr class='even_1'><td><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk'><span class='ico'>3</span></div>";
		                str+="</div></td><td class='rank'><div class='tt'><img src='"+item.photo+"' width='50px' height='50px'/><span class='ply' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc'>";
		                str+="<span class='txt'><a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></span></div></div></td><td class='sc_md'><div class='md2'>";
		                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz'><a class='md_tj' href=''></a><a class='md_sc' href='javascript:addtosheet("+item.sid+")'></a>";
		                str+="<a class='md_fx' href=''></a><a class='md_xz' href=''></a> </div></td><td class='gs_md'>";
		            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
			});
			$("#myTable").append(str);
		},"json")
		$("#myCollectSongSheet").css("display","none");
	}
	/*function totalSong1(ssname,ssid,usid){
		$.post("songSheetServlet", {op:"songSheetSong",ssname:ssname,usid:usid},function(data) {
			//data= $.parseJSON(data);
			$("#total_"+ssid).html(data);
		},"json");
	}*/
	function AddSongSheetClick(ssid,usid){
		$.post("songSheetServlet",{op:"addClick",ssid:ssid,usid:usid},function(data){
		})
	}
	
	
	$(function(){
		
		$(".gd").bind('contextmenu',function(e){
		
			e.preventDefault();
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
			ssid=$(this).attr("id");
		})
			$.post("styleInfoServlet",{op:"findAll"},function(data){
				var languageStr="";
				var styleStr="";
				var sceneStr="";
				var emotionStr="";
				var themeStr="";
				var languagenumber=0;
				var stylenumber=0;
				var scenenumber=0;
				var emotionnumber=0;
				var themenumber=0;
				$.each(data,function(index,item){
					if(item.flag==1){
						
						languageStr+="<a href=\"javascript:addlanguages('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\" id='span_"+item.sid+"'>|</span>";
						languagenumber=languagenumber+1;
						if(languagenumber%5==0){
							languageStr+="<br/>";
						}
					}else if(item.flag==2){
						styleStr+="<a href=\"javascript:addstyle('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\" id='span_"+item.sid+"'>|</span>";
						stylenumber=stylenumber+1;
						if(stylenumber%5==0){
							styleStr+="<br/>";
						}
					}else if(item.flag==3){
						sceneStr+="<a href=\"javascript:addscene('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\" id='span_"+item.sid+"'>|</span>";
						scenenumber=scenenumber+1;
						if(scenenumber%5==0){
							sceneStr+="<br/>";
						}
					}else if(item.flag==4){
						emotionStr+="<a href=\"javascript:addemotion('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\" id='span_"+item.sid+"'>|</span>";
						emotionnumber=emotionnumber+1;
						if(emotionnumber%5==0){
							emotionStr+="<br/>";
						}
					}else if(item.flag==5){
						themeStr+="<a href=\"javascript:addtheme('"+item.sid+"')\" class=\"s-fc1\" id='style_"+item.sid+"'>"+item.sname+"</a><span class=\"line\" id='span_"+item.sid+"'>|</span>";
						themenumber=themenumber+1;
						if(themenumber%5==0){
							themeStr+="<br/>";
						}
					}
					
				});
				$("#songSheet_languages").append($(languageStr));
				$("#songSheet_style").append($(styleStr));
				$("#songSheet_scene").append($(sceneStr));
				$("#songSheet_emotion").append($(emotionStr));
				$("#songSheet_theme").append($(themeStr));
			},"json");
	});
 var oldLanguages;
 var oldStyle;
 var oldScene;
 var oldEmotion;
 var oldTheme;
	function addlanguages(sid){
		
		if(sid!=oldLanguages){
			$("#style_"+oldLanguages).css("color","black");
		}
		if($("#style_"+sid).css("color")!="rgb(0, 0, 255)"){
			$("#style_"+sid).css("color","blue");
			languages=sid;
		}else{
			$("#style_"+sid).css("color","black");
			languages="";
		}
		oldLanguages=sid;
		
	}
	function addstyle(sid){
		if(sid!=oldStyle){
			$("#style_"+oldStyle).css("color","black");
		}
		if($("#style_"+sid).css("color")!="rgb(0, 0, 255)"){
			$("#style_"+sid).css("color","blue");
			style=sid;
		}else{
			$("#style_"+sid).css("color","black");
			style="";
		}
		oldStyle=sid;
	}
	function addemotion(sid){
		if(sid!=oldEmotion){
			$("#style_"+oldEmotion).css("color","black");
		}
		if($("#style_"+sid).css("color")!="rgb(0, 0, 255)"){
			$("#style_"+sid).css("color","blue");
			emotion=sid;
		}else{
			$("#style_"+sid).css("color","black");
			emotion="";
		}
		oldEmotion=sid;
	}
	function addscene(sid){
		if(sid!=oldScene){
			$("#style_"+oldScene).css("color","black");
		}
		if($("#style_"+sid).css("color")!="rgb(0, 0, 255)"){
			$("#style_"+sid).css("color","blue");
			scene=sid;
		}else{
			$("#style_"+sid).css("color","black");
			scene="";
		}
		oldScene=sid;
		
	}
	function addtheme(sid){
		if(sid!=oldTheme){
			$("#style_"+oldTheme).css("color","black");
		}
		if($("#style_"+sid).css("color")!="rgb(0, 0, 255)"){
			$("#style_"+sid).css("color","blue");
			theme=sid;
		}else{
			$("#style_"+sid).css("color","black");
			theme="";
		}
		oldTheme=sid;
	}
	function addSongSheet(usid) {
		var ssname = $.trim($("#songSheetName").val());
		$.post("songSheetServlet",{op:"addsongSheet",usid:usid,ssname:ssname}, function(data) {
			if (data > 0) {
				alert("添加成功");
				$.post("songSheetServlet", {op : "findMy",usid : usid}, function(data) {
						
				}, "json");
				location.href="dl-music.jsp";
			} else {
				alert("添加失败");
			}
		}, "text");
	}
	/*function showAdd() {
		$('#dlg').css("display", "block");
	}*/
	function selectFile(){  
	    //触发 文件选择的click事件  
	    $("#singer_update_photo").trigger("click");  
	    beforePhoto="";
	}
	function changeInfo(ssid){
		$.post("songSheetServlet",{op:"findSongSheet",ssid:ssid},function(data){
			$("#showSSheet").css("display","none");
			console.info(data);
			$("#ssname").val(data.ssname);
			$("#beforeStr").val(data.photo);
			
			$("#mask").text("");
			$("#mysPhoto").attr("src",data.photo);
			$("#mask").append($("#style_"+data.languages));
			$("#mask").append($("#span_"+data.languages));
			languages=data.languages;
			$("#mask").append($("#style_"+data.scene));
			$("#mask").append($("#span_"+data.scene));
			scene=data.scene;
			$("#mask").append($("#style_"+data.style));
			$("#mask").append($("#span_"+data.style));
			style=data.style;
			$("#mask").append($("#style_"+data.emotion));
			$("#mask").append($("#span_"+data.emotion));
			emotion=data.emotion;
			$("#mask").append($("#style_"+data.theme));
			$("#mask").append($("#span_"+data.theme));
			theme=data.theme;
			$("save").attr("href","javascript:changeSongSheet("+data.ssid+")");
			$("#changeInfo").css("display","block");
		},"json");
		
	}
	function menuHandler(item){
		if(item.name=="change"){
			changeInfo(ssid);
		}
		if(item.name=="delete"){

			var usid = $.trim($("#usid").val());
			$.post("songSheetServlet",{op:"delsongSheet",usid:usid,ssid:ssid},function(data){
				if(data>0){
					alert("删除成功");
					window.location.reload();
				}else{
					alert("删除失败");
				}
			})
		}
	}

	function changeSongSheet(){
		var ssname=$.trim($("#ssname").val());
		beforePhoto=$.trim($("#beforeStr").val());
		$.ajaxFileUpload({
			url:"songSheetServlet?op=updatesongSheet",
			secureuri:false,
			fileElementId:"singer_update_photo",
			dataType:"text",
			data:{ssid:ssid,ssname:ssname,languagess:beforePhoto,languages:languages,style:style,emotion:emotion,theme:theme,scene:scene},
			success:function(data,status){
				data=parseInt($.trim(data));
				if(data>0){
					alert("修改成功");	
					window.location.reload();
				}else{
					alert("修改失败");
				}
				
			}
		});
	}
	
	function showBox(){
		$("#hiddenBox").css("display","block");
	}
	
	function addStyle(){
		if(languages!=""){
			$("#mask").append($("#style_"+languages));
		}
		if(style!=""){
			$("#mask").append($("#style_"+style));
		}
		if(emotion!=""){
			$("#mask").append($("#style_"+emotion));
		}
		if(scene!=""){
			$("#mask").append($("#style_"+scene));
		}
		if(theme!=""){
			$("#mask").append($("#style_"+theme));
		}
		$("#hiddenBox").css("display","none");
	}
	function person(){
		location.href="person.jsp";
	}
	var oldSongSheet;
	var arr=new Array();
/*	function ShowSongSheet(ssid){
		if(oldSongSheet!=$(this)){
			$(oldSongSheet).css("background","#F9F9F9");
			$.post("songSheetServlet",{op:"findSongSheet",ssid:ssid},function(data){
				$("#changeInfo").css("display","none");
				$("#songsheetName").text(data.ssname);
				$("#songsheetPhoto").attr("src",data.photo);
				$("#ul_"+ssid).css("background","#E6E6E6");
				$("#showSSheet").css("display","block");
				var length=$("#total_"+ssid).text();
				//$("#totalSong").text(length);
				$("#myTable .even_2").remove();
				$("#clickRate").text(data.clickRate);
				//标签
				$("#mark").remove();
				$("#playAll").attr("href","javascript:playAll("+data.ssid+")");
				usid=data.usid;
				$.post("userInfoServlet",{op:"findById",usid:data.usid},function(data){
					$("#personname").text(data.uname);
					$("#personphoto").attr("src",data.photo);
				},"json");
				
			if(data.ssname!="默认歌单"){
				$("#headerMark").append("<div id='mark' class='btns'>标签：</div>");
			
				if(data.languages!=null&& data.languages!=0 && data.languages!=1){
					$("#mark").append("<label class='style'>"+$("#style_"+data.languages).text()+'</label>');
				}
				if(data.scene!=null&& data.scene!=0 && data.scene!=1){
				$("#mark").append("<label class='style'>"+$("#style_"+data.scene).text()+'</label>');
				}
				if(data.style!=null&& data.style!=0 && data.style!=1){
				$("#mark").append("<label class='style'>"+$("#style_"+data.style).text()+'</label>');
				}
				if(data.emotion!=null&& data.emotion!=0 && data.emotion!=1){
				$("#mark").append("<label class='style'>"+$("#style_"+data.emotion).text()+'</label>');
				}
				if(data.theme!=null&& data.theme!=0 && data.theme!=1){
				$("#mark").append("<label class='style'>"+$("#style_"+data.theme).text()+'</label>');
				}
			}else{
				$("#mark").remove();
			}
			if(data.song!=undefined){
				var song=data.song;
				arr=song.split(',');
			}else{
				arr.length=1;
				
			}
			oldSongSheet=$("#ul_"+ssid);
			for(var i=0;i<arr.length-1;i++){
				var songid=arr[i];
				var s=0;
				$.post("songServlet",{op:"findSong",sid:songid},function(data){
					data= $.parseJSON(data);
					$.each(data,function(index,item){
						var usid = $.trim($("#usid").val());
						if((s & 1) != 0){
							songSStr+=" <tr class='even_2'><td class='td_2'><div class='hd'><span class='num'>"+(s+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
							songSStr+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\","+ssid+")' id='"+ssid+"_"+(s+1)+"'></span><div class='ttc_2'>";
							songSStr+="<a href='javascript:parent.addClick(\""+item.sid+"\",\""+item.saddr+"\","+ssid+")' >"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
							songSStr+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href='javascript:addtosheet("+item.sid+")'></a>";
							songSStr+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
							songSStr+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
							s=s+1;
						}else{
							songSStr+=" <tr class='even_2'id='color_2' style='background-color: #f7f7f7'><td class='td_2'><div class='hd'><span class='num'>"+(s+1)+"</span><div class='rk_2'><span class='ico_2'></span></div>";
							songSStr+="</div></td><td class='td_2'><div class='tt_2'><span class='ply_2' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\","+ssid+")' id='"+ssid+"_"+(s+1)+"'></span><div class='ttc_2'>";
							songSStr+="<a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\","+ssid+")' >"+item.sname+"</a></div></div></td><td class='td_2_2'><div class='md2'>";
							songSStr+="<span class='time'>"+item.longs+"</span></div><div class='lqbz_2'><a class='md_t' href=''></a><a class='md_s' href='javascript:addtosheet("+item.sid+")'></a>";
							songSStr+="<a class='md_f' href=''></a><a class='md_x' href=''></a> </div></td><td class='td_2'>";
							songSStr+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
							s=s+1;
						}
						$("#myTable").append($(songSStr));
						songSStr="";
						
					});

					
				},"json");
			}
		},"json");
			
			
		}
	}*/
	
	//添加到歌单
	var addoToss_sid;
	function addtosheet(sid){
		$("#addTo").css("display","block");
		addoToss_sid=sid;
	}
	//隐藏我的歌单
	function showMy(){
		if($("#mySongSheethhh").css("display")=="block"){
			$("#mySongSheethhh").css("display","none");
		}else{
			$("#mySongSheethhh").css("display","block");
		}
	}
	//我收藏的歌单
	function showCollect(){
		if($("#myCollectSongSheet").css("display")=="block"){
			$("#myCollectSongSheet").css("display","none");
		}else{
			$("#myCollectSongSheet").css("display","block");
		}
	}
	//删除收藏的歌单
	function deletess(ssid){
		var usid=$.trim($("#usid").val());
		$.post("userInfoServlet",{op:"deletecollect",ssid:ssid,usid:usid},function(data){
			if(data>0){
				alert("删除成功");
				$("#ul_"+ssid).remove();
				var length=$("#allCollect").text();
				$("#allCollect").text(length-1);
			}
		},"json");
	}
//点击播放按钮，对整个歌单进行播放
function playAll(ssid){
	//$("#"+ssid+"_1").trigger("click");
	$.post("songSheetServlet",{op:"findSongSsname",ssid:ssid},function(data){
		data= $.parseJSON(data);
		if(data.song!=undefined ||data.song!=""||data.song!=null){
			var sid = data.song;
			$.post("songServlet",{op:"findBySid",sid:sid},function(data){
				data= $.parseJSON(data);
				if(data!=null||data!=""||data!=undefined){
					var sid = data.sid;
					var addr = data.saddr;
					parent.addClick(sid, addr)
				}
			},"json");
		}
	},"json"); 
}

//点击左边的歌单，在右边展示
function show(ssname,photo,clickRate,ssid){
	/* $("#songsheetPhoto").attr("src",item.photo);
	$("#clickRate").text(item.clickRate); */
	var str="";
	$(".even_1").html("");
	var usid = $.trim($("#usid").val());
	$.post("songServlet",{op:"defaultSong",ssname:ssname,usid:usid},function(data){
		 $("#totalSong").html("");
		  data= $.parseJSON(data);
		  $("#totalSong").text(data.length);
		$.each(data,function(index,item){
					str+=" <tr class='even_1'><td><div class='hd'><span class='num'>"+(index+1)+"</span><div class='rk'><span class='ico'>3</span></div>";
	                str+="</div></td><td class='rank'><div class='tt'><img src='"+item.photo+"' width='50px' height='50px'/><span class='ply' onclick='parent.addClick("+item.sid+",\""+item.saddr+"\")'></span><div class='ttc'>";
	                str+="<span class='txt'><a href='javascript:parent.addClick("+item.sid+",\""+item.saddr+"\")'>"+item.sname+"</a></span></div></div></td><td class='sc_md'><div class='md2'>";
	                str+="<span class='time'>"+item.longs+"</span></div><div class='lqbz'><a class='md_tj' href=''></a><a class='md_sc' href='javascript:addtosheet("+item.sid+")'></a>";
	                str+="<a class='md_fx' href=''></a><a class='md_xz' href=''></a> </div></td><td class='gs_md'>";
	            	str+="<div><a href='' title='"+item.singerName+"'>"+item.singerName+"</a></div></td></tr>";
		});
		$("#myTable").append($(str));
		$("#songsheetName").text(ssname);
		$("#songsheetPhoto").attr("src",photo); 
		$("#clickRate").text(clickRate);
	},"json")
}

//点击歌单上面的播放
function playSongSheet2(ssname){
	debugger;
	parent.playSongSheet(ssname);
}