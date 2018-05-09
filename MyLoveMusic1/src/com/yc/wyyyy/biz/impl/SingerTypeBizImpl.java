package com.yc.wyyyy.biz.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.SingerType;
import com.yc.wyyyy.biz.ISingerTypeBiz;
import com.yc.wyyyy.dao.ISingerTypeDao;
import com.yc.wyyyy.dao.Impl.SingerTypeDaoImpl;
import com.yc.wyyyy.util.StringUtil;

public class SingerTypeBizImpl implements ISingerTypeBiz{

	@Override
	public int add(String sname) throws SQLException {
		ISingerTypeDao singerTypeDao=new SingerTypeDaoImpl();
		if(StringUtil.isNull(sname)){
			return 0;
		}
		return singerTypeDao.add(sname);
	}

	@Override
	public Map<String, Object> find(Integer pageNo, Integer pageSize) {
		ISingerTypeDao singerTypeDao=new SingerTypeDaoImpl();
		List<SingerType> list=singerTypeDao.find(pageNo, pageSize);
		int total=singerTypeDao.total();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("rows",list);
		return map;
	}

	public List<SingerType> find(){
		ISingerTypeDao singerTypeDao=new SingerTypeDaoImpl();
		return singerTypeDao.find();
	}
	@Override
	public int update(String sname, String sid) throws SQLException {
		if(StringUtil.isNull(sname,sid)){
			return 0;
		}
		ISingerTypeDao singerTypeDao=new SingerTypeDaoImpl();
		
		return singerTypeDao.update(sname, sid);
	}

	@Override
	public int delete(String sid) throws SQLException {
		if(StringUtil.isNull(sid)){
			return 0;
		}
		ISingerTypeDao singerTypeDao=new SingerTypeDaoImpl();
		
		return singerTypeDao.delete(sid);
	
	}

}
