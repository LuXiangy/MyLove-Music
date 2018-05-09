<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>MyLove Music</title>
<link rel="short icon" href="images/music.ico" />
<link rel="stylesheet" href="css/setting.css" />
<link rel="stylesheet" href="css/autocomplete.css">
<script type="text/javascript" src="easyui/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/showpic.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<style>
.mynav {
	display: none;
}
</style>
</head>

<body>
	<div class="body1">
		<%@include file="page/alLogin.jsp"%>
		<input type="hidden" id="usid" value="${sessionScope.currentLogin.usid}" />
		<div class="nav_1"></div>
		<div class="mymusic">
			<div class="m-bd">
				<div class="u-title">
					<h3>
						 <span class="f-ff2">个人设置</span>
					</h3>
				</div>
				<div class="u-title_1">
					<ul class="m-tabs f-cb">
						<li class="fst"><a class="z-slt" href="">
								<!-- <em>基本设置</em> -->
							</a></li>
						<li><a href="">
								<!-- <em>绑定设置</em> -->
								<em>基本设置</em>
							</a></li>
						<li><a href="">
								<!-- <em>隐私设置</em> -->
							</a></li>
					</ul>
				</div>
				<div class="n-base">
					<form action="login.html" method="post">
						昵称：
						<input style="height: 33px;" type="text" name="uname" maxlength="11" size="50" placeholder="请输入昵称" value="${sessionScope.currentLogin.uname}" id="uname" />
						<br /> <br /> <br />


						<div class="itm f-cb">
							<label class="lab">介绍：</label>
							<div class="u-txtwrap f-pr">
								<textarea id="signature" class="u-txt area">
                         ${sessionScope.currentLogin.mark} 
                        </textarea>
								<span id="remain" class="zs s-fc2">140</span>
							</div>
						</div>
						<br /> 性别：
						<input type="radio" name="sex" value="男" id="man" />
						&nbsp;男&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="女" id="girl" />
						&nbsp;女&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="保密" id="secret" />
						&nbsp;保密<br />
						<div class="year">
							<table>
								<tr>
									<td>生日：</td>
									<td>
										<select id="birth_year" style="width: 75px; height: 30px; border-style: solid" onchange="setDays(this,birth_month,birth_day);">
											<option>${fn:substringBefore(sessionScope.currentLogin.birth,"-")}</option>
											<option value="">年</option>

										</select> <select id="birth_month" style="width: 75px; height: 30px; border-style: solid" onchange="setDays(birth_year,this,birth_day);">
											<option>${fn:substring(sessionScope.currentLogin.birth, 5,7)}</option>
											<option value="">月</option>
										</select> <select id="birth_day"  style="width: 75px; height: 30px; border-style: solid" id="birth_day">
											<option>${fn:substring(sessionScope.currentLogin.birth, 8,10)}</option>
											<option value="">日</option>
										</select>
									</td>
								</tr>
							</table>
						</div>

						<div class="diqu">
							<table>
								<tr>
									<td>地区：</td>
									<td>
										<select id="province" onchange="selPro()" style="width: 101px; height: 30px;">
											<option>北京市</option>
											<option>天津市</option>
											<option>上海市</option>
											<option>重庆市</option>
											<option>湖北省</option>
											<option>河北省</option>
											<option>福建省</option>
											<option>广东省</option>
											<option>海南省</option>
											<option>台湾省</option>
											<option>四川省</option>
											<option>湖南省</option>
											<option>安徽省</option>
											<option>江苏省</option>
											<option>云南省</option>
											<option>新疆维吾尔自治区</option>
											<option>内蒙古自治区</option>
											<option>甘肃省</option>
											<option>广西壮族自治区</option>
											<option>宁夏回族自治区</option>
											<option>香港特别行政区</option>
											<option>澳门特别行政区</option>
											<option>浙江省</option>
											<option>辽宁省</option>
											<option>黑龙江省</option>
											<option>山东省</option>
											<option>江西省</option>
											<option>山西省</option>
											<option>陕西省</option>
											<option>吉林省</option>
											<option>贵州省</option>
											<option>青海省</option>
											<option>西藏自治区</option>
										</select> 
										 <select id="citya" onChange="selCity()" style="width: 101px; height: 30px;">
										</select>

									</td>
								</tr>
							</table>

						</div>

						<div class="avatar f-pr">
							<div id="showpic">
								<img src="${sessionScope.currentLogin.photo}" width='135px' height='120px' />
								<input type="hidden" id="beforeStr" value="${sessionScope.currentLogin.photo}" />
							</div>

							<input type="file" name="photo" id="singer_update_photo" onchange="setImagePreviews(this,'showpic')" style="filter: alpha(opacity = 0); opacity: 0; width: 0; height: 0;" />
							<a id="upload" class="upload" href="javascript:selectFile()" onchange="setImagePreviews(this,'singer_update_showpic')">更换头像</a>
						</div>
						<div class="itm ft">
							<a href="javascript:changeInfo(${sessionScope.currentLogin.usid})" class="baocun">
								<img src="images/save.jpg" />
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
			<%@include file="bottom.jsp"%>
	</div>


<%-- 	<div class="btmbar">
		<%@include file="page/btmbar.jsp"%>

	</div> 
	<a id="toTop" title="回到顶部" href="" hidefocus="true" style="display: none;">回到顶部</a>
	<script src="js/showBtmbar.js"></script>--%>
	<script src="js/setting.js"></script>
	
	<script src="js/autocomplete.js"></script>
    <script src="js/search.js"></script>
</body>
</html>
