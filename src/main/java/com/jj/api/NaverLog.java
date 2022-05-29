package com.jj.api;

import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import org.springframework.beans.propertyeditors.URLEditor;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NaverLog {

	private String c_Id = "wx2pYVRiRw4XXhDt2Kpd";

	private String c_s="JvvHIpv7oy";
	private String state;
	
	
	
	
	
	private String redirectURI = "http://localhost:4520/amp/naverLog.do";
	
	
	
	
	NaverLog(){
	    SecureRandom random = new SecureRandom();
	    state = new BigInteger(130, random).toString();
	}
	
	
	
	public String getLoginUrl(){
		String loginUrl="https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    loginUrl+="&client_id=" + c_Id+ "&redirect_uri=" +redirectURI+ "&state=" + state;

		return loginUrl;
	}


	
	public String getAccessToken(String code)  throws Exception{
		String accessTocken="";
		String tockenUrl="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
		tockenUrl+="&client_id=" + c_Id+ "&code=" + code +"&state=" + state +"&client_secret=" + c_s;
		URL url= new URL(tockenUrl);
		
		HttpURLConnection con=(HttpURLConnection) url.openConnection();
		int responseCode= con.getResponseCode();
        System.out.println("responseCode : " + responseCode);
        
        ObjectMapper objectMapper=new ObjectMapper();
        JsonNode jnode=objectMapper.readTree(con.getInputStream());
        
        
        accessTocken=jnode.get("access_token").toString();
        
		System.out.println(accessTocken);
		return accessTocken;
	}
	
	public String getEmail(String accessToken) throws Exception{
		String userEmail="";
		String userUrl="https://openapi.naver.com/v1/nid/me";
		URL url=new URL(userUrl);
		HttpURLConnection con=(HttpURLConnection)url.openConnection();
		con.setRequestProperty("Authorization",  "Bearer "+accessToken);
		int responseCode= con.getResponseCode();
        System.out.println("responseCode : " + responseCode);
        
        ObjectMapper objectMapper=new ObjectMapper();
        JsonNode jnode=objectMapper.readTree(con.getInputStream());
        
        System.out.println(jnode);
        
        JsonNode response=jnode.get("response");
        

       userEmail=response.get("email").toString().replace("\"", "");
 
  
		return userEmail;
	}
	
}
