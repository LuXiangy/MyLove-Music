<%-- <%@page import="com.yc.wyyyy.bean.UserInfo"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<div class="logo">
		<a href="index.html"></a>
	</div>
	<ul class="head_ul" id="head">
		<li id="head1" class="findMusic"><span> <a
				href="dl-index.jsp" onClick="change_hd(this)"> <em>发现音乐</em> <sub
					class="cor">&nbsp;</sub>
			</a>
		</span></li>
		<li id="head2"><span> <a href="music.jsp"
				onClick="change_hd(this)"> <em>我的音乐</em> <sub class="cor">&nbsp;</sub>
			</a>
		</span></li>
		<li id="head3"><span> <a href="dl-friend.jsp"
				onClick="change_hd(this)"> <em>朋友</em> <sub class="cor">&nbsp;</sub>
			</a>
		</span></li>
		<li class="download" id="head4"><span> <a
				href="dl-download.jsp" onClick="change_hd(this)"> <em>下载客户端</em> <sub
					class="cor">&nbsp;</sub>
			</a>
		</span> <sup class="hot">&nbsp;</sup></li>
	</ul>


	<div class="header_r">
		<div class="inputdiv" id="search-form"></div>
		<div class="li_dl">
			<a href="javascript:void(0)" class="l_dl_a" id="login">登录</a>
			<div class="dl"></div>
			<div class="nu"></div>
			<div class="t_list">
				<div class="inne">
					<ul class="u_cb">
						<li><a href="#" class="itm_1" id="sjdl"> <i class="icn"></i>
								<em>手机号登录</em>
						</a></li>
						<li><a
							href="http://music.163.com/api/sns/authorize?snsType=10&clientType=web2&callbackType=Login&forcelogin=true"
							target="_blank" class="itm_2"> <i class="icn1"></i> <em>微信登录</em>
						</a></li>
						<li><a
							href="http://music.163.com/api/sns/authorize?snsType=5&clientType=web2&callbackType=Login&forcelogin=true"
							target="_blank" class="itm_2"> <i class="icn2"></i> <em>QQ登录</em>
						</a></li>
						<li><a
							href="http://music.163.com/api/sns/authorize?snsType=2&clientType=web2&callbackType=Login&forcelogin=true"
							target="_blank" class="itm_2"> <i class="icn3"></i> <em>新浪微博登录</em>
						</a></li>
						<li><a href="#" class="itm_2" id="wyyx"> <i class="icn4"></i>
								<em>网易邮箱帐号登录</em>
						</a></li>
					</ul>
				</div>
				<i class="arr"></i>
			</div>
		</div>

	</div>


</div>

<div class="auto" id="aut"
	style="top: 147px; left: 418px; display: none;">
	<div class="bar" id="mov">
		<div class="tt">登录</div>
	</div>
	<div class="cnt">
		<div class="con">
			<div class="con-t">
				<div class="main">
					<div class="plt"></div>
					<div class="mgt">
						<a href="javascript:void(0)" class="m-btn" id="sj"> <i>手机号登录</i>
						</a>
					</div>
					<div class="mgt">
						<a href="javascript:void(0)" class="m-btn-1" id="zc-1"> <i>注&nbsp;&nbsp;
								册</i>
						</a>
					</div>
				</div>
				<div class="alt">
					<ul>
						<li><a
							href="http://music.163.com/api/sns/authorize?snsType=10&clientType=web2&callbackType=Login&forcelogin=true"
							target="_blank"> <i class="wx"></i>微信登录
						</a></li>
						<li><a
							href="http://music.163.com/api/sns/authorize?snsType=5&clientType=web2&callbackType=Login&forcelogin=true"
							target="_blank"> <i class="QQ"></i>QQ登录
						</a></li>
						<li><a
							href="http://music.163.com/api/sns/authorize?snsType=2&clientType=web2&callbackType=Login&forcelogin=true"
							target="_blank"> <i class="wb"></i>微博登录
						</a></li>
						<li><a href="javascript:void(0)" id="wydl"> <i class="wy"></i>网易邮箱帐号登录
						</a></li>
					</ul>
				</div>
			</div>
			<div class="con-b">
				<a
					href="http://music.163.com/api/sns/authorize?snsType=6&clientType=web2&callbackType=Login&forcelogin=true"
					class="con-a" target="_blank">腾讯微博登录 ></a>
			</div>
		</div>
	</div>
	<span class="cls" title="点击关闭" id="cls">×</span>
