package com.yc.wyyyy.util;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

/**
 * 图片上传的工具类
 * @author navy
 */
@SuppressWarnings("unchecked")
public class FileUploadUtil {
	public static String PATH="../pics";//文件上传的路径  与项目评级 在项目部署时不会清空  /表示在server的项目级
	//private static final String ALLOWED="gif,jpg,jpeg,png,doc,txt,xls,ico";//允许上传文件类型
	private static final String DENIED="exe,bat,jsp,html,com";//不允许上传的文件类型
	private static final int SINGLEFILESIZE=1024*1024*100;//单个文件最大大小
	private static final int TOTALMAXSIZE=1000*1024*1024;//每次上传总文件大小

	public Map<String,String> upload(PageContext pageContext) throws Exception{
		Map<String,String> map = new HashMap<String, String>();
		//实例化一个SmartUpload对象
		SmartUpload su = new SmartUpload();//文件上传包的使用
		//初始化SmartUpload
		su.initialize(pageContext);
		//设置参数
		//su.setAllowedFilesList(ALLOWED);
		su.setDeniedFilesList(DENIED);
		su.setMaxFileSize(SINGLEFILESIZE);
		su.setTotalMaxFileSize(TOTALMAXSIZE);
		su.setCharset("utf-8");

		//开始上传
		su.upload();
		//获取转换后的请求
		Request request = su.getRequest();
		Enumeration<String> enums = request.getParameterNames();//使用集合来装获取所有普通表单元素名

		//循环取出每一个表单元素名已对一的值 村到map中
		String name=null;
		while(enums.hasMoreElements()){
			name=enums.nextElement();
			map.put(name,request.getParameter(name));
		}

		//将上传文件存到服务器路径下
		Files files = su.getFiles();

		if(files!=null && files.getCount()>0){//说明用户文件已传上来
			String path = null;//文件保存路径
			String fileName =null;//文件名
			String filedName = null;
			String temp="";
			String upperFiledName=null;

			Collection<File> collection = files.getCollection();
			path=pageContext.getServletContext().getRealPath("/")+PATH;

			for(File fl:collection){//循环取出每一个上传文件
				if(!fl.isMissing()){//文件没有丢失
					filedName = fl.getFieldName();
					if(upperFiledName==null){
						upperFiledName=filedName;
					}

					if(!upperFiledName.equals(filedName)){ //说明是另外一个文件域了
						map.put(upperFiledName, temp);
						temp="";
						upperFiledName=filedName;
					}
					fileName = new Date().getTime()+"_"+new Random().nextInt(10000)+"."+fl.getFileExt();
					//保存数据到指定文件
					fl.saveAs(path+"/"+fileName);

					if(!"".equals(temp)){
						temp+=",";
					}
					temp+=PATH+"/"+fileName;
				}
			}
			map.put(upperFiledName, temp);

		}
		return map;
	}

