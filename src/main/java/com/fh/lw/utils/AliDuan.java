package com.fh.lw.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public class AliDuan {
	 /**********需要准备的参数**************/  
	public static final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
	public static final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
    public static String accessKey="LTAI43Ml9Ux5HH4Z";//需要修改  
    public static String accessSecret="CszenWcz6O5wIGA6edpw0JWneXN9W9";//需要修改  
    public static String code="SMS_107040177";//注册  
    public static String code1="SMS_107105058";//修改密码
    public static String signName="聚美美容";//需要修改  
    /**********************************/  
      
      
    public static void main(String[] args) {     
        String phone="15082407542";  
        
        //根据自己定义的短信模板，修改  
        
        test(phone,0,"a");  
  
    }  
  
      
       public static String test(String phone,Integer status,String i) {          
           try {  
        	 //  String i = RandomString.getRandomString(4);
        	   String time =getChinaDateByMM(System.currentTimeMillis());  
        	   String jsonStr="{\"name\":\"小明\",\"code\":\""+i+"\",\"time\":\""+time +"\"}";  
        	
        	   IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKey,
        			   accessSecret);
        	   DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        	   IAcsClient acsClient = new DefaultAcsClient(profile);
        	   //组装请求对象
               SendSmsRequest request = new SendSmsRequest(); 
               //post提交
               request.setMethod(MethodType.POST);
                //管理控制台中配置的短信签名（状态必须是验证通过）  
                request.setSignName(signName);  
                //管理控制台中配置的审核通过的短信模板的模板CODE（状态必须是验证通过）  
                if(status==1) {
                	request.setTemplateCode(code);
                }else {
                	request.setTemplateCode(code1);
                }
                
                   
//              短信模板中的变量；数字需要转换为字符串；个人用户每个变量长度必须小于15个字符。  
//               例如:短信模板为：“接受短信验证码${no}”,此参数传递{“no”:”123456”}，用户将接收到[短信签名]接受短信验证码123456  
                 request.setTemplateParam(jsonStr);
                //目标手机号，多个手机号可以逗号分隔  
                 request.setPhoneNumbers(phone);
             // request.setVersion(version);  
                SendSmsResponse httpResponse = acsClient.getAcsResponse(request);  
                httpResponse.getRequestId(); 
              
               
                return i;
            } catch (ServerException e) {  
                e.printStackTrace();  
            }  
            catch (ClientException e) {  
                e.printStackTrace();  
            }  
           return null;
        }  
         
         
        /** 
         * 使用毫秒转换为中文日期 
         * @param tmpDateInt 
         * @return 
         */  
        public static String getChinaDateByMM(long time){  
            String ret_date = "";  
            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy年MM月dd日");  
            ret_date = formatter.format(time);  
            return ret_date;  
        } 
}