</div>
<div class="auto-1" style="display: none;">&nbsp;</div>

<div class="auto" id="aut-phone"
	style="top: 35px; left: 418px; display: none;">
	<div class="bar" id="mov-1">
		<div class="tt">手机号登录</div>
	</div>
	<div class="cnt">
		<div class="con">
			<div class="n-log">
				<div>
					<input type="text" class="ipt" placeholder="请输入手机号" id="usertel" />
				</div>
				<div class="mgt-1">
					<input type="password" class="ipt" placeholder="请输入密码" id="userpwd" />
				</div>
				<div class="err" style="display: none;">
					<i></i>
				</div>
				<div class="mgt-1">
					<label class="lab"> 
					<input type="checkbox" checked="checked" class="u-au" id="autodl"/> 自动登录
					 <a href="javascript:void(0)" class="forget" onClick="forgetPwd()">忘记密码？</a>
					</label>
				</div>
				<div class="mgt-2">
					<a href="javascript:userLogin()" class="u-dl"> <i>登&nbsp;&nbsp;录</i>
					</a>
				</div>
				<div class="err" id="earning" style="display: none;">
					<i></i>
				</div>
			</div>
			<div class="con-b" id="ret">
				<a href="javascript:void(0)" class="con-r" id="other">< 其他登录方式</a> <a
					href="javascript:void(0)" class="con-a" id="zc-2">没有账号？免费注册 ></a>
			</div>
		</div>
	</div>
	<span class="cls" title="点击关闭" id="cls-1">×</span>
</div>
<div class="auto-1" style="display: none;">&nbsp;</div>

<div class="auto" id="aut-zc"
	style="top: 35px; left: 418px; display: none;">
	<div class="bar" id="mov-2">
		<div class="tt">手机号注册</div>
	</div>
	<div class="cnt">
		<div class="con">
			<div class="n-log">
				手机号：<br /> <br />
				<div>
					<input type="text" id="tel" class="ipt" placeholder="请输入手机号" />
				</div>
				<br /> 密码：<br />
				<div class="mgt-1">
					<input type="password" id="zcpwd" class="ipt"
						placeholder="设置登录密码，不少于6位" />
				</div>

				<div class="err" style="display: none;">
					<i></i>
				</div>

				<div class="mgt-2">
					<a href="javascript:void(0)" class="u-dl" id="zc-next"
						onClick="next1()"> <i>下一步</i>
					</a>
				</div>

				<div class="err" id="zcearning" style="display: none;">
					<i></i>
				</div>
			</div>
			<div class="con-b" id="ret">
				<a href="javascript:void(0)" class="con-r" id="ret1">< 返回登录</a>
			</div>
		</div>
	</div>
	<span class="cls" title="点击关闭" id="cls-2">×</span>
</div>
<div class="auto-1" style="display: none;">&nbsp;</div>


<div class="auto" id="aut-zc-next"
	style="top: 35px; left: 418px; display: none;">
	<div class="bar" id="mov-3">
		<div class="tt">手机号注册</div>
	</div>
	<div class="cnt">
		<div class="con">
			<div class="n-log">
				<p class="s-fc3">
					你的手机号：<strong class="js-mob s-fc1" id="zctelX"></strong>
				</p>
				<br />
				<p style="color: gray;">为了安全，我们会给你发送短信验证码</p>
				<br /> <br /> <input type="text" class="ipt" id="code"
					placeholder="请输入验证码" /> &nbsp;&nbsp; <a href="javascript:next1()"
					class="sendAgain" id="sendAgain"> <i>重新发送</i>
				</a>

				<div class="err" id="earningCode" style="display: none;">
					<i></i>
				</div>

				<div class="mgt-2">
					<a href="javascript:nextCode()" class="u-dl" id="zc-next-code">
						<i>下一步</i>
					</a>
				</div>
			</div>
			<div class="con-b" id="ret">
				<a href="javascript:void(0)" class="con-r" id="ret2">< 返回登录</a>
			</div>
		</div>
	</div>
	<span class="cls" title="点击关闭" id="cls-3">×</span>
