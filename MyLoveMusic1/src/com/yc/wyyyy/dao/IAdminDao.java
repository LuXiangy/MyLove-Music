package com.yc.wyyyy.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import com.yc.wyyyy.bean.Admin;

public interface IAdminDao {
	/*
	 * 添加管理员
	 * 
	 */
	public int add(String aname,String pwd) throws SQLException;
	/*
	 * 分页查询
	 */
	public List<Admin> find(Integer pageNo,Integer pageSize);
	
	/*
	 * 查询总记录数
	 */
	public int total();
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
	 * 管理员的登录
	 */
	
	public Admin login(String aname,String pwd) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
}
