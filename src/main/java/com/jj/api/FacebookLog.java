package com.jj.api;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class FacebookLog {
	/*
	 * https://snyung.com/content/facebook-login
	 */	
	
	String c_id="752422742268886";
	String c_sc="c081fe239564644c81448740e5345ccf";
	String loginRedirect="http://localhost:4520/amp/faceLog.do";
	


	public String getFaceUrl() {
		String faceLoginUrl="https://www.facebook.com/v2.8/dialog/oauth?"+
				  "client_id="+c_id+ "&redirect_uri="+loginRedirect+ "&scope=public_profile,email";
		
		return faceLoginUrl;
	}

	
	public String getAccessToken(String code) throws Exception {
		String accessToken="";
		String tokenUrl = "https://graph.facebook.com/v2.8/oauth/access_token?"+
				  "client_id=" +c_id+ "&redirect_uri=" + loginRedirect +
				  "&client_secret=" + c_sc + "&code="+code;
		URL url=new URL(tokenUrl);
		HttpURLConnection con=(HttpURLConnection) url.openConnection();
		int responseCode=con.getResponseCode();
		System.out.println("responseCode : "+responseCode);
		
		ObjectMapper objectMapper=new ObjectMapper();
		JsonNode jnode=objectMapper.readTree(con.getInputStream());
		System.out.println(jnode);
		accessToken=jnode.get("access_token").toString().replace("\"", "");
		
		
		
		return accessToken;
	}
	public String getEmail(String accessToken) throws Exception{
		String userEmail="";
		String userInfoUrl = "https://graph.facebook.com/me?"+
				  "access_token="+accessToken+ "&fields=id,name,email,picture";
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
