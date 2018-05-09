package com.yc.wyyyy.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.yc.wyyyy.bean.SongSheet;
import com.yc.wyyyy.bean.UserInfo;
import com.yc.wyyyy.biz.ISongSheetBiz;
import com.yc.wyyyy.biz.IUserInfoBiz;
import com.yc.wyyyy.biz.impl.SongSheetBizImpl;
import com.yc.wyyyy.biz.impl.UserInfoBizImpl;
import com.yc.wyyyy.dao.MyProperties;
import com.yc.wyyyy.util.FileUploadUtil;
import com.yc.wyyyy.util.Send;
import com.yc.wyyyy.util.SendSmsUtil;
import com.yc.wyyyy.util.StringUtil;

@WebServlet("/userInfoServlet")
public class UserInfoServlet extends BasicServlet {

	private static final long serialVersionUID = 1L;
	private String sms_apiid = MyProperties.getInstance().getProperty(
			"sms_apiid");
	private String sms_apikey = MyProperties.getInstance().getProperty(
			"sms_apikey");

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String op = req.getParameter("op");
		if ("find".equals(op)) {
			find(req, resp);
		} else if ("addUser".equals(op)) {
			try {
				addUser(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("updateUser".equals(op)) {
			try {
				updateUser(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("delUser".equals(op)) {
			try {
				delUser(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("userLogin".equals(op)) {
			try {
				userLogin(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("addIntegral".equals(op)) {
			try {
				addIntegral(req, resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("sendMessage".equals(op)) {
			try {
				sendMessage(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("exit".equals(op)) {
			exit(req, resp);
		} else if ("findById".equals(op)) {
			try {
				findById(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("addFollow".equals(op)) {
			try {
				addFollow(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("CollectSS".equals(op)) {
			try {
				CollectSS(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("deletecollect".equals(op)) {
			try {
				deletecollect(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("cancelFollow".equals(op)) {
			try {
				cancelFollow(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("ensure".equals(op)) {
			ensureOp(req, resp);
		} else if ("telReg".equals(op)) {
			try {
				telRegOp(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("identify".equals(op)) {
			try {
				identifyOp(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("findPwd".equals(op)) {
			try {
				findPwd(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void findPwd(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException {
		String sendAgain = req.getParameter("sendAgain");
		String tel = req.getParameter("tel");
		String pwd = req.getParameter("pwd");
		int code = (Integer) session.getAttribute("pgnewCode");
		String smsCode = code + "";
		if (sendAgain.equals(smsCode)) {
			IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
			int result = userInfoBiz.update(tel, pwd);
			this.out(resp,result);
		} else {
			this.out(resp, 0);
		}
	}

	private void identifyOp(HttpServletRequest req, HttpServletResponse resp)
			throws NumberFormatException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		String tel = req.getParameter("tel");
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		UserInfo user = userInfoBiz.select(tel);
		if (user == null || "".equals(user)) {
			this.out(resp, -1);
		} else {
			this.out(resp, 0);
			SendSmsUtil ssu = new SendSmsUtil();
			int mobile_code = ssu.sendMessage(sms_apiid, sms_apikey, tel);
			System.out.println(mobile_code);
			session.setAttribute("pgnewCode", mobile_code);
			try {
				this.out(resp, mobile_code);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void telRegOp(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException {
		String tel = req.getParameter("tel");
		String pwd = req.getParameter("pwd");
		String uname = req.getParameter("uname");
		UserInfo userinfo = new UserInfo();
		userinfo.setTel(tel);
		userinfo.setUname(uname);
		userinfo.setPwd(pwd);
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		int result = userInfoBiz.reg(userinfo);
		this.out(resp, result);
	}

	private void ensureOp(HttpServletRequest req, HttpServletResponse resp) {
		String code = req.getParameter("sendAgain");
		int msmcode = (Integer) session.getAttribute("newCode");
		System.out.println(msmcode);
		String msmCode = msmcode + "";
		if (code.equals(msmCode)) {
			this.out(resp, 2);
		} else {
			this.out(resp, 0);
		}

	}

	private void cancelFollow(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		String usid = req.getParameter("usid");
		String sid = req.getParameter("sid");
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		UserInfo userInfo = userInfoBiz.find(usid);
		String follow = "";
		if (userInfo.getFollow() != null && !userInfo.getFollow().equals("")) {
			String singer[] = userInfo.getFollow().split(",");
			for (int i = 0; i < singer.length; i++) {
				if (singer[i] == sid || singer[i].equals(sid)) {
					singer[i] = "";
				} else {
					follow += singer[i] + ",";
				}
			}
			userInfo.setFollow("" + (singer.length - 1));
		}
		HttpSession session = req.getSession();
		session.setAttribute("currentLogin", userInfo);
		int result = userInfoBiz.cancelFollow(follow, usid);
		this.out(resp, result);
	}

	private void deletecollect(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		String usid = req.getParameter("usid");
		String sid = req.getParameter("ssid");
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		UserInfo userInfo = userInfoBiz.find(usid);
		String newSongSheet = "";
		if (userInfo.getSongSheet() != null
				&& !userInfo.getSongSheet().equals("")) {
			String ss[] = userInfo.getSongSheet().split(",");
			for (int i = 0; i < ss.length; i++) {
				if (ss[i] == sid || ss[i].equals(sid)) {
					ss[i] = "";
				} else {
					newSongSheet += ss[i] + ",";
				}
			}

		}
		int result = userInfoBiz.deleteSongSheet(newSongSheet, usid);
		if (result > 0) {
			this.out(resp, 1);
		} else {
			this.out(resp, 0);
		}
	}

	private void CollectSS(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		String sid = req.getParameter("sid");
		String usid = req.getParameter("usid");
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		UserInfo userInfo = userInfoBiz.find(usid);
		int flag = 0;
		if (userInfo.getSongSheet() != null
				&& !userInfo.getSongSheet().equals("")) {
			String ss[] = userInfo.getSongSheet().split(",");
			for (int i = 0; i < ss.length; i++) {
				if (ss[i] == sid || ss[i].equals(sid)) {
					flag = 1;
				}
			}
		}
		if (flag == 1) {
			this.out(resp, 1);
		} else if (flag == 0) {
			int result = userInfoBiz.changeSongSheet(sid, usid);
			if (result > 0) {
				this.out(resp, 2);
			}
		}
	}

	private void addFollow(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		String usid = req.getParameter("usid");
		String follow = req.getParameter("follow");
		this.out(resp, userInfoBiz.addFollow(follow, usid));
		HttpSession session = req.getSession();
		UserInfo userinfo = userInfoBiz.find(usid);
		if (userinfo.getFollow() != null) {
			String s[] = userinfo.getFollow().split(",");
			userinfo.setFollow("" + (s.length));
		} else {
			userinfo.setFollow("0");
		}
		session.setAttribute("currentLogin", userinfo);
	}

	private void findById(HttpServletRequest req, HttpServletResponse resp)
			throws InstantiationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		String usid = req.getParameter("usid");
		this.out(resp, userInfoBiz.find(usid));

	}

	private void exit(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		session.setAttribute("currentLogin", null);
	}

	private void sendMessage(HttpServletRequest req, HttpServletResponse resp)
			throws NumberFormatException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		String tel = req.getParameter("tel");
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		UserInfo user = userInfoBiz.select(tel);
		if (user == null || "".equals(user)) {
			SendSmsUtil ssu = new SendSmsUtil();
			int mobile_code = ssu.sendMessage(sms_apiid, sms_apikey, tel);
			session.setAttribute("newCode", mobile_code);
			try {
				this.out(resp, mobile_code);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.out(resp, 0);
		}
	}

	private void addIntegral(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		String usid = req.getParameter("usid");
		this.out(resp, userInfoBiz.addIntegral(usid));

	}

	private void userLogin(HttpServletRequest req, HttpServletResponse resp)
			throws NumberFormatException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		String tel = req.getParameter("tel");
		String pwd = req.getParameter("pwd");
		HttpSession session = req.getSession();
		UserInfo userinfo = userInfoBiz.login(tel, pwd);
		System.out.println(userinfo);
		if (userinfo != null ||"".equals(userinfo)) {
			ISongSheetBiz songSheetBiz = new SongSheetBizImpl();
			List<SongSheet> songsheet = songSheetBiz.find(userinfo.getUsid()
					.toString());
			int sheetsize = songSheetBiz.total("" + userinfo.getUsid());
			session.setAttribute("currentSongSheetSize", sheetsize);
			session.setAttribute("currentSongSheet", songsheet);
			String s[] = userinfo.getFollow().split(",");
			userinfo.setFollow("" + s.length);
			session.setAttribute("currentLogin", userinfo);
		}else{
			userinfo = new UserInfo();
			userinfo.setFollow("0");
		}
		this.out(resp, userinfo);
	}

	private void delUser(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		String usid = req.getParameter("usid");
		this.out(resp, userInfoBiz.delete(usid));

	}

	private void updateUser(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		FileUploadUtil fileUploadUtil = new FileUploadUtil();
		PageContext pageContext = JspFactory.getDefaultFactory()
				.getPageContext(this, req, resp, null, true, 1024, true);
		UserInfo user = null;
		try {
			user = fileUploadUtil.uploadToObject(pageContext, UserInfo.class);

			if (StringUtil.isNull(user.getPhoto())) {// 说明用户没有修改图片，那么则有可能删除了以前的图片也可能没删

				user.setPhoto(user.getEmail());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.out(resp, userInfoBiz.update(user));
		if (userInfoBiz.update(user) > 0) {
			HttpSession session = req.getSession();
			UserInfo userinfo = userInfoBiz.find(user.getUsid());
			if (userinfo.getFollow() != null) {
				String s[] = userinfo.getFollow().split(",");
				userinfo.setFollow("" + s.length);
			} else {
				userinfo.setFollow("0");
			}
			session.setAttribute("currentLogin", userinfo);
		}
	}

	private void addUser(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, NumberFormatException, InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		String tel = req.getParameter("tel");
		String pwd = req.getParameter("pwd");
		String uname = req.getParameter("uname");
		int add = userInfoBiz.add(tel, pwd, uname);
		this.out(resp, add);

	}

	private void find(HttpServletRequest req, HttpServletResponse resp) {
		IUserInfoBiz userInfoBiz = new UserInfoBizImpl();
		Integer pageNo = Integer.parseInt(req.getParameter("page"));
		Integer pageSize = Integer.parseInt(req.getParameter("rows"));
		Map<String, Object> map = userInfoBiz.find(pageNo, pageSize);
		this.out(resp, map);

	}

}
