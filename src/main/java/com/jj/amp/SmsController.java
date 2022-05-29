package com.jj.amp;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jj.coolsms.Coolsms;



@Controller
public class SmsController {


	@RequestMapping(value = "/smsPage.do", method = RequestMethod.GET)
	public void smsPageDo(Locale locale, Model model,String to,HttpSession session, String test) {
// to변수에는 사용자번호가 저장되어있음
		
		System.out.println(test + " <<<<<<<");
		if(test==null) {
			test="id_code";
		}
		if(!test.equals("pw_code")) {
			
			int code = (int)(Math.random()*998)+1111; // 랜덤값
			session.setAttribute("code", code); // session에 랜덤값 초기화
			
			//https://www.coolsms.co.kr/stat
			   String api_key = "NCSKIHYZ2UHQRCBN";
			    String api_secret = "B1BGGBULSY4IGFECPE44S3LJY4RDAEI3";
			    Coolsms coolsms = new Coolsms(api_key, api_secret);

			    HashMap<String, String> set = new HashMap<String, String>();
			    set.put("to", to); // 수신번호
			    set.put("from", "01045207141"); // 발신번호
			    set.put("text", "인증 번호 : ["+code+"]"); // 문자내용
			    set.put("type", "sms"); // 문자 타입

			    System.out.println(set);

			    try {
					coolsms.send(set);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 보내기&전송결과받기
			
		}else {
			System.out.println("eqweqwe");
			//비밀번호 찾기일때
			int pw_code = (int)(Math.random()*998)+1111; // 랜덤값
			session.setAttribute("pw_code", pw_code); // session에 랜덤값 초기화
			
			//https://www.coolsms.co.kr/stat
			   String api_key = "NCSKIHYZ2UHQRCBN";
			    String api_secret = "B1BGGBULSY4IGFECPE44S3LJY4RDAEI3";
			    Coolsms coolsms = new Coolsms(api_key, api_secret);

			    HashMap<String, String> set = new HashMap<String, String>();
			    set.put("to", to); // 수신번호
			    set.put("from", "01045207141"); // 발신번호
			    set.put("text", "인증 번호 : ["+pw_code+"]"); // 문자내용
			    set.put("type", "sms"); // 문자 타입

			    System.out.println(set);

			    try {
					coolsms.send(set);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 보내기&전송결과받기
		}
	}

	@RequestMapping(value = "/smsIsCode.do", method = RequestMethod.GET)
	@ResponseBody
	public String smsIsCodeDo(Locale locale, Model model,HttpSession session,String code, String pw_code) {
	
		if(!code.equals("no")) {
			System.out.println(code+","+session.getAttribute("code"));
			if(session.getAttribute("code")!=null && session.getAttribute("code").toString().equals(code) ) {
				System.out.println(session.getAttribute("code").toString());
				return "true";
			}else {
				return "false";		
			}
		}else {
			
			System.out.println(pw_code+","+session.getAttribute("pw_code"));
			if( session.getAttribute("pw_code")!=null && session.getAttribute("pw_code").toString().equals(pw_code) ) {
				System.out.println(session.getAttribute("pw_code").toString());
				return "true";
			}else {
				return "false";		
			}
		}
	}
	

	
}
