$(function() {
		var usid = $.trim($("#usid").val());
		$.post("songSheetServlet", {
			op : "findMy",
			usid : usid
		}, function(data) {

		}, "json");
	})