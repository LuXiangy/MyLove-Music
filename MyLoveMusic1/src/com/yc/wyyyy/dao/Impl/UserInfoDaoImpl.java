package com.yc.wyyyy.dao.Impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.wyyyy.bean.UserInfo;
import com.yc.wyyyy.dao.DBHelper;
import com.yc.wyyyy.dao.IUserInfoDao;
import com.yc.wyyyy.util.MD5Encryption;

public class UserInfoDaoImpl implements IUserInfoDao{

	@Override
	public int add(String tel, String pwd,String uname) throws SQLException, NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db=new DBHelper();
		String sql="insert into userInfo(uname,email,tel,pwd,integral,photo,sex,birth,province,city,follow,songSheet,status,mark) values(?,'',?,?,0,'../fileUploadPath/1511015866981_4158.jpg','女','','','','','',1,'')";
		List<Object> params = new ArrayList<Object>();
		params.add(uname);
		params.add(tel);
		params.add(pwd);
		int result=db.update(sql, params);
		if(result>0){
			String sql3 = "select usid from userInfo where tel=?";
			List<Object> list = new ArrayList<Object>();
			list.add(tel);
			List<UserInfo> usids = db.find(sql3,UserInfo.class, list);
			if(usids.size()>0){
				UserInfo userInfo = usids.get(0);
				String sql2="insert into songSheet(ssname,usid,song,languages,style,scene,emotion,theme,clickRate,photo,status) values('默认歌单',?,'../fileUploadPath/1511018548606_4921.jpg',0,0,0,0,0,0,'',1)";
				List<Object> param = new ArrayList<Object>();
				param.add(userInfo.getUsid());
				return db.update(sql2, param);
			}
		}
			return 0;
	}
	public int changeSongSheet(String songSheet,String usid) throws SQLException{
		DBHelper db=new DBHelper();
		String sql="update userInfo set songSheet=songSheet||? where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(songSheet);
		params.add(usid);
		return db.update(sql, params);
		
	}
	public int deleteSongSheet(String songSheet,String usid) throws SQLException{
		DBHelper db=new DBHelper();
		String sql="update userInfo set songSheet=? where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(songSheet);
		params.add(usid);
		return db.update(sql, params);
	}
	@Override
	public List<UserInfo> find(Integer pageNo, Integer pageSize) {
		DBHelper db=new DBHelper();
		int start = (pageNo-1)*pageSize;
		String sql="select * from userInfo where status!=0 order by usid limit ?,?";
		List<Object> params = new ArrayList<Object>();
		params.add(start);
		params.add(pageSize);
		return db.select(sql, params);
	}

	@Override
	public int total() {
		DBHelper db=new DBHelper();
		String sql="select count(usid) total from userInfo where status!=0";
		return db.findDouble(sql, null);
	}

	@Override
	public int update(UserInfo user) throws SQLException {
		DBHelper db=new DBHelper();
		String sql="update userInfo set uname=?,photo=?,sex=?,birth=?,province=?,city=?,mark=? where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(user.getUname());
		params.add(user.getPhoto());
		params.add(user.getSex());
		params.add(user.getBirth());
		params.add(user.getProvince());
		params.add(user.getCity());
		params.add(user.getMark());
		params.add(user.getUsid());
		return db.update(sql, params);
	}

	@Override
	public int delete(String usid) throws SQLException {
		DBHelper db=new DBHelper();
		String sql;
		if(usid.contains(",")&& !usid.contains("or")){//说明是同时删除多个
			sql="update userInfo set status=0 where usid in("+usid+")";
			return db.update(sql,null);
		}else{
			sql="update userInfo set status=0 where usid=?";
			List<Object> params = new ArrayList<Object>();
			params.add(usid);
			return db.update(sql, params);
		}
	}

	@Override
	public UserInfo login(String tel, String pwd) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db=new DBHelper();
		String sql="select *from userInfo where tel=? and pwd=? and status!=0";
		List<UserInfo> list=db.find(sql,UserInfo.class, tel	,pwd);
		System.out.println("查得到的结果为："+list);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{ 
			return null;
		}
	}
	public UserInfo find(Integer usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		DBHelper db=new DBHelper();
		String sql="select *from userInfo where usid=? and status!=0";
		List<Object> params = new ArrayList<Object>();
		params.add(usid);
		List<UserInfo> list=db.select(sql, params,UserInfo.class);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	public UserInfo find(String usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		DBHelper db=new DBHelper();
		String sql="select *from userInfo where usid=? and status!=0";
		List<Object> params = new ArrayList<Object>();
		params.add(usid);
		List<UserInfo> list=db.select(sql, params,UserInfo.class);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	public int addIntegral(String usid) throws SQLException{
		DBHelper db=new DBHelper();
		String sql="update userInfo set integral=integral+2 where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(usid);
		return db.update(sql, params);
	}
	public int addFollow(String follow,String usid) throws SQLException{
		DBHelper db=new DBHelper();
		String sql="update userInfo set follow=follow||? where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(follow);
		params.add(usid);
		return db.update(sql,params);
	}
	
	public int cancelFollow(String follow,String usid) throws SQLException{
		DBHelper db=new DBHelper();
		String sql="update userInfo set follow=? where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(follow);
		params.add(usid);
		return db.update(sql,params);
	}
	@Override
	public UserInfo select(String tel) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		DBHelper db=new DBHelper();
		String sql = "select * from userInfo where tel = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(tel);
		List<UserInfo> list =db.find(sql, UserInfo.class, params);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}
	@Override
	public int reg(UserInfo userInfo) throws SQLException {
		DBHelper db=new DBHelper();
		String sql = "insert into userInfo(uname,email,tel,pwd,integral,photo,sex,birth,province,city,follow,songSheet,status,mark) values(?,'',?,?,0,'../fileUploadPath/1511590350471_6381.jpg','女','','','','','',1,'')";
		List<Object> params = new ArrayList<Object>();
		params.add(userInfo.getUname());
		params.add(userInfo.getTel());
		params.add(MD5Encryption.createPassword(userInfo.getPwd()));
		return db.update(sql, params);
	}
	@Override
	public int update(String tel, String pwd) throws SQLException {
		DBHelper db=new DBHelper();
		String sql = "update userInfo set pwd = ? where tel = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(pwd);
		params.add(tel);
		return db.update(sql, params);
	}
}
