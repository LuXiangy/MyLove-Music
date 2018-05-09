package com.yc.wyyyy.biz;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

import com.yc.wyyyy.bean.UserInfo;

public interface IUserInfoBiz {
	/*
	 * 添加用户
	 * 
	 */
	public int add(String tel,String pwd, String uname) throws SQLException, NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	/*
	 *收藏歌单 
	 */
	public int changeSongSheet(String songSheet,String usid) throws SQLException;
	
	public int deleteSongSheet(String songSheet,String usid) throws SQLException;
	/*
	 * 分页查询
	 */
	public Map<String,Object> find(Integer pageNo,Integer pageSize);
	public UserInfo find(Integer usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	public UserInfo find(String usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	/*
	 * 修改用户信息
	 */
	public int update(UserInfo user) throws SQLException;
	/*
	 * 删除用户信息
	 * 
	 */
	public int delete(String usid) throws SQLException;
	/*
	 * 用户的登录
	 */
	
	public UserInfo login(String tel,String pwd) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	/*
	 * 积分
	 */
	public int addIntegral(String usid) throws SQLException;

	public int addFollow(String follow,String usid) throws SQLException;
	public int cancelFollow(String follow,String usid) throws SQLException;
	public UserInfo select(String tel) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	public int  reg(UserInfo userinfo) throws SQLException;
	public int  update(String tel, String pwd) throws SQLException;
}
