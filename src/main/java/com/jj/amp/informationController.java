package com.jj.amp;

import java.awt.Checkbox;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jj.dao.CheckDao;
import com.jj.dao.ClassDao;
import com.jj.dao.ClassMemberDao;
import com.jj.dao.CouponDao;
import com.jj.util.CheckDayOfWeek;
import com.jj.vo.CheckVo;
import com.jj.vo.ClassMemberVo;
import com.jj.vo.ClassVo;
import com.jj.vo.CouponVo;

import antlr.collections.List;


@Controller
public class informationController {

	@Autowired
	ClassVo classVo;
	@Autowired
	ClassDao classDao;
	@Autowired 
	CouponDao couponDao;
	@Autowired
	CouponVo couponVo;
	@Autowired
	CheckVo checkVo;
	@Autowired
	CheckDao checkDao;
	@Autowired
	ClassMemberVo classMemberVo;
	@Autowired
	ClassMemberDao classMemberDao;
	
	
	
	@RequestMapping(value = "/classcheck", method = RequestMethod.GET)
	public String classcheck(Locale locale, Model model,HttpSession session,int academyidx) {
		/* 수강_수강현황 */
		int member=(int)session.getAttribute("idx");
		classVo.setMember(member);
		classVo.setAcademy(academyidx);
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.myClassList(classVo);
		
		model.addAttribute("list", list);
		return "academy/information/classcheck";
		
	}
	@RequestMapping(value = "/getCheckKit", method = RequestMethod.GET)
	public String getCheckKit(int classIdx , Model model,HttpSession session) {//출석채크 학생용

				int member =(int)session.getAttribute("idx");	
				ArrayList<String[]> dowList = new ArrayList<String[]>();
				ArrayList<CheckVo> checkList = new ArrayList<CheckVo>();
				
				//date 검색
				classVo =classDao.selectClass(classIdx);
				String dow= classVo.getTime();
				String sDay=classVo.getS_date();
				String eDay = classVo.getE_date();	
				CheckDayOfWeek cdow = new CheckDayOfWeek(dow,sDay,eDay);
				dowList=cdow.getDow();
				
				//check검색
				checkVo.setClass_idx(classIdx);
				checkVo.setMember(member);
				checkList = (ArrayList<CheckVo>)checkDao.selectByStudent(checkVo);
				
				model.addAttribute("dowList",dowList);
				model.addAttribute("checkList",checkList);
				
				return "academy/information/check_kit";

	}

	@RequestMapping(value = "/getTCheckKit", method = RequestMethod.GET)
	public String getTCheckKit(int classIdx , Model model) {//출석채크 강사용
		
		ArrayList<String[]> dowList = new ArrayList<String[]>();
		ArrayList<ClassMemberVo> memberList = new ArrayList<ClassMemberVo>();
		ArrayList<CheckVo> checkList = new ArrayList<CheckVo>();
		
		//date 검색
		classVo =classDao.selectClass(classIdx);
		String dow= classVo.getTime();
		String sDay=classVo.getS_date();
		String eDay = classVo.getE_date();	
		CheckDayOfWeek cdow = new CheckDayOfWeek(dow,sDay,eDay);
		dowList=cdow.getDow();
		
		//맴버 검색
		classMemberVo.setClassIdx(classIdx);
		memberList= (ArrayList<ClassMemberVo>)classMemberDao.selectClassMember(classMemberVo);
		
		//check검색
		checkVo.setClass_idx(classIdx);
		checkList = (ArrayList<CheckVo>)checkDao.selectByTeacher(checkVo);
		
		model.addAttribute("dowList",dowList);
		model.addAttribute("memberList",memberList);
		model.addAttribute("checkList",checkList);
		
		return "academy/information/tcheck_kit";
		
	}
	@RequestMapping(value = "/saveCheck")
	public void saveCheck(Locale locale, Model model,int classIdx, String [] chk) {
		for(int i=0; i<chk.length;i++) {
			if(chk[i]!=null&&!chk[i].equals("0")) {
				String vmd[] = chk[i].split("_");
				checkVo.setClass_idx(classIdx);
				checkVo.setState(Integer.parseInt(vmd[0]));
				checkVo.setMember(Integer.parseInt(vmd[1]));
				checkVo.setDate(vmd[2]);
				if(checkDao.hasCon(checkVo)==0) {
					checkDao.insert(checkVo);
				}else {
					checkDao.update(checkVo);
				}
				
			}
		}
		
	}
	
	@RequestMapping(value = "/completeclasscheck", method = RequestMethod.GET)
	public String completeclasscheck(Locale locale, Model model,HttpSession session,int academyidx) {
		/* 수강현황_수강 완료된 강의 */
		int member=(int)session.getAttribute("idx");
		classVo.setMember(member);
		classVo.setAcademy(academyidx);
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.myClassList(classVo);
		
		model.addAttribute("list", list);
		return "academy/information/completeclasscheck";
	}
	@RequestMapping(value = "/my_info_sidebar", method = RequestMethod.GET)
	public String my_info_sidebar(Locale locale, Model model) {
		/* 내 정보_내 강의 */
		
		return "academy/information/my_info_sidebar";
	}

	/* 쿠폰 */
	@RequestMapping(value = "/coupon", method = RequestMethod.GET)
	public String coupon(Locale locale, Model model,int academyidx,HttpSession session) {

		
		return "academy/information/coupon";
	}
	@RequestMapping(value = "/coupon_kit", method = RequestMethod.GET)
	public String coupon_kit(Locale locale, Model model,int academyidx,HttpSession session) {
		/* 내 정보_쿠폰 */
		int member=(int)session.getAttribute("idx");
		Map<String,Integer> map=new HashMap<String, Integer>();
		map.put("academy", academyidx);
		map.put("member", member);
		
		ArrayList<CouponVo> list= (ArrayList<CouponVo>)couponDao.myCouponList(map);
		model.addAttribute("list",list);
		
		
		return "academy/information/coupon_kit";
	}
	
	
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(Locale locale, Model model,int academyidx,HttpSession session) {
		/* 내 정보_결제내역 */
		int member=(int)session.getAttribute("idx");
		classVo.setMember(member);
		classVo.setAcademy(academyidx);
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.myClassList(classVo);
		
		model.addAttribute("list", list);
		return "academy/information/payment";
	}

}
