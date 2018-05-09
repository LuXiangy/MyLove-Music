<%@page import="com.yc.wyyyy.util.StaticUtil"%>
<%@page import="com.yc.wyyyy.bean.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta charset="utf-8" />
<title>MyLove Music后台管理</title>
<link rel="short icon" href="../../images/music.ico" />
<link rel="stylesheet" type="text/css" href="../../easyui/css/easyui.css">
<link rel="stylesheet" type="text/css" href="../../easyui/css/wu.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/css/icon.css">
<link rel="stylesheet" type="text/css" href="../../easyui/css/demo.css">
<script type="text/javascript" src="../../easyui/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/js/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="../../js/showpic.js"></script>
<script type="text/javascript" src="../../js/ajaxfileupload.js"></script>

</head>
<body class="easyui-layout" id="class_panel">
	<!-- begin of header -->
	<!-- 南边 -->
	<div class="wu-header"
		data-options="region:'north',border:false,split:true">
		<div class="wu-header-left">
			<h1>MyLove Music后台管理</h1>
		</div>
		<div class="wu-header-right">

			<p>
				<strong class="easyui-tooltip" title="2条未读消息">${admin.aname}</strong>，欢迎您！
			</p>

			<p>
				<a href="#">网站首页</a> | <a href="#">支持论坛</a> | <a href="#">帮助中心</a> |
				<a href="../index.jsp">安全退出</a>
			</p>
		</div>
	</div>
	<!-- 西边 -->
	<div class="wu-sidebar"
		data-options="region:'west',split:true,border:true,title:'导航菜单'">
		<div class="easyui-accordion" data-options="border:false,fit:true">
			<div title="用户信息" data-options="iconCls:'icon-group'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-user"><a href="javascript:void(0)"
						data-icon="icon-user" data-link="admin.html" iframe="0">管理员信息管理</a></li>
					<li iconCls="icon-user-green"><a href="javascript:void(0)"
						data-icon="icon-user-green" data-link="userInfo.html" iframe="0">会员信息管理</a></li>
				</ul>
			</div>

			<div title="歌手信息" data-options="iconCls:'icon-award-star-bronze-1'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-award-star-gold-2"><a
						href="javascript:void(0)" data-icon="icon-award-star-gold-2"
						data-link="singerType.html" iframe="0">歌手类型管理</a></li>
					<li iconCls="icon-user-mature"><a href="javascript:void(0)"
						data-icon="icon-user-mature" data-link="singer.html" iframe="0">歌手信息管理</a></li>
				</ul>
			</div>

			<div title="歌曲风格信息" data-options="iconCls:'icon-note'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-package"><a href="javascript:void(0)"
						data-icon="icon-package" data-link="StyleInfo.html" iframe="0">歌曲风格管理</a></li>
					<li iconCls="icon-rss"><a href="javascript:void(0)"
						data-icon="icon-rss" data-link="songSheet.html" iframe="0">歌单信息管理</a></li>
					<li iconCls="icon-script"><a href="javascript:void(0)"
						data-icon="icon-script" data-link="song.html" iframe="0">歌曲信息管理</a></li>

				</ul>
			</div>

			<div title="系统设置" data-options="iconCls:'icon-wrench'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-cog"><a href="javascript:void(0)"
						data-icon="icon-cog" data-link="temp/layout-3.html" iframe="0">导航标题</a></li>

				</ul>
			</div>
		</div>
	</div>
	<!-- end of sidebar -->
	<!-- begin of main -->
	<div id="rcmenu" class="easyui-menu" style="">
		<div id="closeall">关闭全部</div>
		<div id="closeother">关闭其他</div>
		<div id="closeright">当前页右侧全部关闭</div>
		<div id="closeleft">当前页左侧全部关闭</div>
	</div>
	<!-- 中间 -->
	<div id="cc" class="wu-main"
		data-options="region:'center',title:'操作',tools:[{
		iconCls:'icon-full',
		handler:function(){
			full();
		}
	},{
		iconCls:'icon-unfull',
		handler:function(){
			unFull();
		}
	}]">
		<div id="wu-tabs" class="easyui-tabs"
			data-options="border:false,fit:true">
			<div title="首页"
				data-options="href:'welcome.html',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
		</div>
	</div>
	<!-- 东边 -->
	<div
		data-options="region:'east',split:true,title:'工具箱' ,selected:false"
		style="width: 170px; padding: 10px;">
		<div class="easyui-calendar" style="width: 150px; height: 150px;"></div>
	</div>
	<!-- end of main -->
	<!-- begin of footer -->
	<!-- 南边 -->
	<div class="wu-footer"
		data-options="region:'south',border:true,split:true">&copy; 2017
		Wu All Rights Reserved</div>
	<!-- end of footer -->

	<script type="text/javascript">
		$(function() {
			$("#class_panel").layout('collapse', 'east');
			//绑定右键菜单事件
			$(".easyui-tabs").bind('contextmenu', function(e) {
				e.preventDefault();
				$('#rcmenu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			});

			//关闭所有标签页  
			$("#closeall").bind("click", function() {
				var tablist = $('#wu-tabs').tabs('tabs');
				console.log(tablist);
				//  return; 
				for (var i = tablist.length - 1; i >= 1; i--) {
					$('#wu-tabs').tabs('close', i);
				}
			});
			//关闭其他页面（先关闭右侧，再关闭左侧）  
			$("#closeother").bind("click", function() {
				var tablist = $('#wu-tabs').tabs('tabs');
				var tab = $('#wu-tabs').tabs('getSelected');
				var index = $('#wu-tabs').tabs('getTabIndex', tab);
				for (var i = tablist.length - 1; i > index; i--) {
					$('#wu-tabs').tabs('close', i);
				}
				var num = index - 1;
				if (num < 1) {
					return;
				} else {
					for (var i = num; i >= 1; i--) {
						$('#wu-tabs').tabs('close', i);
					}
					$("#wu-tabs").tabs("select", 1);
				}
			});
			//关闭右边的选项卡
			$("#closeright").bind("click", function() {
				var tablist = $('#wu-tabs').tabs('tabs');
				var tab = $('#wu-tabs').tabs('getSelected');
				var index = $('#wu-tabs').tabs('getTabIndex', tab);
				for (var i = tablist.length - 1; i > index; i--) {
					$('#wu-tabs').tabs('close', i);
				}
			});
			//关闭右边的选项卡
			$("#closeleft").bind("click", function() {
				var tablist = $('#wu-tabs').tabs('tabs');
				var tab = $('#wu-tabs').tabs('getSelected');
				var index = $('#wu-tabs').tabs('getTabIndex', tab);
				var num = index - 1;
				if (num < 1) {
					return;
				} else {
					for (var i = num; i >= 1; i--) {
						$('#wu-tabs').tabs('close', i);
					}
					$("#wu-tabs").tabs("select", 1);
				}
			});

		});
	</script>
	<script type="text/javascript">
		$(function() {

			$('.wu-side-tree a').bind("click", function() {
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe') == 1 ? true : false;
				addTab(title, url, iconCls, iframe);
			});
		});

		/**
		 * Name 选项卡初始化
		 */
		$('#wu-tabs').tabs({
			tools : [ {
				iconCls : 'icon-reload',
				border : false,
				handler : function() {
					$('#wu-datagrid').datagrid('reload');
				}
			} ]
		});

		/**
		 * Name 添加菜单选项
		 * Param title 名称
		 * Param href 链接
		 * Param iconCls 图标样式
		 * Param iframe 链接跳转方式（true为iframe，false为href）
		 */
		function addTab(title, href, iconCls, iframe) {
			var tabPanel = $('#wu-tabs');
			if (!tabPanel.tabs('exists', title)) {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'
						+ href + '" style="width:100%;height:100%;"></iframe>';
				if (iframe) {
					tabPanel.tabs('add', {
						title : title,
						content : content,
						iconCls : iconCls,
						fit : true,
						cls : 'pd3',
						closable : true,
						tools : [ {
							iconCls : 'icon-mini-refresh',
							handler : function() {
								refreshTab(title);//刷新当前指定tab
							}
						} ]
					});
				} else {
					tabPanel.tabs('add', {
						title : title,
						href : href,
						iconCls : iconCls,
						fit : true,
						cls : 'pd3',
						closable : true,
						tools : [ {
							iconCls : 'icon-mini-refresh',
							handler : function() {
								refreshTab(title);//刷新当前指定tab
							}
						} ]
					});
				}
			} else {
				tabPanel.tabs('select', title);
			}
		}
		function refreshTab(title) {
			var tt = $('#wu-tabs');
			tt.tabs('select', title);//跳转到指定tab
			var cruuTab = tt.tabs('getTab', title);//获取到当前tab的title
			var url = $(cruuTab.panel('options').content).attr('src');//获取当前tab的url
			tt.tabs('update', {
				tab : cruuTab,
				options : {
					title : title,
					href : url
				// the new content URL
				}
			});
		}
		/**
		 * Name 移除菜单选项
		 */
		function removeTab() {
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab) {
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
	</script>
</body>
</html>