</div>
<div class="auto-1" style="display: none;">&nbsp;</div>

<div class="auto" id="aut-zc-uname"
	style="top: 35px; left: 418px; display: none;">
	<div class="bar" id="mov-4">
		<div class="tt">手机号注册</div>
	</div>
	<div class="cnt">
		<div class="con">
			<div class="n-log">
				<br /> <br />
				<p id="nicheng">取一个昵称,让大家记住你</p>
				<br /> <br /> <input type="text" class="ipt" id="uname"
					placeholder="昵称不少于4个字母或2个汉字" />

				<div class="err" id="earningName" style="display: none;">
					<i></i>
				</div>
				<div class="mgt-2">
					<a href="javascript:zcNametoPage()" class="u-dl" id="start"> <i>开启云音乐</i>
					</a>
				</div>
			</div>

		</div>
	</div>
	<span class="cls" title="点击关闭" id="cls-4">×</span>
</div>
<div class="auto-1" style="display: none;">&nbsp;</div>

<div class="auto" id="aut-fgPwd"
	style="top: 35px; left: 418px; display: none;">
	<div class="bar" id="mov-5">
		<div class="tt">密码重置</div>
	</div>
	<div class="cnt">
		<div class="con">
			<div class="n-log">
				手机号：<br /> <br />
				<div>
					<input type="text" id="fgtel" class="ipt" placeholder="请输入手机号" />
				</div>
				<br /> 密码：<br />
				<div class="mgt-1">
					<input type="password" id="fPassword" class="ipt"
						placeholder="设置新密码，不少于6位" />
				</div>

				<div class="err" style="display: none;">
					<i></i>
				</div>

				<div class="mgt-2">
					<a href="javascript:void(0)" class="u-dl" id="fgzc-next"
						onClick="fgPwdtoPage()"> <i>下一步</i>
					</a>
				</div>

				<div class="err" id="fgearning" style="display: none;">
					<i></i>
				</div>
			</div>
			<div class="con-b" id="ret">
				<a href="javascript:fgReturn()" class="con-r" id="ret3">< 返回登录</a>
			</div>
		</div>
	</div>
	<span class="cls" title="点击关闭" id="cls-5">×</span>
</div>
<div class="auto-1" style="display: none;">&nbsp;</div>

<div class="auto" id="aut-forget"
	style="top: 35px; left: 418px; display: none;">
	<div class="bar" id="mov-6">
		<div class="tt">重置密码</div>
	</div>
	<div class="cnt">
		<div class="con">
			<div class="n-log">
				<p class="s-fc3">
					你的手机号：<strong class="js-mob s-fc1" id="fgTelCode"></strong>
				</p>
				<br />
				<p style="color: gray;">为了安全，我们会给你发送短信验证码</p>
				<br /> <br /> <input type="text" class="ipt" id="fgcode"
					placeholder="请输入验证码" /> &nbsp;&nbsp; <a href="javascript:void(0)"
					class="sendAgain" id="fgsendAgain"> <i>重新发送</i>
				</a>

				<div class="err" id="fgearningCode" style="display: none;">
					<i></i>
				</div>

				<div class="mgt-2">
					<a href="javascript:void(0)" class="u-dl" id="fg-next-code"
						onClick="fgnextCode()"> <i>完成</i>
					</a>
				</div>
			</div>
			<div class="con-b" id="ret">
				<a href="javascript:fgReturn()" class="con-r" id="ret4">< 返回登录</a>
			</div>
		</div>
	</div>
	<span class="cls" title="点击关闭" id="cls-6">×</span>
</div>
<div class="auto-1" style="display: none;">&nbsp;</div>
<script src="js/login.js"></script>