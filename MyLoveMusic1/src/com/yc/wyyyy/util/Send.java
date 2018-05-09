package com.yc.wyyyy.util;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class Send {

public int  SendMessage(String userTel)throws Exception
{

	int rs=0;
	HttpClient client = new HttpClient();
	PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
	post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
	int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);
	NameValuePair[] data ={ 
		new NameValuePair("Uid", "584158932@qq.com"),//用户名
		new NameValuePair("Key", "7d7087cd91d17abcf347"),//接口密钥
		new NameValuePair("smsMob",userTel),//接收号码
		new NameValuePair("smsText","验证码："+mobile_code+"【MyLove Music】")};//编辑短信内容（要在短信中加【签名内容】）
	post.setRequestBody(data);
	client.executeMethod(post);
	Header[] headers = post.getResponseHeaders();
	int statusCode = post.getStatusCode();
	System.out.println("statusCode:"+statusCode);
	for(Header h : headers){
		System.out.println(h.toString());
	}
	String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
	System.out.println(result); //打印返回消息状态
	
	post.releaseConnection();
	rs=1;
	return rs;
	}
}