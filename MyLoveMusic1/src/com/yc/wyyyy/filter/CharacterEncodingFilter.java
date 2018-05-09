package com.yc.wyyyy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(
		value="/*",
		initParams={@WebInitParam(name="encoding",value="utf-8")}
		)
public class CharacterEncodingFilter implements Filter{
	private String encoding="utf-8";
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		String temp=fConfig.getInitParameter("encoding");
		if(temp!=null){
			encoding=temp;
		}
		
	}

}
