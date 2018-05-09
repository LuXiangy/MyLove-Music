<%@page import="com.yc.wyyyy.bean.SongSheet"%>
<%@page import="java.util.List"%>
<%@page import="com.yc.wyyyy.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/add.css" />   
<input type="hidden" value="${sessionScope.currentLogin.usid}" id="usid" />
<div class="auto" id="addTo" style="top: 105px; left: 418px;">
		<div class="bar" id="mov-addTo">
			<div class="tt">添加到歌单</div>
		</div>
			<div class="bd-l" >
   						<ul class="l-2" id="ALLsongSheet">
	                	<li class="li1"  id="addNew">
	                    	<div class="hd"  >
	                        	<div class="left"><a href="javascript:void(0)"><img src="images/MyLikeBg.png" width="40px" height="40px" /></a></div>
	                            <p id="newP"><a href="javascript:showAdd()">添加新歌单</a></p>
	                        </div>
	                    </li>
               		 </ul> 

                   </div> 	
                  
		<span class="cls" title="点击关闭" id="cls-addTo">×</span>
	</div>
<div class="auto-1" style="display:none;">&nbsp;</div>

<div class="auto" id="dlg" style="top: 105px; left: 418px;">
		<div class="bar" id="mov-dlg">
			<div class="tt">新建歌单</div>
		</div>
				<div class="n-log">
						<input type="text" class="ipt" placeholder="请输入新歌单标题" id="songSheetName" />
						<br/>
						<label class="lab"> <input type="checkbox"
							 class="u-au" /> 设置为隐私歌单
						</label>
						<br/>
						<a
							href="javascript:addSongSheet(${sessionScope.currentLogin.usid})"
							class="u-dl"><i>确&nbsp;&nbsp;认</i></a>		
				</div>			
		<span class="cls" title="点击关闭" id="cls-dlg">×</span>
	</div>
<div class="auto-1" style="display:none;">&nbsp;</div>

<script type="text/javascript" src="js/add.js"></script>

