package com.yc.wyyyy.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.SingerType;



public interface ISingerTypeBiz {
	/*
	 * 添加
	 */
	public int add(String sname) throws SQLException;
	/*
	 * 分页查询
	 */
	public Map<String,Object> find(Integer pageNo,Integer pageSize);
	/*
	 * 修改歌手类型
	 */
	public int update(String sname,String sid) throws SQLException;
	/*
	 * 删除歌手类型
	 * 
	 */
	public int delete(String sid) throws SQLException;
	
	public List<SingerType> find();
	
}
