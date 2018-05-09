package com.yc.wyyyy.servlet;

import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.yc.wyyyy.util.FileUploadUtil;
import com.yc.wyyyy.util.ImageWaterMarkUtil;

public class InitServlet extends HttpServlet{

	private static final long serialVersionUID = -9064268424611830454L;
	private String filePath="uploadFile";//默认文件上传路径
	private String logoWater="images/yclogo.png";//默认水印图片
	
	@Override
	public void init() throws ServletException {
		String temp=this.getInitParameter("uploadPath");
		if(temp!=null){//说明用户指定了上传路径
			filePath=temp;
		}
		//判断路径是否存在,如果不存在则自动创建
		String path=this.getServletContext().getRealPath("/");

		temp=this.getInitParameter("logoWater");
		if(temp!=null){//说明用户指定了水印图片
			logoWater=temp;
		}
		//设置水印图片地址
		ImageWaterMarkUtil.logoPath=path+logoWater;
		
		path+=filePath;
		
		File file=new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		
		FileUploadUtil.PATH=filePath;
		//添加水印图片后的图片路径
		File fl=new File(path,"waterImage");
		if(!fl.exists()){
			fl.mkdirs();
			
		}
		
		ImageWaterMarkUtil.realPath=path+"/waterImage";
		ImageWaterMarkUtil.uploadPath=filePath+"/waterImage";
	}
}
