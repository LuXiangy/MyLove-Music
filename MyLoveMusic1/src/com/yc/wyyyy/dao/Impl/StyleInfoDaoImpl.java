package com.yc.wyyyy.dao.Impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.wyyyy.bean.Song;
import com.yc.wyyyy.bean.StyleInfo;
import com.yc.wyyyy.dao.DBHelper;
import com.yc.wyyyy.dao.IStyleInfoDao;
import com.yc.wyyyy.util.StringUtil;

public class StyleInfoDaoImpl implements IStyleInfoDao{

	@Override
	public int add(String sname, String flag,String mark) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="insert into styleInfo(sname,flag,mark,status) values(?,?,?,1)";
		List<Object> params = new ArrayList<Object>();
		params.add(sname);
		params.add(flag);
		params.add(mark);
		return db.update(sql, params);
	}

	@Override
	public List<StyleInfo> find(Integer pageNo, Integer pageSize) {
		DBHelper db=new DBHelper();
		String sql="select sid,sname,flag,mark,status from styleInfo where status!=0 order by sid limit ?,?";
		List<Object> params = new ArrayList<Object>();
		params.add((pageNo-1)*pageSize);
		params.add(pageSize);
		return db.select(sql, params);
	}
	public List<StyleInfo> find(String stid,String sid){
		DBHelper db=new DBHelper();
		String sql="select * from styleInfo where status!=0";
		List<Object> params=new ArrayList<Object>();
		if(!StringUtil.isNull(stid)&&stid!=""){
			sql+=" and flag=?";
			params.add(stid);
		}
		if(!StringUtil.isNull(sid)&&sid!=""){
			sql+=" and sid=?";
			params.add(sid);
		}
		return db.select(sql, params);
	}
	@Override
	public int total() {
		DBHelper db=new DBHelper();
		String sql="select count(sid) total from styleInfo where status!=0";
		return db.findDouble(sql, null);
	}

	@Override
	public int update(String sname, String flag, String sid,String mark) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="update styleInfo set sname=?,flag=?,mark=? where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(sname);
		params.add(flag);
		params.add(mark);
		params.add(sid);
		return db.update(sql,params);
	}

	@Override
	public int delete(String sid) throws SQLException {
		DBHelper db=new DBHelper();
		String sql;
		if(sid.contains(",") && !sid.contains("or")){
			sql="update styleInfo set status=0 where sid in("+sid+")";
			return db.update(sql,null);
		}else{
			sql="update styleInfo set status=0 where sid=?";
			List<Object> params = new ArrayList<Object>();
			params.add(sid);
			return db.update(sql, params);
		}
	}

	@Override
	public List<StyleInfo> find() throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db = new DBHelper();
		String sql = "select DISTINCT sname from styleinfo where status!=0";
		return db.select(sql, null,StyleInfo.class);
	}

}
