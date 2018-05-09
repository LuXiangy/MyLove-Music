package com.yc.wyyyy.dao.Impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.wyyyy.bean.SingerType;
import com.yc.wyyyy.dao.DBHelper;
import com.yc.wyyyy.dao.ISingerTypeDao;

public class SingerTypeDaoImpl implements ISingerTypeDao{

	@Override
	public int add(String sname) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="insert into singerType(sname,status) values(?,1)";
		List<Object> params = new ArrayList<Object>();
		params.add(sname);
		return db.update(sql, params);
	}

	@Override
	public List<SingerType> find(Integer pageNo, Integer pageSize) {
		DBHelper db=new DBHelper();
		String sql="select sid,sname from singerType where status!=0 order by sid limit ?,?";
		int start = (pageNo-1)*pageSize;
		List<Object> params = new ArrayList<Object>();
		params.add(start);
		params.add(pageSize);
		return db.select(sql, params);
	}

	public List<SingerType> find(){
		DBHelper db=new DBHelper();
		String sql="select sid,sname from singerType where status!=0 order by sid";
		return db.select(sql, null);
	}
	@Override
	public int total() {
		DBHelper db=new DBHelper();
		String sql="select count(sid) total from singerType where status!=0";
		return db.findDouble(sql, null);
	}

	@Override
	public int update(String sname, String sid) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="update singerType set sname=? where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(sname);
		params.add(sid);
		return db.update(sql, params);
	}

	@Override
	public int delete(String sid) throws SQLException {
		DBHelper db=new DBHelper();
		String sql;
		if(sid.contains(",") && !sid.contains("or")){
			sql="update singerType set status=0 where sid in("+sid+")";
			return db.update(sql,null);
		}else{
			sql="update singerType set status=0 where sid=?";
			List<Object> params = new ArrayList<Object>();
			params.add(sid);
			return db.update(sql, params);
		}
	}

}
