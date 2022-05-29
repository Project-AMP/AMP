package com.jj.amp;


import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jj.dao.TestDao;
import com.jj.vo.TestVo;

@Controller
public class TestController {
	
	@Autowired
	TestVo testVo;
	@Autowired
	TestDao testDao;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "test/test";
	}
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String test1(Locale locale, Model model) {
		
		return "test/test1";
	}
	@RequestMapping(value = "/testLogin", method = RequestMethod.GET)
	public String testLogin(Locale locale, Model model) {
		
		return "test/testLogin";
	}
	@RequestMapping(value = "/logoutTest", method = RequestMethod.GET)
	public String logoutTest(Locale locale, Model model,HttpSession session) {
		session.invalidate();
		
		return "redirect:login";
	}
	
	@RequestMapping(value = "/testdb", method = RequestMethod.GET)
	public String testdb(Locale locale, Model model) {

		ArrayList<TestVo> list;
		list=(ArrayList<TestVo>)testDao.select();
		
		model.addAttribute("list",list);
		
		return "test/testdb";
	}
	
	
}
