//自动补全搜素
var proposals=[];
findAllsongName();//页面一加载获取所有的歌曲名字
findAllstyleName();//查询所有的歌曲类型
findAllSinger();//查询所有的歌手类型
function findAllsongName() {
	$.ajax({
		url : "songServlet",
		data : "op=FindAllSongsName",
		type : "POST",
		dataType : "JSON",
		success : function(data) {
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				proposals[proposals.length]=item.sname+"----歌曲";
			});
			
		}
	});
}
function findAllstyleName() {
	$.ajax({
		url : "styleInfoServlet",
		data : "op=findstyleName",
		type : "POST",
		dataType : "JSON",
		success : function(data) {
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				proposals[proposals.length]=item.sname+"----歌曲类型";
			});
			
		}
	});
}
function findAllSinger() {
	$.ajax({
		url : "singerServlet",
		data : "op=findByclick",
		type : "POST",
		dataType : "JSON",
		success : function(data) {
			data= $.parseJSON(data);
			$.each(data,function(index,item){
				proposals[proposals.length]=item.sname+"----歌手";
			});
			
		}
	});
}
//var proposals = ['at', 'boat', 'bear', 'chief', 'dog', 'drink', 'elephant', 'fruit', 'grave','hotel', 'illness', 'London', 'motorbike','xw素材网官网','xw素材网之家','xw素材网下载'];
$(document).ready(function(){
//	$("#dl-index").contents().find("#search-form").autocomplete({
	$("#search-form").autocomplete({
		hints: proposals,
		width: 250,
		height: 10,
	});
});
