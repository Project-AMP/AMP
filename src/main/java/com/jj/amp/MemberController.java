package com.jj.amp;

import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jj.api.FacebookLog;
import com.jj.api.GoogleLog;
import com.jj.api.KakaoLog;
import com.jj.api.NaverLog;
import com.jj.dao.MemberDao;

import com.jj.vo.MemberVo;

/*로그인로직
 * 
 * 경우의 수
1.api,번호있 	dao.joinMember1()
2.api,번호없	dao.joinMember2()
3.일반,번호있	dao.joinMember3()
4.일반,번호없	dao.joinMember4()
 * 
 * 
 * 
 * 
 * 
 * */



@Controller
public class MemberController {
	@Autowired
	FacebookLog fLog;
	@Autowired
	GoogleLog gLog;
	@Autowired
	NaverLog nLog;
	@Autowired
	KakaoLog kLog;
	@Autowired
	MemberDao memberDao;
	@Autowired
	MemberVo memberVo;
	
	
	@RequestMapping(value = "/agree")
	public String sitemain(Locale locale, Model model,HttpServletRequest request,String platform) {


		Map<String,?> param=RequestContextUtils.getInputFlashMap(request);
		String platform1=null;
		String email=null;
		
		if(platform!=null&&platform.equals("normal")) {
			platform1="normal";
		}else{
			if(param!=null) {
				platform1=(String)param.get("platform");
				email=(String )param.get("email");
				model.addAttribute("email",email);
				}
		}
		if(platform==null&&platform1==null) {
			return "redirect:login";
		}
		model.addAttribute("platform",platform1);
		
		
		return "site/member/agree";
	}


