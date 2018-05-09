package com.yc.wyyyy.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.wyyyy.bean.Admin;
import com.yc.wyyyy.biz.IAdminBiz;
import com.yc.wyyyy.biz.impl.AdminBizImpl;

@WebServlet("/adminServlet")
public class AdminServlet extends BasicServlet {

	private static final long serialVersionUID = -9057427278430050975L;
	IAdminBiz adminBiz = new AdminBizImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String op = req.getParameter("op");
		if ("find".equals(op)) {
			find(req, resp);
		} else if ("addAdmin".equals(op)) {
			try {
				addAdmin(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("delAdmin".equals(op)) {
			try {
				delAdmin(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("updateAdmin".equals(op)) {
			try {
				updateAdmin(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("adminLogin".equals(op)) {
			try {
				adminLogin(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}

	}

	private void adminLogin(HttpServletRequest req, HttpServletResponse resp) throws NumberFormatException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String aname = req.getParameter("aname");
		String pwd = req.getParameter("pwd");
		String valcode =req.getParameter("valcode");
		HttpSession session = req.getSession();
		// 判断验证码
		// 从session 中取出验证码
		String rand = (String) session.getAttribute("rand");
		if (rand.equals(valcode)){
			Admin admin = adminBiz.login(aname, pwd);
			session.setAttribute("admin", admin);
			this.out(resp,admin);
		}else{
			this.out(resp, null);
		}
		

	}

	private void updateAdmin(HttpServletRequest req, HttpServletResponse resp) throws SQLException {

		String aid = req.getParameter("aid");
		String pwd = req.getParameter("pwd");
		String oldPwd = req.getParameter("oldPwd");
		this.out(resp, adminBiz.update(pwd, oldPwd, aid));

	}

	private void delAdmin(HttpServletRequest req, HttpServletResponse resp) throws SQLException {

		String aid = req.getParameter("aid");

		this.out(resp, adminBiz.delete(aid));

	}

	private void addAdmin(HttpServletRequest req, HttpServletResponse resp) throws SQLException {

		String aname = req.getParameter("aname");
		String pwd = req.getParameter("pwd");
		int add = adminBiz.add(aname, pwd);
		this.out(resp, add);

	}

	private void find(HttpServletRequest req, HttpServletResponse resp) {
		Integer pageNo = Integer.parseInt(req.getParameter("page"));
		Integer pageSize = Integer.parseInt(req.getParameter("rows"));

		Map<String, Object> map = adminBiz.find(pageNo, pageSize);
		this.out(resp, map);
	}
}
