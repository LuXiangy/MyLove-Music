package com.yc.wyyyy.dao;

import java.sql.SQLException;
import java.util.List;

import com.yc.wyyyy.bean.SingerType;

public interface ISingerTypeDao {
	/*
	 * 添加歌手类型
	 * 
	 */
	public int add(String sname) throws SQLException;
	/*
	 * 分页查询
	 */
	public List<SingerType> find(Integer pageNo,Integer pageSize);
	
	/*
	 * 查询总记录数
	 */
	public int total();
	/*
	 * 修改歌手类型
	 */
	public int update(String sname,String sid) throws SQLException;
	/*
	 * 删除歌手类型
	 * 
	 */
	public int delete(String sid) throws SQLException;
	/*
	 * 查询所有
	 */
	public List<SingerType> find();
	
}
