package com.yc.wyyyy.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.Admin;
import com.yc.wyyyy.biz.IAdminBiz;
import com.yc.wyyyy.dao.IAdminDao;
import com.yc.wyyyy.dao.Impl.AdminDaoImpl;
import com.yc.wyyyy.util.MD5Encryption;
import com.yc.wyyyy.util.StringUtil;

public class AdminBizImpl implements IAdminBiz{

	@Override
	public int add(String aname, String pwd) throws SQLException {
		IAdminDao adminDao=new AdminDaoImpl();
		if(StringUtil.isNull(aname,pwd)){
			return 0;
		}
		//加密密码
		pwd=MD5Encryption.createPassword(pwd);
		return adminDao.add(aname, pwd);
		
	}

	@Override
	public Map<String, Object> find(Integer pageNo, Integer pageSize) {
		IAdminDao adminDao=new AdminDaoImpl();
		List<Admin> list=adminDao.find(pageNo, pageSize);
		int total=adminDao.total();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("rows",list);
		return map;
	}

	@Override
	public int update(String pwd, String oldPwd, String aid) throws SQLException {
		if(StringUtil.isNull(pwd,oldPwd)){
			return 0;
		}
		pwd=MD5Encryption.createPassword(pwd);
		oldPwd=MD5Encryption.createPassword(oldPwd);
		IAdminDao adminDao=new AdminDaoImpl();
		return adminDao.update(pwd, oldPwd, aid);
	}

	@Override
	public int delete(String aid) throws SQLException {
		if(StringUtil.isNull(aid)){
			return 0;
		}
		IAdminDao adminDao=new AdminDaoImpl();
		return adminDao.delete(aid);
	}

	@Override
	public Admin login(String aname, String pwd) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		if(StringUtil.isNull(aname,pwd)){
			return null;
		}
		IAdminDao adminDao=new AdminDaoImpl();
		pwd=MD5Encryption.createPassword(pwd);
		return adminDao.login(aname, pwd);
		
	}

}
