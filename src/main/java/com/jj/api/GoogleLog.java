package com.jj.api;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class GoogleLog {

	String c_id="420375394905-l10l1bm0oshs9oogmn90c187d73jl9e6.apps.googleusercontent.com";
	String c_s="PZmi-g9PwcEsEJNVBTfQwtMa";
	String loginRedirect="http://localhost:4520/amp/googleLog.do";
	public String getLoginUrl() {
		String loginUrl="https://accounts.google.com/o/oauth2/v2/auth?client_id="+c_id+"&redirect_uri="+loginRedirect+"&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email";
		
		return loginUrl;
	}
	public String getAccessToken(String code) throws Exception {
		String accessToken="";
		String tokenUrl="https://oauth2.googleapis.com/token";
		String param="client_id="+c_id+"&client_secret="+c_s+"&code="+code+"&grant_type=authorization_code&redirect_uri="+loginRedirect;
		
		
		
		URL url=new URL(tokenUrl);
		HttpURLConnection con=(HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setDoInput(true);
		con.setDoOutput(true);
		
		OutputStreamWriter outputStreamWriter=new OutputStreamWriter(con.getOutputStream(),"UTF8");
		outputStreamWriter.write(param);
		outputStreamWriter.flush();
		outputStreamWriter.close();
	
		int responseCode= con.getResponseCode();
        System.out.println("responseCode : " + responseCode);
		
        ObjectMapper objectMapper=new ObjectMapper();
        JsonNode jnode=objectMapper.readTree(con.getInputStream());
        
        System.out.println(jnode);
		
        accessToken=jnode.get("access_token").toString().replace("\"", "");
        
        
		return accessToken;
	}
	public String getEmail(String accessToken) throws Exception {
		String userEmail="";
		String userInfoUrl="https://www.googleapis.com/oauth2/v1/userinfo?access_token="+accessToken;
		URL url=new URL(userInfoUrl);
		HttpURLConnection con=(HttpURLConnection) url.openConnection();
		
		int responseCode=con.getResponseCode();
		System.out.println("responseCode : "+responseCode);
		
		ObjectMapper objectMapper=new ObjectMapper();
		JsonNode jnode=objectMapper.readTree(con.getInputStream());
		
		userEmail=jnode.get("email").toString().replace("\"", "");
		
		
		
		return userEmail;
		
	}
}
