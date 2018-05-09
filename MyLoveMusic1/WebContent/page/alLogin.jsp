<%@page import="com.yc.wyyyy.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

function exit(){
	$.post("userInfoServlet",{op:"exit"},function(data){
		location.href="dl-index.jsp";
	},"text");
}
</script> 
		<%
		UserInfo userInfo=null;
		Object obj=session.getAttribute("currentLogin");
		if(obj==null){
			out.println("<script>alert('请先登录');location.href='index.jsp';</script>");
		}else{
			userInfo=(UserInfo)obj;
			if(userInfo.getPhoto()==null){
				userInfo.setPhoto("images/yclogo.png");
			}
			if(userInfo.getUname()==null){
				userInfo.setUname(userInfo.getTel());
			}
			%>
			<%-- <%
				UserInfo userInfo=null;
				Object obj=session.getAttribute("currentLogin");
				userInfo=(UserInfo)obj;
				if(userInfo.getPhoto()==null){
					userInfo.setPhoto("images/yclogo.png");
				}
				if(userInfo.getUname()==null){
					userInfo.setUname(userInfo.getTel());
				}
			%> --%>
			
		<input type="hidden" value="${sessionScope.currentUser }" id="user"/>
		<div id="header">
			<div class="logo">
				<a href="dl-index.jsp"></a>
			</div>
			<ul class="head_ul" id="head">
				<li class="findMusic" id="head1"><span> <a href="dl-index.jsp"
						onClick="change_hd(this)"> <em>发现音乐</em> <sub class="cor">&nbsp;</sub>
					</a>
				</span></li>
				<li id="head2"><span> <a href="dl-music.jsp" 
						onClick="change_hd(this)"> <em>我的音乐</em> <sub class="cor">&nbsp;</sub>
					</a>
				</span></li>
				<li id="head3"><span> <a href="dl-friend.jsp"
						onClick="change_hd(this)"> <em>朋友</em> <sub class="cor">&nbsp;</sub>
					</a>
				</span></li>
				<li class="download" id="head4"><span> <a href="dl-download.jsp"
						onClick="change_hd(this)"> <em>下载客户端</em> <sub class="cor">&nbsp;</sub>
					</a>
				</span> <sup class="hot">&nbsp;</sup></li>
			</ul>

			<div class="header_r">
				<div class="inputdiv" id="search-form">
				</div>
				<!--<a href="javascript:void(0)" id="eml"></a> -->
				<div class="li_dl">
				
					<img src="<%=userInfo.getPhoto() %>" width="34px" height="34px" 
						style="float: left "  id="myPhoto"/><a href="javascript:void(0)" class="l_dl_a"
						id="login"><%=userInfo.getUname()%></a>
					 	<%
		}
		
		%> 
					<div class="dl"></div>
					<div class="nu"></div>
					<div class="t_list">
						<div class="inne">
							<ul class="u_cb">
								<li><a href="person.jsp" class="itm_1"> <i class="icn"></i>
										<em>我的主页</em>
								</a></li>
								<li><a href="rank.jsp" class="itm_2"> <i class="icn1"></i>
										<em>我的等级</em>
								</a></li>
								<li><a href="member.jsp" class="itm_2"> <i class="icn2"></i>
										<em>会员中心</em>
								</a></li>
								<li><a href="setting.jsp" class="itm_2"> <i
										class="icn3"></i> <em>个人设置</em>
								</a></li>
								<li><a href="daoru.jsp" class="itm_2"> <i class="icn4"></i>
										<em>导入歌单</em>
								</a></li>
								<li><a href="javascript:exit()" class="itm_2"> <i class="icn5"></i>
										<em>退出</em>
								</a></li>
							</ul>
						</div>
						<i class="arr"></i>
					</div>
				</div>

			</div>
		</div>
<!-- <script src="js/dl-index.js"></script> -->