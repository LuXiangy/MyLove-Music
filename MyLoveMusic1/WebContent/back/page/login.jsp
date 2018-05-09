<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="header.jsp"%>
<style>
	body{
		background:url(../images/music.ico);
		background-size: 161px 161px;
	}
</style>

<body>
	<script type="text/javascript">
		function loadImage() {
			var img = document.getElementById("randImg");
			img.src = "image.jsp?r=" + Math.random();
		}
		
		function submitForm(){
			var raname = $("#raname").val().trim();
			var rapwd = $("#rapwd").val().trim();
			var valcode = $("#valcode").val().trim();
			$.post("../adminServlet",{op:"adminLogin",aname:raname,pwd:rapwd,valcode:valcode},function(data){
				data=parseInt($.trim(data));
				if(data!=null){
					location.href="page/index.jsp";
				}else{
					alert("登录失败,用户名或密码错误");
				}
			},"text");
		}
	</script>


	<div id="dlg" class="easyui-dialog" title="用户登录" style="width: 400px; height: 250px; padding: 20px 70px 10px 70px;" data-options="closable:false">
		<table cellpadding="5">
			<tr>
				<td>用户名:</td>
				<td>
					<input class="easyui-validatebox textbox" type="text" id="raname" name="raname" data-options="required:true"></input>
				</td>
			</tr>
			<tr>
				<td>密码:</td>
				<td>
					<input class="easyui-validatebox textbox" type="password" id="rapwd" name="rapwd" data-options="required:true"></input>
				</td>
			</tr>
			<tr>
				<td>验证码:</td>
				<td>
					<input class="easyui-validatebox textbox" type="text" id="valcode" name="valcode" data-options="required:true"></input>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<img id="randImg" border=0 src="image.jsp">
					<a href="javascript:loadImage();">换一张</a>
				</td>
			</tr>
		</table>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width: 45px;">登录</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
</body>
</html>