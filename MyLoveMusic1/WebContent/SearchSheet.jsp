<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MyLove Music</title>
<link rel="icon" href="images/music.ico" />
<!-- <link rel="stylesheet" href="css/dl-toplist.css" />
<link rel="stylesheet" href="css/RsongSheet.css" /> -->
<link rel="stylesheet" href="css/searchSheet.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script src="js/jquery.js"></script>
</head>

<body>
	<div class="body1">
		<%
			Object ll = session.getAttribute("currentLogin");
			if (ll == null) {
		%>
		<%@include file="page/login.jsp"%>
		<%
			} else {
		%>
		<%@include file="page/alLogin.jsp" %>
		<%
			}
		%>
		<div class="content_right">
			<div class="g-wrap12">
				<div class="u-title-1">
					<h3>
						<span class="f-ff2">歌曲列表</span>
					</h3>
					<span class="sub"> <span id="totalSong"
						style="margin-left: 100px"><%=((java.util.List) session.getAttribute("songs")).size()%></span>
						首歌
					</span>

				</div>
			</div>
			<div class="biaoge">
				<table class="m-table" id="myTable">
					<tr class="one">
						<th class="first"></th>
						<th width="400px">
							<div class="wp">标题</div>
						</th>
						<th class="w2-1">
							<div class="wp">时长</div>
						</th>
						<th class="w3">
							<div class="wp">歌手</div>
						</th>
					</tr>
					<c:forEach items="${songs}" var="item" varStatus="status">
						<tr class='even_2'>
							<td class='td_2'><div class='hd'>
									<span class='num'>${status.count }</span>
									<div class='rk_2'>
										<span class='ico_2'></span>
									</div>
								</div></td>
							<td class='td_2'><div class='tt_2'>
									<span class='ply_2'
										onclick='parent.addClick(${item.sid},"${item.saddr}")'></span>
									<div class='ttc_2'>
										<a href='javascript:parent.addClick(${item.sid},"${item.saddr}")'>${item.sname}</a>
									</div>
								</div></td>
							<td class='td_2_2'><div class='md2'>
									<span class='time'>${item.longs}</span>
								</div>
								<div class='lqbz_2'>
									<a class='md_t' href=''></a><a class='md_s'
										href='javascript:addtosheet("+${item.sid}+")'></a> <a
										class='md_f' href=''></a><a class='md_x' href=''></a>
								</div></td>
							<td class='td_2'>
								<div>
									<a href='' title='${item.singerName}'>${item.singerName}</a>
								</div>
							</td>
						</tr>
					</c:forEach>

				</table>

				<!-- <div class="cmmts">
					<div class="u-page">
						<div class="u-page_1">
							<a class="zprv" href="">上一页</a> <a class="zpg1" href="">1</a> <a
								class="zpg2">2</a> <a class="zpg2">3</a> <a class="zpg2">4</a> <a
								class="zpg2">5</a> <a class="zpg2">6</a> <a class="zpg2">7</a> <a
								class="zpg2">8</a> <span class="zdot">...</span> <a class="zpg2">1968</a>
							<a class="zprv_1" href="">下一页</a>
						</div>
					</div>

				</div> -->
			</div>
		</div>

		<%@include file="bottom.jsp" %>
	</div>
	<div class="btmbar">
		<%@include file="page/btmbar.jsp"%>
	</div>
	<a href="" title="回到顶部" id="back"></a>
		<script src="js/showBtmbar.js"></script>
		<!-- <script src="js/dl-toplist.js"></script> -->
		
   <script src="js/autocomplete.js"></script>
   <script src="js/search.js"></script>
</body>
</html>