	/**
	 * 将请求转成一个对象
	 * @param pageContext
	 * @param c
	 * @return
	 * @throws Exception
	 */
	public <T> T uploadToObject(PageContext pageContext,Class<T> c) throws Exception{
		//实例化一个SmartUpload对象
		SmartUpload su = new SmartUpload();//文件上传包的使用
		//初始化SmartUpload
		su.initialize(pageContext);
		//设置参数
		//su.setAllowedFilesList(ALLOWED);
		su.setDeniedFilesList(DENIED);
		su.setMaxFileSize(SINGLEFILESIZE);
		su.setTotalMaxFileSize(TOTALMAXSIZE);
		su.setCharset("utf-8");

		//开始上传
		su.upload();
		//获取转换后的请求
		Request request = su.getRequest();


		T t=c.newInstance(); //此时调用的是给定类的无参构造方法  StoreType.class   new  StoreType()

		//获取请求中的所有数据
		Enumeration<String> names=request.getParameterNames(); //获取请求中的数据的所有的键，即input标签中name属性的属性值
		//tname setTname()  跟对应的对象中的方法去比较

		//获取给定对象中的所有setter方法
		Method[] methods=c.getMethods();

		List<Method> list=new ArrayList<Method>();

		//提取setter方法
		for(Method method:methods){
			if(method.getName().startsWith("set")){
				list.add(method);
			}
		}

		//循环取出每一个表单元素名已对一的值 村到map中
		String fieldName=null;
		String fieldNameSetter=null;
		String typeName=null; 
		while(names.hasMoreElements()){
			fieldName=names.nextElement(); //获取提交的表单中的表单元素名
			fieldNameSetter="set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
			for(Method method:list){
				if(fieldNameSetter.equals(method.getName())){
					try {
						typeName=method.getParameterTypes()[0].getSimpleName();
						if("int".equals(typeName) || "Integer".equals(typeName)){
							method.invoke(t,Integer.parseInt(request.getParameter(fieldName).trim()));
						}else if("double".equals(typeName) || "float".equals(typeName) || "Double".equals(typeName) || "Float".equals(typeName)){
							method.invoke(t,Double.parseDouble(request.getParameter(fieldName).trim()));
						}else{
							method.invoke(t,request.getParameter(fieldName).trim());
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;//如果找到了，则进行下一次循环
				}
			}
		}

		//将上传文件存到服务器路径下
		Files files = su.getFiles();
		if(files!=null && files.getCount()>0){//说明用户文件已传上来
			String path = null;//文件保存路径
			String fileName =null;//文件名
			String temp="";
			String oldFieldName="";

			Collection<File> collection = files.getCollection();
			path=pageContext.getServletContext().getRealPath("/")+PATH;

			for(File fl:collection){//循环取出每一个上传文件
				if(!fl.isMissing()){//文件没有丢失
					fieldName = fl.getFieldName();//license  pic   pic
					if("".equals(oldFieldName)){
						oldFieldName=fieldName;
					}else{
						if(!oldFieldName.equals(fieldName)){ //说明不是同一个文本框中的图片
							if(!"".equals(temp)){
								//图片上传完成后，将路径存入到对象的对应属性中
								fieldNameSetter="set"+oldFieldName.substring(0,1).toUpperCase()+oldFieldName.substring(1);
								for(Method method:list){
									if(fieldNameSetter.equals(method.getName())){
										method.invoke(t,temp);
									}
								}
							}
							temp="";
							oldFieldName=fieldName;
						}
					}

					fileName = new Date().getTime()+"_"+new Random().nextInt(10000)+"."+fl.getFileExt();
					//保存数据到指定文件
					fl.saveAs(path+"/"+fileName);

					if(!"".equals(temp)){
						temp+=",";
					}
					temp+=PATH+"/"+fileName;
				}
			}

			if(!"".equals(temp)){
				//图片上传完成后，将路径存入到对象的对应属性中
				fieldNameSetter="set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
				for(Method method:list){
					if(fieldNameSetter.equals(method.getName())){
						method.invoke(t,temp);
					}
				}
			}
		}

		return t;
	}



	/**
	 * 将请求转成一个对象，并给上传的图片添加水印
	 * @param pageContext
	 * @param c
	 * @return
	 * @throws Exception
	 */
	public <T> T uploadToObjectAndSetWaterImage(PageContext pageContext,Class<T> c) throws Exception{
		//实例化一个SmartUpload对象
		SmartUpload su = new SmartUpload();//文件上传包的使用
		//初始化SmartUpload
		su.initialize(pageContext);
		//设置参数
		//su.setAllowedFilesList(ALLOWED);
		su.setDeniedFilesList(DENIED);
		su.setMaxFileSize(SINGLEFILESIZE);
		su.setTotalMaxFileSize(TOTALMAXSIZE);
		su.setCharset("utf-8");

		//开始上传
		su.upload();
		//获取转换后的请求
		Request request = su.getRequest();


		T t=c.newInstance(); //此时调用的是给定类的无参构造方法  StoreType.class   new  StoreType()

		//获取请求中的所有数据
		Enumeration<String> names=request.getParameterNames(); //获取请求中的数据的所有的键，即input标签中name属性的属性值
		//tname setTname()  跟对应的对象中的方法去比较

		//获取给定对象中的所有setter方法
		Method[] methods=c.getMethods();

		List<Method> list=new ArrayList<Method>();

		//提取setter方法
		for(Method method:methods){
			if(method.getName().startsWith("set")){
				list.add(method);
			}
		}

		//循环取出每一个表单元素名已对一的值 村到map中
		String fieldName=null;
		String fieldNameSetter=null;
		String typeName=null; 
		while(names.hasMoreElements()){
			fieldName=names.nextElement(); //获取提交的表单中的表单元素名
			fieldNameSetter="set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
			for(Method method:list){
				if(fieldNameSetter.equals(method.getName())){
					try {
						typeName=method.getParameterTypes()[0].getSimpleName();
						if("int".equals(typeName) || "Integer".equals(typeName)){
							method.invoke(t,Integer.parseInt(request.getParameter(fieldName).trim()));
						}else if("double".equals(typeName) || "float".equals(typeName) || "Double".equals(typeName) || "Float".equals(typeName)){
							method.invoke(t,Double.parseDouble(request.getParameter(fieldName).trim()));
						}else{
							method.invoke(t,request.getParameter(fieldName).trim());
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;//如果找到了，则进行下一次循环
				}
			}
		}

		//将上传文件存到服务器路径下
		Files files = su.getFiles();
		if(files!=null && files.getCount()>0){//说明用户文件已传上来
			String path = null;//文件保存路径
			String fileName =null;//文件名
			String temp="";
			String oldFieldName="";
			String ext=null; //后缀

			Collection<File> collection = files.getCollection();
			path=pageContext.getServletContext().getRealPath("/")+PATH;

			for(File fl:collection){//循环取出每一个上传文件
				if(!fl.isMissing()){//文件没有丢失
					fieldName = fl.getFieldName();//license  pic   pic
					if("".equals(oldFieldName)){
						oldFieldName=fieldName;
					}else{
						if(!oldFieldName.equals(fieldName)){ //说明不是同一个文本框中的图片
							if(!"".equals(temp)){
								//图片上传完成后，将路径存入到对象的对应属性中
								fieldNameSetter="set"+oldFieldName.substring(0,1).toUpperCase()+oldFieldName.substring(1);
								for(Method method:list){
									if(fieldNameSetter.equals(method.getName())){
										method.invoke(t,temp);
									}
								}
							}
							temp="";
							oldFieldName=fieldName;
						}
					}
					ext=fl.getFileExt();
					fileName = new Date().getTime()+"_"+new Random().nextInt(10000)+"."+ext;
					//保存数据到指定文件
					fl.saveAs(path+"/"+fileName);

					if(ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif")){
						//给图片添加水印
						fileName=ImageWaterMarkUtil.waterMarkImage(path+"/"+fileName,fileName);
					}
					if(!"".equals(temp)){
						temp+=",";
					}
					temp+=fileName;
				}
			}

			if(!"".equals(temp)){
				//图片上传完成后，将路径存入到对象的对应属性中
				fieldNameSetter="set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
				for(Method method:list){
					if(fieldNameSetter.equals(method.getName())){
						method.invoke(t,temp);
					}
				}
			}
		}

		return t;
	}
}
