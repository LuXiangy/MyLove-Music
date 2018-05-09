package com.yc.wyyyy.biz;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.StyleInfo;

public interface IStyleInfoBiz {
	/*
	 * 添加风格
	 */
	public int add(String sname,String flag,String mark) throws SQLException;
	/*
	 * 分页查询
	 */
	public Map<String,Object> find(Integer pageNo,Integer pageSize);
	public List<StyleInfo> find(String stid,String sid);
	
	/**
	 * 查询所有的歌曲类型
	 * @return
	 */
	public List<StyleInfo> find() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	/*
	 * 修改风格
	 */
	public int update(String sname,String flag,String sid,String mark) throws SQLException;
	/*
	 * 删除风格
	 * 
	 */
	public int delete(String sid) throws SQLException;
	

}
