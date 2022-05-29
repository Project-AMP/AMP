package com.jj.amp;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jj.dao.ClassDao;
import com.jj.dao.CouponDao;
import com.jj.dao.MainserviceDao;
import com.jj.dao.MemberDao;
import com.jj.vo.ClassVo;
import com.jj.vo.CouponVo;
import com.jj.vo.MainserviceVo;
import com.jj.vo.MemberVo;

@Controller
public class MainserviceController {
	
	@Autowired
	MainserviceVo mainserviceVo;
	@Autowired
	MainserviceDao mainserviceDao;
	@Autowired
	ClassVo classVo;
	@Autowired
	ClassDao classDao;
	@Autowired
	CouponVo couponVo;
	@Autowired
	CouponDao couponDao;
	@Autowired
	MemberVo memberVo;
	@Autowired
	MemberDao memberDao;
	
	
	@RequestMapping(value = "/communityMain", method = RequestMethod.GET)
	public String community(Locale locale, Model model) {

		return "site/mainservice/community/communityMain";
	}
	@RequestMapping(value = "/community_sidebar", method = RequestMethod.GET)
	public String community_sidebar(Locale locale, Model model) {

		return "site/mainservice/community/community_sidebar";
	}
	@RequestMapping(value = "/cloud", method = RequestMethod.GET)
	public String cloud(Locale locale, Model model) {

		return "site/mainservice/cloud/cloud";
	}
	@RequestMapping(value = "/myinfoMain", method = RequestMethod.GET)
	public String myinfoMain(Locale locale, Model model,HttpSession session) {
		int member=(int)session.getAttribute("idx");
		memberVo.setIdx(member);

		model.addAttribute("list",memberDao.selectAllByIdx(memberVo));
		return "site/mainservice/myinfo/myinfoMain";
	}
	@RequestMapping(value = "/myinfo_sidebar", method = RequestMethod.GET)
	public String myinfo_sidebar(Locale locale, Model model) {

		return "site/mainservice/myinfo/myinfo_sidebar";
	}
	@RequestMapping(value = "/myinfo_classcheck", method = RequestMethod.GET)
	public String myinfo_classcheck(Locale locale, Model model,HttpSession session) {
		
		/* 수강_수강현황 */
		int member=(int)session.getAttribute("idx");
		classVo.setMember(member);
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.myClassListAll(classVo);
		
		model.addAttribute("list", list);

		return "site/mainservice/myinfo/myinfo_classcheck";
	}
	@RequestMapping(value = "/myinfo_completeclasscheck", method = RequestMethod.GET)
	public String myinfo_completeclasscheck(Locale locale, Model model,HttpSession session) {

		/* 완료된 강의 */
		int member=(int)session.getAttribute("idx");
		classVo.setMember(member);
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.myClassListAll(classVo);
		
		model.addAttribute("list", list);
		return "site/mainservice/myinfo/myinfo_completeclasscheck";
	}
	@RequestMapping(value = "/myinfo_coupon", method = RequestMethod.GET)
	public String myinfo_coupon(Locale locale, Model model,HttpSession session) {

		/* 내 정보_쿠폰 */
		int member=(int)session.getAttribute("idx");
		Map<String,Integer> map=new HashMap<String, Integer>();
		map.put("member", member);
		ArrayList<CouponVo> list= (ArrayList<CouponVo>)couponDao.myCouponListAll(map);
		model.addAttribute("list",list);
		
		return "site/mainservice/myinfo/myinfo_coupon";
	}
	@RequestMapping(value = "/myinfo_payment", method = RequestMethod.GET)
	public String myinfo_payment(Locale locale, Model model,HttpSession session) {
		/* 내 정보_결제내역 */
		int member=(int)session.getAttribute("idx");
		classVo.setMember(member);
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.myClassListAll(classVo);
		
		model.addAttribute("list", list);
		
		
		return "site/mainservice/myinfo/myinfo_payment";
	}
	@RequestMapping(value = "/myinfo_mms", method = RequestMethod.GET)
	public String myinfo_mms(Locale locale, Model model) {

		return "site/mainservice/myinfo/myinfo_mms";
	}
	@RequestMapping(value = "/timetable", method = RequestMethod.GET)
	public String timetable(Locale locale, Model model,HttpSession session) {
		int member = (int)session.getAttribute("idx");

		return "site/mainservice/myinfo/timetable";
	}

	@RequestMapping(value = "/event_sidebar", method = RequestMethod.GET)
	public String event_sidebar(Locale locale, Model model) {

		return "site/mainservice/maininfo/event_sidebar";
	}
}
