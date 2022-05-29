package com.jj.amp;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jj.dao.EventDao;
import com.jj.vo.EventVo;

@Controller
public class EventController {
	
	@Autowired
	EventVo eventVo;
	@Autowired
	EventDao eventDao;
	
	@RequestMapping(value="/event123")
	public void eventDo(Model model, Integer page,@RequestBody String notice_Data) throws UnsupportedEncodingException, org.json.simple.parser.ParseException {
		System.out.println(notice_Data);
	
	}
	
	@RequestMapping(value = "/event", method = {RequestMethod.GET, RequestMethod.POST})
	public String event(Locale locale, Model model) {
		
		ArrayList<EventVo> list = (ArrayList<EventVo>)eventDao.select();
		model.addAttribute("list", list);
		
		return "site/mainservice/maininfo/event";
	}
	@RequestMapping(value="eventWrite.do")
	public String eventWrite(Model model) {
	
		
		return "site/mainservice/maininfo/eventWrite";
	}
	
	@ResponseBody
	@RequestMapping(value="/event_save.do")
	public String event_save(Model model, String title_id, String title_content, MultipartHttpServletRequest request) throws
		UnsupportedEncodingException {
		
		System.out.println("title_id >!>> " + title_id + " title_content >!>> " + title_content);
		System.out.println("request >>> " + request);
		
		//Map<String, String> map = new HashMap<String, String>();
		
		//map.put("academy", academyidx+""); 
		//int num=eventDao.getRowTotal(map);
		
		//eventVo.setNum(num+1); 
		eventVo.setTitle(title_id);
		eventVo.setCon(title_content);
		//eventVo.setAcademy(academyidx);
	
		int result = eventDao.insertEvent(eventVo);
		
		if(result == 1) 
			return "success";
		else
			return "fail";
	}
	
	@RequestMapping(value="event_detail.do")
	public String event_detail(Model model, String idx) {
		
		
		eventDao.viewUp(Integer.parseInt( idx));
		//System.out.println("pppppp >>>> "+academyidx + "," + "ooooooo" + idx);
		Map<String, String> map = new HashMap<String, String>();
		map.put("idx", idx);
		
		EventVo event_detail = null;
		event_detail = eventDao.getEventOne(map);
		
		model.addAttribute("event_detail", event_detail);
		
		return"site/mainservice/maininfo/eventDetail";
	}
	
	@RequestMapping(value="event_con.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String event_con(Model model, String idx) {
		 
		 String con = eventDao.getEventCon(idx);
		 System.out.println("con >>> " + con);
		 return con;
	}
}
