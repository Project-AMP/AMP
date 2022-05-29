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
import org.springframework.web.bind.annotation.ResponseBody;

import com.jj.vo.AcademyMemberVo;
import com.jj.vo.AcademyVo;
import com.jj.vo.ClassMemberVo;
import com.jj.vo.ClassVo;
import com.jj.vo.CouponVo;
import com.jj.vo.RoomVo;
import com.jj.vo.pagingVo;
import com.jj.dao.AcademyDao;
import com.jj.dao.AcademyMemberDao;
import com.jj.dao.ClassDao;
import com.jj.dao.ClassMemberDao;
import com.jj.dao.RoomDao;



@Controller
public class ClassController {
	@Autowired
	ClassDao classDao;
	@Autowired
	ClassMemberDao classMemberDao;
	@Autowired
	ClassVo classVo;
	@Autowired
	ClassMemberVo classMemberVo;
	@Autowired
	AcademyDao academyDao;
	@Autowired
	AcademyMemberDao academyMemberDao;
	@Autowired
	AcademyVo academyVo;
	@Autowired
	AcademyMemberVo academyMemberVo;
	@Autowired
	RoomDao roomDao;
	@Autowired
	RoomVo roomVo;
	
	@RequestMapping(value = "/class_sidebar", method = RequestMethod.GET)
	public String class_sidebar(Locale locale, Model model) {
		/* 내 정보_내 강의 */
		
		return "academy/class/class_sidebar";
	}
	
	@RequestMapping(value = "/myclass", method = RequestMethod.GET)
	public String myclass(Locale locale, Model model) {
		/* 내 정보_내 강의 */
		
		return "academy/class/myclass";
	}
	
	
	
	@RequestMapping(value = "/registration_teacher", method = RequestMethod.GET)
	public String registration_teacher(Locale locale, Model model) {
		/* 수강신청_강사조회 */
		
		return "academy/class/registration_teacher";
	}
	@RequestMapping(value = "/registration_teacherclassList", method = RequestMethod.GET)
	public String registration_teacherclassList(Locale locale, Model model) {
		/* 강사 소개_강의 목록 */

		return "academy/class/registration_teacherclassList";
	}

	@RequestMapping(value = "/registration_teacherinfo", method = RequestMethod.GET)
	public String registration_teacherinfo(Locale locale, Model model) {
		/* 강사 소개_강사 소개 */

		return "academy/class/registration_teacherinfo";
	}

	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Locale locale, Model model, int academyidx,String nowPage,
			                         String cntPerPage, HttpSession session) {
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if (nowPage == null) {
			nowPage = "1";
		}else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		// 카테고리 목록
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.getKategories(academyidx);
		model.addAttribute("kategories",list);
		
		// 회원 쿠폰 리스트 불러오기 - start
		int myidx = (int)session.getAttribute("idx");
		Map<String, Object> mymap = new HashMap<String, Object>();
				
		mymap.put("member_idx", myidx);
		mymap.put("academy_idx", academyidx);
		
		ArrayList<CouponVo> mycouponList = (ArrayList<CouponVo>) classDao.selectMyCoupon(mymap);
		model.addAttribute("mycouponList", mycouponList);
		// 회원 쿠폰 리스트 불러오기 - end
		
		
		// 페이징
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("academy",academyidx+"");
		map.put("kategorie","");
		map.put("name","");
		map.put("member",myidx+"");
		
		int total = classDao.get_sugang_count(map);
		
		//System.out.println("nowPage >> " + nowPage + " cntPerPage >> " + cntPerPage);
		System.out.println("nowPage >>>>>>>> " + nowPage );
		classVo = new ClassVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", classVo);
		
		return "academy/class/registration";
	}
	
	@RequestMapping(value = "/joinClass.do", method = RequestMethod.GET)//수강신청
	public String joinclassdo(Locale locale, Model model,int academyIdx,int classIdx,HttpSession session) {
	
		int member=(int)session.getAttribute("idx");
		academyMemberVo.setMember(member);
		academyMemberVo.setAcademy(academyIdx);
		academyMemberVo.setRanking("S"); //S학생 T강사
		classMemberVo.setMember(member);
		classMemberVo.setClassIdx(classIdx);
		
		if(academyMemberDao.selectByAM(academyMemberVo).size()==0)
			academyMemberDao.insertMember(academyMemberVo);
		
		classMemberDao.insertMember(classMemberVo);
		
		return "redirect:academyMain?academyidx="+academyIdx;
	}
	@RequestMapping(value = "/isInClass", method = RequestMethod.GET)//수강신청시 이미 수강된 강의 인지 확인
	@ResponseBody
	public String isInClass(int classIdx,HttpSession session) {
		int member=(int)session.getAttribute("idx");
		classMemberVo.setClassIdx(classIdx);
		classMemberVo.setMember(member);
		int i=classMemberDao.isInClass(classMemberVo);
		if(i==0) {
			return "0";
		}
		
		return "1";
	}
	// 수강신청 리스트
		@RequestMapping(value = "/classList_kit", method = RequestMethod.GET)
		public String classList(String kategorie,String keyword,int academyidx,Model model,  HttpSession session,
				                              String nowPage,String cntPerPage, pagingVo vo) {

			if(kategorie == null || kategorie == "null")
				kategorie="";
			
			if(keyword == null || keyword == "null")
				keyword="";

			
			// 페이징
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			}else if (nowPage == null) {
				nowPage = "1";
			}else if (cntPerPage == null) {
				cntPerPage = "5";
			}
			
			int member = (int)session.getAttribute("idx");
			
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("academy",academyidx+"");
			map.put("kategorie",kategorie);
			map.put("name",keyword);
			map.put("member",member+"");
			
			int total = classDao.get_sugang_count(map);
			
			classVo = new ClassVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			map.put("start", classVo.getStart());
			map.put("end", classVo.getEnd());
			//model.addAttribute("paging", classVo);

			ArrayList<ClassVo> list= (ArrayList<ClassVo>)classDao.getClassList(map);
			
			model.addAttribute("list",list);
			
			return "academy/class/classList_kit";
		}
	
	@RequestMapping(value="/class_member_apply.do", method = RequestMethod.POST)
	public String class_apply(Model model, HttpSession session, int academyIdx, String classIdx, String sale) {
		
		int memberidx = (int)session.getAttribute("idx");
		
		double sale_;
		
		if(sale.equals("")) {
			sale_ = 0;
		}else {
			sale_ = Double.valueOf(sale);
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("academyIdx", academyIdx);
		map.put("member_idx", memberidx);
		map.put("classIdx", classIdx);
		map.put("sale", sale_);
		
		academyMemberVo.setAcademy(academyIdx);
		academyMemberVo.setMember(memberidx);
		academyMemberVo.setRanking("T");
		
		
		classDao.insertclass(map);
		
		
		
		Integer myidx = academyMemberDao.selectByAM2(academyMemberVo);
		Integer academy_member_idx = myidx;
		
		//System.out.println("academy_member_idx >>> " + academy_member_idx);
		
		if(academy_member_idx != null)
		{
			System.out.println("최소 한번이상 수강신청을 했을경우");
			return "redirect:registration?academyidx=" + academyIdx;
		}
		else {
			System.out.println("첫 수강신청일 경우");
			academyMemberDao.insertMember(academyMemberVo);
			return "redirect:registration?academyidx=" + academyIdx;
		}
		
		
	}
	
		
	
}

