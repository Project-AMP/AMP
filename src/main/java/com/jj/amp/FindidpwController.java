package com.jj.amp;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jj.dao.FindidpwDao;
import com.jj.vo.FindidpwVo;

@Controller
public class FindidpwController {
	
	@Autowired 
	FindidpwDao findidpwDao;
	@Autowired 
	FindidpwVo findidpwVo;
	@Autowired
	private JavaMailSender mailSender; // 21.03.15 진렬 수정
	
	@RequestMapping(value="findid.do")
	@ResponseBody
	public String findid(Model model, String phone, String name) {
		
		findidpwVo.setName(name);
		findidpwVo.setPhone(phone);
		
		try {
			
			ArrayList<FindidpwVo> list =  (ArrayList<FindidpwVo>)findidpwDao.selectById(findidpwVo);
					
			String getid = list.get(0).getId();
			findidpwVo.setId(getid);
			
			if(getid == null || getid.equals("")|| getid.equals(null)) { // 첫번째 인덱스(id)가 null일 경우 false를 반환하고 null이 아닐경우 true로 반환한다
				return "false";
			}else {			
				return getid;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "false";
		
	}
	
	
	
	
	  @RequestMapping(value="findIdpw.do") 
	  public String findid(Model model) {
	 
	  
		  return "site/member/findIdpw"; 
	  }
	 
	
	@RequestMapping(value="findIdpw")
		public String findIdpw(Model model) {
			
		return "site/member/findIdpw";
	}
	
	
	
		
	
	
	// 21.03.15 진렬 수정
	// 메일 보내기 컨트롤러
	@RequestMapping(value="mailSending.do")
	public String mailSending(HttpServletRequest request, String tomail, String id) {
		
		System.out.println("tomail>>>>>" + tomail);
		System.out.println("id>>>>> " + id);
		
		String click = "재설정을 원하신다면 클릭하세요!";
		
		String setfrom = tomail;
		//String tomail = request.getParameter("tomail"); // 받는사람 이메일
		String to_mail = tomail; // 받는사람 이메일
		String title = "jj비밀번호 재설정"; // 제목
		//String content = "<a href='http://localhost:4520/amp/updatepw.do?id=ddd'>" + click + "</a>";
		String content = "<a href='http://localhost:4520/amp/updatepw.do?id="+id+"'>" + click + "</a>";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능함
			message.setText(content,"utf-8","html"); // 메일 내용
			
			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		//return "site/member/findIdpw";
		return "redirect:findIdpw.do";
	}
	
	
	
	// 21.03.15 진렬 수정
	// 비밀번호 재설정 컨트롤러
	@RequestMapping(value="updatepw.do")
	public String updatepw(Model model, String id) {
		
		model.addAttribute("id", id);
			
		return "site/member/updatePw";
	}
	
	
	
	
	
	// 비밀번호 업데이트 맵핑
	// 21.04.04 진렬 수정
		@RequestMapping(value="updatepw_ok.do")
		@ResponseBody
		public String updatepw_ok(Model model,String pw, String id) {
			
			System.out.println("id>>>>>>>:" + id);
			System.out.println("pw>>>>>>>:" + pw);
			
			findidpwVo.setUpdateid(id);
			findidpwVo.setUpdatepw(pw);
			
			int update_num = findidpwDao.updatePw(findidpwVo);
			
			if(update_num == 1) {
				model.addAttribute("update_num", update_num);
				return "true";
			}else {
				return "false";
			}
			
			
			//return "site/member/updatePw";
		}
	
	
	
	
	
	
	// 21.03.29 진렬 수정
	// 아이디 찾기 - 아이디 확인 컨트롤러
	@RequestMapping(value="check_id.do")
	@ResponseBody
	public String check_id(Model model, String id) {
		
		String find_id = findidpwDao.selectId(id);
		
		//System.out.println("엡에베엡" + find_id);
		
			if(id.equals(find_id)) {
				return "true";
			}else {
				return "false";
			}
		

	} // check_id
	
	
	
	// 21.03.29 진렬 수정
	@RequestMapping(value="check_pw.do")
	@ResponseBody
	public String check_pw(Model model, String id, String phone) {
		
		findidpwVo.setId(id);
		findidpwVo.setPhone(phone);
		
		ArrayList<FindidpwVo> find_pw = (ArrayList<FindidpwVo>)findidpwDao.selectpw(findidpwVo);
		
		try {
			
			//System.out.println("이이이이이 " + find_pw.get(0));
			
			if(find_pw.get(0) != null) {
				return "true";
			}else {
				return "false";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} // try catch
		
		return "false";
		
	}
	
	
}









































