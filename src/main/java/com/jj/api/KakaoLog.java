package com.jj.api;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoLog {
	String c_id="60b8f3fc77f6786e704b5364ee6fc210";
	
	private String tokenUrl="https://kauth.kakao.com/oauth/token";//토큰 url
	private String userInfoUrl="https://kapi.kakao.com/v2/user/me";//user 정보 가저오기 url
	
	
	private String LoginRedirectUri = "http://localhost:4520/amp/kakaoLog.do"/*"리다이렉트 주소입력"*/;

	
	
	  public String getLoginUrl() {//카카오 로그인  페이지 url을 만든다.
		  
		    String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
		        + "client_id=" + c_id + "&redirect_uri="
		        + LoginRedirectUri + "&response_type=code";
		    return kakaoUrl;
		  }
	  

	  
	public String getAccessToken(String code) throws Exception {
		String accessToken="";
		
		String param="grant_type=authorization_code&client_id="+c_id+"&redirect_uri="+LoginRedirectUri+"&code="+code;//POST방식이기에 바디에 담아줄 파라미터값

	 
	      URL url = new URL(tokenUrl);
	      HttpURLConnection conn = (HttpURLConnection) url.openConnection();//HttpURLConnection을 통해 해당 url로 연결을 시도할것이다.
	      conn.setRequestMethod("POST");//방식 포스트
	      conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	      conn.setDoInput(true);//인풋스트림 사용할거임
	      conn.setDoOutput(true);//아웃풋스트림 사용할거임
	  
	      OutputStreamWriter outputStreamWriter=new OutputStreamWriter(conn.getOutputStream(),"UTF8");//OutputStreamWriter을 통해 위에서 작성했던 파라미터 값을 conn의 바디에 담아버린다.
	      outputStreamWriter.write(param);
	      outputStreamWriter.flush();
	      outputStreamWriter.close();
	      
	      int responseCode = conn.getResponseCode();
	      System.out.println(responseCode);//200이 정상적인 연결
	     
	         // JSON 형태 반환값 처리
	         ObjectMapper mapper = new ObjectMapper();//서버에서 받은 InputStream을 json형태로 바꾸기 위해 생성
	         JsonNode returnNode = mapper.readTree(conn.getInputStream());//바꿔서 JsonNode에 담아줌
	         accessToken=returnNode.get("access_token").toString();//access_token만 추출
	    
	         System.out.println(accessToken);
	  
		
		
		return accessToken;
	}
	
	public String getEmail(String accessToken) throws Exception {
		String userEmail="";
		
	
		        URL url = new URL(userInfoUrl);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        
		        //    요청에 필요한 Header에 포함될 내용
		        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        ObjectMapper objectMapper=new ObjectMapper();
		        JsonNode jnode=objectMapper.readTree(conn.getInputStream());
	        
		        JsonNode properties = jnode.get("properties");
		        JsonNode kakao_account = jnode.get("kakao_account");
		        
		    
		        userEmail = kakao_account.get("email").toString().replace("\"", "");
		
		
		
		
		
		return userEmail;
	}

}
