package com.yc.wyyyy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 适配器 <br />
 * 它是抽象的,实现或继承一个类或接口，对这个接口或类中的方法做通用的实现
 */
public class BasicServlet extends HttpServlet {
	private static final long serialVersionUID = -7126203888751622203L;
	// 利用protected让子类能访问到 op
	protected String op;
	protected ServletContext application;
	protected HttpSession session;

	// 这样每个子类无须再写这个 doGet()
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	// 利用servlet的生命周期中的service方法一定会首先调用这个特点，完成通用功能的抽能
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		application = req.getSession().getServletContext();
		session = req.getSession();
		req.setCharacterEncoding("utf-8"); // 编码集的设定必须在request取第一次参数前
		op = req.getParameter("op"); // 利用隐藏域完成操作分发
		super.service(req, resp);
	}

	// 返回一个标识符
	protected void out(HttpServletResponse response, int result) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(result);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (out != null) {
			out.close();
		}
	}

	// 返回一个json对象
	protected void out(HttpServletResponse response, Object obj) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Gson gson = new GsonBuilder().create();
			out.print(gson.toJson(obj));
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (out != null) {
			out.close();
		}
	}

	// 针对easyui的返回
	protected void out(HttpServletResponse response, Object rows, Integer total) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Gson gson = new GsonBuilder().create();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", total);
			map.put("rows", rows);
			out.print(gson.toJson(map));
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (out != null) {
			out.close();
		}
	}

	// User
	public void writeJson(HttpServletResponse response, Object obj)
			throws IOException {
		Gson gson = new Gson();
		String jsonString = gson.toJson(obj);
		writeJson(response, jsonString);
	}

	// List<T> TypeToken();
	public void writeJson(HttpServletResponse response, String jsonString)
			throws IOException {
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonString);
		out.flush();
		out.close();
	}
}
