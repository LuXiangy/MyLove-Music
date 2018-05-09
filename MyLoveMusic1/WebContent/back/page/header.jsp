<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.yc.wyyyy.util.StaticUtil"%>
<%@page import="com.yc.wyyyy.bean.Admin"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta charset="utf-8" />
<title>MyLove Music后台管理</title>
<link rel="short icon" href="../images/music.ico" />
<link rel="stylesheet" type="text/css" href="../easyui/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyui/css/wu.css" />
<link rel="stylesheet" type="text/css" href="../easyui/css/icon.css" />
<script type="text/javascript" src="../easyui/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/showpic.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
</head>