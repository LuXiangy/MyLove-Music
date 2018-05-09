package com.yc.wyyyy.dao.Impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.yc.wyyyy.bean.Singer;
import com.yc.wyyyy.dao.DBHelper;
import com.yc.wyyyy.dao.ISingerDao;

public class SingerDaoImpl implements ISingerDao{

	@Override
	public int add(Singer singer) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="insert into singer(sname,stid,photo,clickRate,status) values(?,?,?,0,1)";
		List<Object> params = new ArrayList<Object>();
		params.add(singer.getSname());
		params.add(singer.getStid());
		params.add(singer.getPhoto());
		return db.update(sql, params);
	}
	public List<Singer> find(){
		DBHelper db=new DBHelper();
		String sql="select s.sid sid,s.sname sname,s.stid stid,t.sname stname,s.photo photo from singer s join singerType t on s.stid=t.sid where s.status!=0 order by s.sid";
		return db.select(sql, null);
	}
	public Singer findById(String sid,String sname) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		DBHelper db=new DBHelper();
		String sql="select * from singer  where status!=0 ";
		List<Object> params = new ArrayList<Object>();
		if(sid!=null&&!"".equals(sid)){
			sql+=" and sid=?";
			params.add(sid);
		}
		if(sname!=null&&!"".equals(sname)){
			sql+=" and sname=?";
			params.add(sname);
		}
		List<Singer> list= db.select(sql, params,Singer.class);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	public List<Singer> findByClick(){
		DBHelper db=new DBHelper();
		String sql="select s.sid sid,s.sname sname,s.stid stid,t.sname stname,s.photo photo from singer s join singerType t on s.stid=t.sid where s.status!=0 order by s.clickRate desc";
		return db.select(sql, null);
	}

	@Override
	public List<Singer> find(Map<String,String> map,Integer pageNo, Integer pageSize) {
		DBHelper db=new DBHelper();
		//map.put("sname like","%张%"); map.put("stid=","10")
//		  select * from singer where status!=0 order by sid limit 0,5;
		String sql="select * from singer where status!=0 ";
		List<Object> params=new ArrayList<Object>();
		if(map!=null && map.size()>0){//说明要做条件查询
			Set<String> keys=map.keySet();
			for(String key:keys){
				sql+=" and "+key+"?";//sql+=" where status!=0 and sname like ? and stid=?"
				params.add(map.get(key));
			}
		}
		sql+=" order by sid limit ?,?";
		params.add((pageNo-1)*pageSize);
		params.add(pageSize);
		return db.select(sql, params);
	}

	@Override
	public int total(Map<String,String> map) {
		DBHelper db=new DBHelper();
		String sql="select count(sid) from singer where status!=0";
		List<Object> params=new ArrayList<Object>();
		if(map!=null && map.size()>0){
			Set<String> keys=map.keySet();
			for(String key:keys){
				sql+=" and "+key+" ?";//sql+=" where status!=0 and sname like ? and stid=?"
				params.add(map.get(key));
			}
		}
		return db.findDouble(sql, params);
	}

	@Override
	public int update(Singer singer) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="update singer set sname=?,photo=?,stid=? where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(singer.getSname());
		params.add(singer.getPhoto());
		params.add(singer.getStid());
		params.add(singer.getSid());
		return db.update(sql, params);
	}

	public int update(String sid) throws SQLException{
		DBHelper db=new DBHelper();
		String sql="update singer set clickRate=clickRate+1 where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(sid);
		return db.update(sql, params);
	}
	@Override
	public int delete(String sid) throws SQLException {
		DBHelper db=new DBHelper();
		String 	sql="update singer set status=0 where sid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(sid);
		return db.update(sql, params);

	}

}