	@RequestMapping(value = "/login")
	public String login(Locale locale, Model model) {
	
		model.addAttribute("kakaoLoginUrl", kLog.getLoginUrl());
		model.addAttribute("naverLoginUrl",nLog.getLoginUrl());
		model.addAttribute("googleLoginUrl",gLog.getLoginUrl());
		model.addAttribute("faceLoginUrl",fLog.getFaceUrl());
		
		return "site/member/login";
	}
	@RequestMapping(value = "/logout")
	public String logout(Locale locale, Model model,HttpSession session) {
		session.invalidate();
			
		
		return "redirect:main";
	}
	@RequestMapping(value = "/phone")
	public String phone() {

		return "site/member/phone";
	}
	
	
	//api로그인 리다이렉트 페이지. 각 플렛폼마다의 리턴페이짐 플렛폼. 사이트에서 지정해둠
	@RequestMapping(value = "/kakaoLog.do", method = RequestMethod.GET)
	public String kakaoLog(Locale locale, Model model,String code) {
		System.out.println("123");
		return "redirect:getEmail.do?platform=kakao&code="+code;
	}
	@RequestMapping(value = "/googleLog.do", method = RequestMethod.GET)
	public String googleLog(Locale locale, Model model,String code) throws Exception {
			return "redirect:getEmail.do?platform=google&code="+code;		
	}
	@RequestMapping(value = "/naverLog.do", method = RequestMethod.GET)
	public String naverLog(Locale locale, Model model,String code) throws Exception {
		return "redirect:getEmail.do?platform=naver&code="+code;
		
	}
	@RequestMapping(value = "/faceLog.do", method = RequestMethod.GET)
	public String faceLog(Locale locale, Model model,String code) throws Exception {
		return "redirect:getEmail.do?platform=face&code="+code;
		
	}
	
	
	@RequestMapping(value = "/getEmail.do", method = RequestMethod.GET)
	public String log(Locale locale, Model model,String code,String platform,HttpSession session,RedirectAttributes redirectAttributes) throws Exception {
		String returnPage="redirect:main";
		String accessToken,userEmail;
		if(platform.equals("kakao")) {
			accessToken=kLog.getAccessToken(code);
			userEmail=kLog.getEmail(accessToken);	
			
		}else if(platform.equals("google")) {
			accessToken=gLog.getAccessToken(code);
			userEmail=gLog.getEmail(accessToken);	
			
		}else if(platform.equals("naver")) {
			accessToken=nLog.getAccessToken(code);
			userEmail=nLog.getEmail(accessToken);	
			
		}else{
			accessToken=fLog.getAccessToken(code);
			userEmail=fLog.getEmail(accessToken);	
		}
	
		/* 가져온 db 이메일 검색 */
		memberVo.setPlatform(platform);
		memberVo.setApiEmail(userEmail);
		System.out.println(userEmail);
		ArrayList<MemberVo> list=(ArrayList<MemberVo>)memberDao.selectIdxByPlatform(memberVo);
		
		if(list.size()==0) {/* 없으면 */
			/* 가입실시 */
			redirectAttributes.addFlashAttribute("email",userEmail).addFlashAttribute("platform",platform);
			
			returnPage="redirect:agree";
			
		} else {/* 있으면 */
			/* 바로로그인 */
			session.setAttribute("idx",list.get(0).getIdx());
			
		}
		return returnPage;
		
	}
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(Locale locale, Model model,String id) throws Exception {

		System.out.println(id+"아이디");
		memberVo.setId(id);
		ArrayList<MemberVo> list =(ArrayList<MemberVo>)memberDao.selectIdxById(memberVo);
		
		if(list.size()==0) {
			System.out.println("사용가능 아이디");
			return "true";
		}else {
			if(list.size()!=0)
				System.out.println("중복 아이디");
			return "false";
		}
	
		
	}
	/* 핸드폰 인증으로 기존가입확인 */
	@RequestMapping(value = "/isMember", method = RequestMethod.GET)
	@ResponseBody
	public String ismember(Locale locale, Model model,String phone) throws Exception {

		System.out.println(phone+"전화번호");
		memberVo.setPhone(phone);
		ArrayList<MemberVo> list =(ArrayList<MemberVo>)memberDao.selectIdxByPhone(memberVo);
		
		if(list.size() == 0) { // 회원가입이 아예 안된경우
			return "false";
		}else { // 21.02.24 수정
			if(list.get(0).getId() != null && list.get(0).getPw() != null) {
				return "ajm"; // already joined member(이미 가입된 회원)
			}else {
				return "true"; 
			}
			
		} // else
	
		
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model,HttpServletRequest request) {

		return "site/member/join";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinDo(String platform,String apiEmail,String phone,String id,String pw,String name, String address,String birth,String email,HttpSession session) {
			if(platform==null&&apiEmail==null) {
				return "redirect:main";
			}
			if(platform!=null&&platform.equals("normal")) {/*일반*/
					System.out.println("일반");
					if (name == null||name.equals("")) {/* 전화번호가 있을때 */
						memberVo.setPhone(phone);
						memberVo.setIdx(((ArrayList<MemberVo>)memberDao.selectIdxByPhone(memberVo)).get(0).getIdx());
						memberVo.setId(id);
						memberVo.setPw(pw);						
						memberDao.joinMember3(memberVo);
					} else {/* 전화번호가 없을 때 */
						memberVo.setId(id);
						memberVo.setPw(pw);
						memberVo.setPhone(phone);
						memberVo.setName(name);
						memberVo.setEmail(email);
						memberVo.setAddress(address);
						memberVo.setBirth(birth);
						memberVo.setPlatform(platform);
						memberDao.joinMember4(memberVo);
						
					}
				return "redirect:login";
			} else {/* api */
					System.out.println("api");
				
					if (name == null||name.equals("")) {/* 전화번호가 있을때 */
						memberVo.setPhone(phone);
						memberVo.setIdx(((ArrayList<MemberVo>)memberDao.selectIdxByPhone(memberVo)).get(0).getIdx());
						memberVo.setApiEmail(apiEmail);
						memberVo.setPlatform(platform);
						memberDao.joinMember1(memberVo);
					} else {/* 전화번호가 없을 때 */

						memberVo.setPhone(phone);
						memberVo.setName(name);
						memberVo.setEmail(email);
						memberVo.setAddress(address);
						memberVo.setBirth(birth);
						memberVo.setPlatform(platform);
						memberVo.setApiEmail(apiEmail);
						memberDao.joinMember2(memberVo);
					}
					memberVo.setPhone(phone);
					int idx=((ArrayList<MemberVo>)memberDao.selectIdxByPhone(memberVo)).get(0).getIdx();
					session.setAttribute("idx",idx);
				return "redirect:main";
			}
	
	}
	
	
	@RequestMapping(value = "/normalLogin", method = RequestMethod.GET)
	@ResponseBody
	public String normalLogin(HttpSession session,String id,String pw) {
		
		memberVo.setId(id);
		ArrayList<MemberVo> listid =(ArrayList<MemberVo>)memberDao.selectIdxById(memberVo);
		
		memberVo.setPw(pw);
		ArrayList<MemberVo> listpw =(ArrayList<MemberVo>)memberDao.selectIdxByPw(memberVo);
		
		System.out.println(listid.size()+""+listpw.size());
		if(listid.size()!=0&&listpw.size()!=0) {
			System.out.println("로그인 성공 !");
			 session.setAttribute("idx",listpw.get(0).getIdx());
			return "1";
		}
		else {
			if(listpw.size()!=0) {
				 System.out.println("존재하지 않는 아이디");
				 return "2";
			}else if(listid.size()!=0){
				System.out.println("존재하지 않는 비밀번호");
				return "3";
			}else {
				System.out.println("로그인 실패 !");
				return "4";
			}
		}
		
	}

	
	
	
	
	
}