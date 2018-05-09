<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<script language="JavaScript" type="text/JavaScript">

	function MM_reloadPage(init) { //reloads the window if Nav4 resized
		if (init == true)
			with (navigator) {
				if ((appName == "Netscape") && (parseInt(appVersion) == 4)) {
					document.MM_pgW = innerWidth;
					document.MM_pgH = innerHeight;
					onresize = MM_reloadPage;
				}
			}
		else if (innerWidth != document.MM_pgW
				|| innerHeight != document.MM_pgH)
			location.reload();
	}
	MM_reloadPage(true);
	//--
</script>

<Script>
	function onClose() {

		if (window.screenTop > 10000) {
			var targeturl = "auto_logout.jsp"
			newwin = window.open("", "", "scrollbars,Toolbar=yes")
			if (document.all) {
				newwin.moveTo(0, 0)
				newwin.resizeTo(80, 60)
			}
			newwin.location = targeturl
		}
	}
	window.onunload = onClose
</Script>
</head>

<body>
		<IFRAME  SRC="dl-index.jsp"  frameborder="0" width="100%" height="100%" id="dl-index"></IFRAME>
		  <div class="btmbar" >
       			 <%@include file="page/btmbar.jsp"%> 
			</div>
	
</body>

<script src="js/btmbar.js"></script>
<script src="js/showBtmbar.js"></script>
    
<script src="js/search.js"></script>
<script src="js/autocomplete.js"></script>

 
</html>
