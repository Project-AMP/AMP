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

import com.jj.dao.AcademyDao;
import com.jj.dao.ClassDao;
import com.jj.dao.RoomDao;
import com.jj.dao.ConsultDao;
import com.jj.vo.AcademyVo;
import com.jj.vo.ClassVo;
import com.jj.vo.RoomVo;
import com.jj.vo.ConsultVo;

@Controller
public class ConsultController {
	@Autowired
	ClassDao classDao;
	@Autowired
	ClassVo classVo;
	@Autowired
	RoomDao roomDao;
	@Autowired
	RoomVo roomVo;
	@Autowired
	ConsultDao consultDao;
	@Autowired
	ConsultVo consultVo;
	@Autowired
	AcademyDao academyDao;
	@Autowired
	AcademyVo academyVo;
	
	@RequestMapping(value = "/consult", method = RequestMethod.GET)
	public String consult(Locale locale, Model model, int academyidx) {

		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.getKategories(academyidx);
		model.addAttribute("kategories",list);
				
		return "academy/consult/consult";
	}
	
	@RequestMapping(value = "/consultList", method = RequestMethod.GET)
	public String consultList(Locale locale, Model model) {
		/* 관리자_수강 상담 관리 */
		
		return "academy/consult/consultList";
	}

	@RequestMapping(value = "/consultList_kit", method = RequestMethod.GET)
	public String consultList_kit(Locale locale, Model model,int academyidx,String state,String keyword) {
		/* 관리자_수강 상담 관리 */
		if(state==null)
			state="";
		if(keyword==null)
			keyword="";
		Map<String, String> map=new HashMap<String, String>();
		map.put("academy", academyidx+"");
		map.put("state",state);
		map.put("keyword",keyword);
		ArrayList<ConsultVo> list =(ArrayList<ConsultVo>)consultDao.consultList(map);
		model.addAttribute("list",list);
		return "academy/consult/consultList_kit";
	}
	
	@RequestMapping(value = "/joinConsult.do", method = RequestMethod.GET)
	public String joinconsultdo(HttpSession session, int academyidx, String stuname, String phone, String classIdx, String coment) {
		
		consultVo.setStuname(stuname); 
		consultVo.setPhone(phone);
		consultVo.setComent(coment);
		consultVo.setClassidx(classIdx); 
		consultDao.insertConsult(consultVo);

		return "redirect:academyMain?academyidx="+academyidx;

	}
	@RequestMapping(value = "/updateState", method = RequestMethod.GET)
	public void updateState(int idx) {		
		consultDao.updateState(idx);

	}
	
}
