package com.yc.wyyyy.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.Singer;


public interface ISingerDao {
	/*
	 * 添加歌手
	 * 
	 */
	public int add(Singer singer) throws SQLException;
	/*
	 * 分页查询
	 */
	public List<Singer> find(Map<String,String> map,Integer pageNo,Integer pageSize);
	public Singer findById(String sid,String sname) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	/*
	 * 查询总记录数
	 */
	public int total(Map<String,String> map);
	/*
	 * 修改歌手信息
	 */
	public int update(Singer singer) throws SQLException;
	/*
	 * 修改点击率
	 */
	public int update(String sid) throws SQLException;
	/*
	 * 删除歌手
	 * 
	 */
	public int delete(String sid) throws SQLException;
	
	public List<Singer> find();
	public List<Singer> findByClick();

}
