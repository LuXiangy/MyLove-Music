package com.yc.wyyyy.biz;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

import com.yc.wyyyy.bean.Admin;

public interface IAdminBiz {
	/*
	 * 添加
	 */
	public int add(String aname,String pwd) throws SQLException;
	/*
	 * 分页查询
	 */
	public Map<String,Object> find(Integer pageNo,Integer pageSize);
	/*
	 * 修改管理员信息
	 */
	public int update(String pwd,String oldPwd,String aid) throws SQLException;
	/*
	 * 删除管理员信息
	 * 
	 */
	public int delete(String aid) throws SQLException;
	/*
	 * 登录
	 */
	
	public Admin login(String aname,String pwd) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;

}
