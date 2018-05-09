package com.yc.wyyyy.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class SendSmsUtil {

	public Integer sendMessage(String sms_apiid, String sms_apikey, String phone) {
		String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(Url);

		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType",
				"application/x-www-form-urlencoded;charset=GBK");

		int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);

		String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

		NameValuePair[] data = {// 提交短信
				new NameValuePair("account", sms_apiid), // 查看用户名是登录用户中心->验证码短信->产品总览->APIID
				new NameValuePair("password", sms_apikey), // 查看密码请登录用户中心->验证码短信->产品总览->APIKEY
				new NameValuePair("mobile", phone),
				new NameValuePair("content", content), };
		method.setRequestBody(data);

		try {
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();

			// System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			// System.out.println(code);
			// System.out.println(msg);
			// System.out.println(smsid);

			if ("2".equals(code)) {
				System.out.println("短信提交成功");
			}
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return mobile_code;
	}
}
