package com.yc.wyyyy.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yc.wyyyy.bean.Singer;
import com.yc.wyyyy.biz.ISingerBiz;
import com.yc.wyyyy.biz.impl.SingerBizImpl;
import com.yc.wyyyy.util.FileUploadUtil;
import com.yc.wyyyy.util.StringUtil;

@WebServlet("/singerServlet")
public class SingerServlet extends BasicServlet{
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
		}else if("addSinger".equals(op)){
			try {
				addSinger(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("delSinger".equals(op)){
			try {
				delSinger(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("updateSinger".equals(op)){
			try {
				updateSinger(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("search".equals(op)){
			search(req,resp);
		}else if("findAll".equals(op)){
			findAll(req,resp);
		}else if("addClick".equals(op)){
			try {
				addClick(req,resp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("findByclick".equals(op)){
			findByclick(req,resp);
		}else if("seeHome".equals(op)){
			try {
				seeHome(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if("HeadSearch".equals(op)){
			HeadSearch(req,resp);
		}else if("findById".equals(op)){
			try {
				findById(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}

	 
	private void seeHome(HttpServletRequest req, HttpServletResponse resp) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISingerBiz singerBiz=new SingerBizImpl();
		String sid=req.getParameter("sid");
		HttpSession session =req.getSession();
		session.setAttribute("singerHome", singerBiz.findById(sid,null));
		this.out(resp, 1);
		
	}
	private void findById(HttpServletRequest req, HttpServletResponse resp) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ISingerBiz singerBiz=new SingerBizImpl();
		String sid=req.getParameter("sid");
		this.out(resp, singerBiz.findById(sid,null));
		
	}
	private void findByclick(HttpServletRequest req, HttpServletResponse resp) {
		ISingerBiz singerBiz=new SingerBizImpl();
		Gson gson= new GsonBuilder().create();
		List<Singer> singers=singerBiz.findByClick();
		this.out(resp,gson.toJson(singers) );
		
	}
	private void addClick(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISingerBiz singerBiz=new SingerBizImpl();
		String sid=req.getParameter("sid");
		singerBiz.update(sid);
		
	}
	private void findAll(HttpServletRequest req, HttpServletResponse resp) {
		ISingerBiz singerBiz=new SingerBizImpl();
		Gson gson= new GsonBuilder().create();
		List<Singer> singers=singerBiz.find();
		
		this.out(resp,gson.toJson(singers) );
		
	}
	private void search(HttpServletRequest req, HttpServletResponse resp) {
		String stid=req.getParameter("stid");
		String sname=req.getParameter("sname");
		Integer pageNo=Integer.parseInt(req.getParameter("page"));
		Integer pageSize=Integer.parseInt(req.getParameter("rows"));
		ISingerBiz singerBiz=new SingerBizImpl();
		this.out(resp, singerBiz.find(sname, stid, pageNo, pageSize));
		
	}
	private void HeadSearch(HttpServletRequest req, HttpServletResponse resp) {
		String stid=req.getParameter("stid");
		String sname=req.getParameter("sname");
		
		ISingerBiz singerBiz=new SingerBizImpl();
		Gson gson= new GsonBuilder().create();
		
		this.out(resp, gson.toJson(singerBiz.find(sname, stid, 1, 50)));
		
		
	}
	private void updateSinger(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISingerBiz singerBiz=new SingerBizImpl();
		FileUploadUtil fileUploadUtil=new FileUploadUtil();
		PageContext pageContext=JspFactory.getDefaultFactory().getPageContext(this, req, resp, null, true, 1024, true);
		Singer singer=null;
		try {
			singer=fileUploadUtil.uploadToObjectAndSetWaterImage(pageContext, Singer.class);
			
			if(StringUtil.isNull(singer.getPhoto())){//说明用户没有修改图片，那么则有可能删除了以前的图片也可能没删
				if(StringUtil.isNull(singer.getStname())){//说明已经删除了原来的图片
					singer.setPhoto("");
				}else{
					singer.setPhoto(singer.getStname());
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.out(resp, singerBiz.update(singer));
		
	}

	private void delSinger(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISingerBiz singerBiz=new SingerBizImpl();
		String sid=req.getParameter("sid");
		this.out(resp, singerBiz.delete(sid));
		
	}

	private void addSinger(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		ISingerBiz singerBiz=new SingerBizImpl();
		FileUploadUtil fileUploadUtil=new FileUploadUtil();
		PageContext pageContext=JspFactory.getDefaultFactory().getPageContext(this, req, resp, null, true, 1024, true);
		Singer singer=null;
		try {
			singer=fileUploadUtil.uploadToObjectAndSetWaterImage(pageContext, Singer.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.out(resp, singerBiz.add(singer));
	}

	private void find(HttpServletRequest req, HttpServletResponse resp) {
		Integer pageNo=Integer.parseInt(req.getParameter("page"));
		Integer pageSize=Integer.parseInt(req.getParameter("rows"));
		ISingerBiz singerBiz=new SingerBizImpl();
		this.out(resp, singerBiz.find(null, null, pageNo, pageSize));
	}


}
