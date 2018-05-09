package com.yc.wyyyy.biz.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yc.wyyyy.bean.UserInfo;
import com.yc.wyyyy.biz.IUserInfoBiz;
import com.yc.wyyyy.dao.IUserInfoDao;
import com.yc.wyyyy.dao.Impl.UserInfoDaoImpl;
import com.yc.wyyyy.util.MD5Encryption;
import com.yc.wyyyy.util.StringUtil;

public class UserInfoBizImpl implements IUserInfoBiz {

	@Override
	public int add(String tel, String pwd, String uname) throws SQLException,
			NumberFormatException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		if (StringUtil.isNull(tel, pwd)) {
			return 0;
		}
		pwd = MD5Encryption.createPassword(pwd);
		return userInfoDao.add(tel, pwd, uname);

	}

	/*
	 * 收藏歌单
	 */
	public int changeSongSheet(String songSheet, String usid)
			throws SQLException {
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		if (StringUtil.isNull(songSheet)) {
			return 0;
		}
		songSheet = songSheet + ",";
		return userInfoDao.changeSongSheet(songSheet, usid);

	}

	public int deleteSongSheet(String songSheet, String usid)
			throws SQLException {
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		if (StringUtil.isNull(songSheet)) {
			return 0;
		}
		return userInfoDao.deleteSongSheet(songSheet, usid);
	}

	public UserInfo find(Integer usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		if (usid.equals("")) {
			return null;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.find(usid);
	}

	public UserInfo find(String usid) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		if (StringUtil.isNull(usid)) {
			return null;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.find(usid);
	}

	@Override
	public Map<String, Object> find(Integer pageNo, Integer pageSize) {
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		List<UserInfo> list = userInfoDao.find(pageNo, pageSize);
		int total = userInfoDao.total();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	@Override
	public int update(UserInfo user) throws SQLException {
		if (user.getUsid().equals("")) {
			return 0;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();

		return userInfoDao.update(user);
	}

	@Override
	public int delete(String usid) throws SQLException {
		if (StringUtil.isNull(usid)) {
			return 0;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.delete(usid);
	}

	@Override
	public UserInfo login(String tel, String pwd) throws NumberFormatException,
			InstantiationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		if (StringUtil.isNull(tel, pwd)) {
			return null;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		pwd = MD5Encryption.createPassword(pwd);
		return userInfoDao.login(tel, pwd);
	}

	@Override
	public int addIntegral(String usid) throws SQLException {
		if (StringUtil.isNull(usid)) {
			return 0;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.addIntegral(usid);
	}

	public int addFollow(String follow, String usid) throws SQLException {
		if (StringUtil.isNull(follow)) {
			return 0;
		}
		follow = follow + ",";
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.addFollow(follow, usid);
	}

	public int cancelFollow(String follow, String usid) throws SQLException {
		if (StringUtil.isNull(follow)) {
			return 0;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.cancelFollow(follow, usid);
	}

	@Override
	public UserInfo select(String tel) throws NumberFormatException,
			InstantiationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		if (StringUtil.isNull(tel)) {
			return null;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.select(tel);
	}

	@Override
	public int reg(UserInfo userinfo) throws SQLException {
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		return userInfoDao.reg(userinfo);
	}

	@Override
	public int update(String tel, String pwd) throws SQLException {
		if (StringUtil.isNull(tel, pwd)) {
			return 0;
		}
		IUserInfoDao userInfoDao = new UserInfoDaoImpl();
		pwd = MD5Encryption.createPassword(pwd);
		return userInfoDao.update(tel, pwd);
	}

}
