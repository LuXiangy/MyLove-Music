package com.yc.wyyyy.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.StyleInfo;
import com.yc.wyyyy.biz.IStyleInfoBiz;
import com.yc.wyyyy.dao.IStyleInfoDao;
import com.yc.wyyyy.dao.Impl.StyleInfoDaoImpl;
import com.yc.wyyyy.util.StringUtil;

public class StyleInfoBizImpl implements IStyleInfoBiz{

	@Override
	public int add(String sname, String flag,String mark) throws SQLException {
		IStyleInfoDao styleInfoDao=new StyleInfoDaoImpl();
		if(StringUtil.isNull(sname,flag)){
			return 0;
		}
		return styleInfoDao.add(sname, flag,mark);
	}

	@Override
	public Map<String, Object> find(Integer pageNo, Integer pageSize) {
		IStyleInfoDao styleInfoDao=new StyleInfoDaoImpl();
		List<StyleInfo> list=styleInfoDao.find(pageNo, pageSize);
		int total=styleInfoDao.total();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("rows",list);
		return map;
	}
	public List<StyleInfo> find(String stid,String sid){
		IStyleInfoDao styleInfoDao=new StyleInfoDaoImpl();
		
		return styleInfoDao.find(stid,sid);
	}
	@Override
	public int update(String sname, String flag, String sid,String mark) throws SQLException {
		IStyleInfoDao styleInfoDao=new StyleInfoDaoImpl();
		if(StringUtil.isNull(sname,flag,sid)){
			return 0;
		}
		return styleInfoDao.update(sname, flag, sid,mark);
	}

	@Override
	public int delete(String sid) throws SQLException {
		IStyleInfoDao styleInfoDao=new StyleInfoDaoImpl();
		if(StringUtil.isNull(sid)){
			return 0;
		}
		return styleInfoDao.delete(sid);
	}

	@Override
	public List<StyleInfo> find() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		IStyleInfoDao styleInfoDao=new StyleInfoDaoImpl();
		return styleInfoDao.find();
	}

}
