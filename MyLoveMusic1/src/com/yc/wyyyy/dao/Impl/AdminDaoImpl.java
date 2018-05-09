package com.yc.wyyyy.dao.Impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.wyyyy.bean.Admin;
import com.yc.wyyyy.dao.DBHelper;
import com.yc.wyyyy.dao.IAdminDao;

public class AdminDaoImpl implements IAdminDao{
	private DBHelper db=new DBHelper();
	@Override
	public int add(String aname, String pwd) throws SQLException {
		String sql="insert into  admin(aname,pwd,status) values(?,?,1)";
		List<Object> params =new ArrayList<Object> ();
		params.add(aname);
		params.add(pwd);
		return db.update(sql, params);
	}

	@Override
	public List<Admin> find(Integer pageNo, Integer pageSize) {

		String sql="select aid,aname,pwd from admin where status!=0 order by aid limit ?,?";
		int start = (pageNo-1)*pageSize;
		List<Object> params =new ArrayList<Object> ();
		params.add(start);
		params.add(pageSize);
		return db.select(sql, params);
	}

	@Override
	public int total() {
		
		String sql="select count(aid) total from admin where status!=0";
		return db.findDouble(sql, null);
	}

	

	@Override
	public int update(String pwd,String oldPwd,String aid) throws SQLException {
		
		String sql="update admin set pwd=? where aid=? and pwd=?";
		List<Object> params =new ArrayList<Object> ();
		params.add(pwd);
		params.add(aid);
		params.add(oldPwd);
		return db.update(sql,params);
	}
	
	@Override
	public int delete(String aid) throws SQLException {
		
		String sql;
		if(aid.contains(",")&& !aid.contains("or")){//说明是同时删除多个
			sql="update admin set status=0 where aid in("+aid+")";
			return db.update(sql,null);
		}else{
			sql="update admin set status=0 where aid=?";
			List<Object> params =new ArrayList<Object> ();
			params.add(aid);
			return db.update(sql, params);
		}
	}
	@Override
	public Admin login(String aname,String pwd) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		String sql="select * from admin where aname=? and pwd=? and status!=0";
		List<Object> params =new ArrayList<Object> ();
		params.add(aname);
		params.add(pwd);
		List<Admin> list=db.find(sql,Admin.class, params);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

}
