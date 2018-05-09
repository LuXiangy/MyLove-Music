package com.yc.wyyyy.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.Singer;
import com.yc.wyyyy.biz.ISingerBiz;
import com.yc.wyyyy.dao.ISingerDao;
import com.yc.wyyyy.dao.Impl.SingerDaoImpl;
import com.yc.wyyyy.util.StringUtil;

public class SingerBizImpl implements ISingerBiz{

	@Override
	public int add(Singer singer) throws SQLException {
		ISingerDao singerDao=new SingerDaoImpl();
		if(StringUtil.isNull(singer.getSname())){
			return 0;
		}
		return singerDao.add(singer);
	}

	public List<Singer> find(){
		ISingerDao singerDao=new SingerDaoImpl();
		return singerDao.find();
	}
	public List<Singer> findByClick(){
		ISingerDao singerDao=new SingerDaoImpl();
		return singerDao.findByClick();
	}
	public Singer findById(String sid,String sname) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		if(StringUtil.isNull(sid)){
			return null;
		}
		ISingerDao singerDao=new SingerDaoImpl();
		return singerDao.findById(sid,sname);
	}
	@Override
	public Map<String, Object> find(String sname, String stid, Integer pageNo, Integer pageSize) {
		ISingerDao singerDao=new SingerDaoImpl();
		Map<String,String > map=new HashMap<String,String>();
		
		if(!StringUtil.isNull(sname)){
			map.put("sname like ","%"+sname+"%");
		}
		if(!StringUtil.isNull(stid)){
			map.put("stid=", stid);
		}
		List<Singer> rows=singerDao.find(map, pageNo, pageSize);
		int total=singerDao.total(map);
		
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("total", total);
		result.put("rows", rows);
		return result;
		
	}

	@Override
	public int update(Singer singer) throws SQLException {
		ISingerDao singerDao=new SingerDaoImpl();
		if(StringUtil.isNull(singer.getSname())){
			return 0;
		}
		return singerDao.update(singer);
	}

	@Override
	public int update(String sid) throws SQLException {
		ISingerDao singerDao=new SingerDaoImpl();
		if(StringUtil.isNull(sid)){
			return 0;
		}
		return singerDao.update(sid);
	}

	@Override
	public int delete(String sid) throws SQLException {
		ISingerDao singerDao=new SingerDaoImpl();
		if(StringUtil.isNull(sid)){
			return 0;
		}
		return singerDao.delete(sid);
	}
	

}
