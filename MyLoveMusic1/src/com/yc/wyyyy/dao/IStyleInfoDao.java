package com.yc.wyyyy.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import com.yc.wyyyy.bean.StyleInfo;

public interface IStyleInfoDao {
	/*
	 * 添加歌曲风格类型
	 * 
	 */
	public int add(String sname,String flag,String mark) throws SQLException;
	/*
	 * 分页查询
	 */
	public List<StyleInfo> find(Integer pageNo,Integer pageSize);
	public List<StyleInfo> find(String stid,String sid);
	
	/**
	 * 查询所有歌曲类型
	 * @return
	 */
	public List<StyleInfo> find() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	/*
	 * 查询总记录数
	 */
	public int total();
	/*
	 * 修改歌曲风格
	 */
	public int update(String sname,String flag,String sid,String mark) throws SQLException;
	/*
	 * 删除歌曲风格
	 * 
	 */
	public int delete(String sid) throws SQLException;
	

}
