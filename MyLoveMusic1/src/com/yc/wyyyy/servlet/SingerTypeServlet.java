package com.yc.wyyyy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.wyyyy.biz.ISingerTypeBiz;
import com.yc.wyyyy.biz.impl.SingerTypeBizImpl;

@WebServlet("/singerTypeServlet")
public class SingerTypeServlet extends BasicServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String op=req.getParameter("op");
		if("find".equals(op)){
			find(req,resp);
		}else if("addSingerType".equals(op)){
			try {
				addSingerType(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("delSingerType".equals(op)){
			try {
				delSingerType(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("updateSingerType".equals(op)){
			try {
				updateSingerType(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("findAll".equals(op)){
			findAll(req,resp);
		}
	}

	private void findAll(HttpServletRequest req, HttpServletResponse resp) {
		ISingerTypeBiz singerTypeBiz=new SingerTypeBizImpl();
		this.out(resp, singerTypeBiz.find());
		
	}

	private void updateSingerType(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISingerTypeBiz singerTypeBiz=new SingerTypeBizImpl();
		String sname=req.getParameter("sname");
		String sid=req.getParameter("sid");
		this.out(resp, singerTypeBiz.update(sname, sid));
		
	}

	private void delSingerType(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISingerTypeBiz singerTypeBiz=new SingerTypeBizImpl();
		String sid=req.getParameter("sid");
		this.out(resp, singerTypeBiz.delete(sid));
		
	}

	private void addSingerType(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISingerTypeBiz singerTypeBiz=new SingerTypeBizImpl();
		String sname=req.getParameter("sname");
		this.out(resp, singerTypeBiz.add(sname));
		
	}

	private void find(HttpServletRequest req, HttpServletResponse resp) {
		ISingerTypeBiz singerTypeBiz=new SingerTypeBizImpl();
		
		Integer pageNo=Integer.parseInt(req.getParameter("page"));
		Integer pageSize=Integer.parseInt(req.getParameter("rows"));
		
		Map<String,Object> map=singerTypeBiz.find(pageNo, pageSize);
		this.out(resp, map);
		
		
	}
}
