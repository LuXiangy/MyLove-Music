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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yc.wyyyy.bean.StyleInfo;
import com.yc.wyyyy.biz.IStyleInfoBiz;
import com.yc.wyyyy.biz.impl.StyleInfoBizImpl;

@WebServlet("/styleInfoServlet")
public class StyleInfoServlet extends BasicServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String op=req.getParameter("op");
		if("find".equals(op)){
			find(req,resp);
		}else if("findstyleName".equals(op)){
			try {
				findAllStyleName(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("addStyleInfo".equals(op)){
			try {
				addStyleInfo(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("delStyleInfo".equals(op)){
			try {
				delStyleInfo(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("updateStyleInfo".equals(op)){
			try {
				updateStyleInfo(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("findAll".equals(op)){
			findAll(req,resp);
		}else if("findById".equals(op)){
			findById(req,resp);
		}
	}

	private void findAllStyleName(HttpServletRequest req, HttpServletResponse resp) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		IStyleInfoBiz styleInfoBiz=new StyleInfoBizImpl();
		List<StyleInfo> styleInfos =styleInfoBiz.find();
		 //Map<String, List<Object>> map=(Map<String, List<Object>>) new HashMap<String, List<Object>();
		//List  list=new ArrayList<>();
		Gson gson = new GsonBuilder().create();
		this.out(resp, gson.toJson(styleInfos));
		
	}

	private void findById(HttpServletRequest req, HttpServletResponse resp) {
		IStyleInfoBiz styleInfoBiz=new StyleInfoBizImpl();
		String sid=req.getParameter("sid");
		this.out(resp, styleInfoBiz.find(null,sid));
		
	}

	private void findAll(HttpServletRequest req, HttpServletResponse resp) {
		IStyleInfoBiz styleInfoBiz=new StyleInfoBizImpl();
		List<StyleInfo> list = styleInfoBiz.find(null,"");
		this.out(resp,list);
		
	}

	private void updateStyleInfo(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		IStyleInfoBiz styleInfoBiz=new StyleInfoBizImpl();
		String sname=req.getParameter("sname");
		String flag=req.getParameter("flag");
		String sid=req.getParameter("sid");
		String mark = req.getParameter("mark");
		this.out(resp, styleInfoBiz.update(sname, flag, sid,mark));
		
	}

	private void delStyleInfo(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		IStyleInfoBiz styleInfoBiz=new StyleInfoBizImpl();
		String sid=req.getParameter("sid");
	
		this.out(resp, styleInfoBiz.delete(sid));
		
	}

	private void addStyleInfo(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		IStyleInfoBiz styleInfoBiz=new StyleInfoBizImpl();
		String sname=req.getParameter("sname");
		String flag=req.getParameter("flag");
		String mark=req.getParameter("mark");
		this.out(resp, styleInfoBiz.add(sname, flag,mark));
		
	}

	private void find(HttpServletRequest req, HttpServletResponse resp) {
		IStyleInfoBiz styleInfoBiz=new StyleInfoBizImpl();

		Integer pageNo=Integer.parseInt(req.getParameter("page"));
		Integer pageSize=Integer.parseInt(req.getParameter("rows"));
		
		Map<String,Object> map=styleInfoBiz.find(pageNo, pageSize);
		this.out(resp, map);
	}

}
