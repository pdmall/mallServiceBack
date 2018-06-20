package com.fh.lw.utils;

import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

public class Alidayu {
	private static final String URL = "http://gw.api.taobao.com/router/rest";
	private static final String APPKEY = "23399064";
	private static final String SECRET = "0c49e54c97b3daf54928d88b3fb559a0";

	public static void main(String[] args) {
		Integer tag = getAuthCode("15982183168", "5445");
		if (tag == -1) {
			System.out.println("发送失败");
		} else if (tag == 2) {
			System.out.println("发送成功");
		}
	}

	public static int getAuthCode(String tel, String authCode) {

		String json2 = "{\"num\":\"" + authCode + "\"}";
		TaobaoClient client = new DefaultTaobaoClient(URL, APPKEY, SECRET);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsType("验证码");
		req.setSmsFreeSignName("洗衣修鞋");
		req.setSmsParamString(json2);
		req.setRecNum(tel);
		req.setSmsTemplateCode("SMS_86750036");
		try {
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
			System.out.println(rsp.getBody());
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	// 下单通知
	public static int indentSmsMsg(String tel, String time) {
		String json2 = "{\"time\":\"" + time + "\"}";
		TaobaoClient client = new DefaultTaobaoClient(URL, APPKEY, SECRET);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsType("下单通知");
		req.setSmsFreeSignName("大象包印");
		req.setSmsParamString(json2);
		req.setRecNum(tel);
		req.setSmsTemplateCode("SMS_63935921");
		try {
			@SuppressWarnings("unused")
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	// 付费通知
	public static int aliPaySmsMsg(String tel, String time) {
		String json2 = "{\"time\":\"" + time + "\"}";
		TaobaoClient client = new DefaultTaobaoClient(URL, APPKEY, SECRET);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsType("付费通知");
		req.setSmsFreeSignName("大象包印");
		req.setSmsParamString(json2);
		req.setRecNum(tel);
		req.setSmsTemplateCode("SMS_63835932");
		try {
			@SuppressWarnings("unused")
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}
	// 订单完成
	public static int finishSmsMsg(String tel, String orderNo) {
		String json2 = "{\"orderNo\":\"" + orderNo + "\"}";
		TaobaoClient client = new DefaultTaobaoClient(URL, APPKEY, SECRET);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsType("订单完成");
		req.setSmsFreeSignName("大象包印");
		req.setSmsParamString(json2);
		req.setRecNum(tel);
		req.setSmsTemplateCode("SMS_63770995");
		try {
			@SuppressWarnings("unused")
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}
	// 订单投诉
	public static int complaintSmsMsg(String tel, String orderNo) {
		String json2 = "{\"orderNo\":\"" + orderNo + "\"}";
		TaobaoClient client = new DefaultTaobaoClient(URL, APPKEY, SECRET);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsType("投诉订单");
		req.setSmsFreeSignName("大象包印");
		req.setSmsParamString(json2);
		req.setRecNum(tel);
		req.setSmsTemplateCode("SMS_63760873");
		try {
			@SuppressWarnings("unused")
			AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

}
