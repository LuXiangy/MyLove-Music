var singerInfo=[];//用来存储歌手名信息的主要获取id
	getsingerInfo();//获取歌手信息
	function getsingerInfo(){
		$.ajax({
			url:"singerServlet",
			data:"op=findAll",
			type:"POST",
			dataType:"JSON",
			success:function(data){
				data=JSON.parse(data);
				$.each(data,function(index,item){
					singerInfo[singerInfo.length]=item;
				});
			}	
		});
	}
	
	var sname="";//歌手名
	var songName="";//歌名
	function getFileName(obj) {
		var pos = obj.value.lastIndexOf("/") * 1;
		return obj.value.substring(pos + 1);
	}
	function showInfo(obj) {
		var filename =  getFileName(obj);
		/*alert(filename);*/
		var str=filename.split('-');//将歌手和歌名分割
		  sname=str[0];
		  sname=sname.substring(sname.lastIndexOf("\\")+1);//歌手
		  //alert("歌手名为:"+sname);
		  songName=str[1].substring(0,str[1].indexOf('.'));//歌名
	}
	function UserAddMusic() {/*用户添加歌曲 */
			//检测添加歌曲之前是否已经存在歌曲
				var singerId=0;//歌手id
				for(var i=0,len=singerInfo.length;i<len;i++){
		      		if($.trim(singerInfo[i].sname)==$.trim(sname)){
		      			singerId=singerInfo[i].sid;
		      		}
		      	}
				$.ajax({
					url:"songServlet",
					data:{op:"findSongByNameAndId",sname:$.trim(songName),singerId:singerId},
					type:"POST",
					dataType:"JSON",
					success:function(data){
						if(data==1){
							 alert("数据库中已经存在歌曲，请勿重复添加!!!!");
							 return;
						}else{
							/* alert(123); */
							  $.ajaxFileUpload({
								url:"songServlet?op=addSong",
								secureuri:false,
								fileElementId:['song_update_saddr','lyric','song_update_photo'],
								dataType:"JSON",
								data:{singerId:singerId,sname:$.trim(songName),languages:0,style:0,singerName:sname},
								success:function(data){
									if(data!=1){
										 alert("导入歌曲失败");
										 $("#song_update_photo").html("");
										 $("#lyric").html("");
										 $("#song_update_saddr").html("");
										 $("#previewImg").html("");
										 return;
									}else{
										 alert("导入歌曲成功");
										 $("#song_update_photo").html("");
										 $("#lyric").html("");
										 $("#song_update_saddr").html("");
										 $("#previewImg").html("");
										 return;
									}
								}
							});
						} 
					}	
				});
			 
			/* alert("歌手："+sname+"歌名:"+songName+"id:"+singerId);  */

		}
	
	
	 var image = '';
     function selectImage(file){
         if(!file.files||!file.files[0]){
             return;
         }
         var reader = new FileReader();
         reader.onload = function(evt){
             document.getElementById('previewImg').src = evt.target.result;
             image = evt.target.result;
			  
			  
         }
		
         reader.readAsDataURL(file.files[0]);
     }