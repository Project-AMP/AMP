package com.jj.amp;

import java.io.UnsupportedEncodingException;
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

import com.jj.dao.MemberDao;
import com.jj.dao.RankDao;
import com.jj.vo.MemberVo;
import com.jj.vo.ReviewVo;
import com.jj.dao.ReviewDao;
import com.jj.vo.SearchRankVo;
import com.jj.dao.AcademyDao;
import com.jj.dao.AcademyStyleDao;
import com.jj.vo.AcademyRankVo;
import com.jj.vo.AcademyVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	@Autowired
	MemberDao memberDao;
	@Autowired
	MemberVo memberVo;
	@Autowired
	AcademyDao academyDao;
	@Autowired
	AcademyVo academyVo;
	@Autowired
	SearchRankVo searchRankVo;
	@Autowired
	AcademyRankVo academyRankVo;
	@Autowired
	RankDao rankDao;
	@Autowired
	ReviewVo reviewVo;
	@Autowired
	ReviewDao reviewDao;
	@Autowired
	AcademyStyleDao academyStyleDao;
	
	
	@RequestMapping(value = {"/","/main"})
	public String sitemain(Locale locale, Model model) {
		rankDao.deleteSearch();
		rankDao.deleteAcademy();
		ArrayList<SearchRankVo> searchRank= (ArrayList<SearchRankVo>)rankDao.selectSearch();
		model.addAttribute("searchRank",searchRank);
		ArrayList<AcademyRankVo> academyRank= (ArrayList<AcademyRankVo>)rankDao.selectAcademy();
		model.addAttribute("academyRank",academyRank);
		
		return "site/main/main";
	}
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String footer(Locale locale, Model model) {

		return "site/main/footer";
	}
	@RequestMapping(value = "/academyMain", method = RequestMethod.GET)
	public String academy(Locale locale, Model model,int academyidx) {
	

		academyRankVo.setAcademy(academyidx);
		rankDao.insertAcademy(academyRankVo);
		model.addAttribute("banner_style",academyStyleDao.select_banner(academyidx));
		return "academy/main/academyMain";
	}
	@RequestMapping(value = "/topBar")
	public String topBar(Locale locale, Model model,HttpSession session) {
		if(session.getAttribute("idx")!=null) {
			System.out.println(session.getAttribute("idx")+"");
			memberVo.setIdx(Integer.parseInt(session.getAttribute("idx")+""));
			ArrayList<MemberVo> list= (ArrayList<MemberVo>) memberDao.selectAllByIdx(memberVo);
			model.addAttribute("name",list.get(0).getName());
		}
		
		return "site/main/topBar";
	}
	@RequestMapping(value = "/searchbar", method = RequestMethod.GET)
	public String searchbar(Model model, String keyword) {
		
		academyVo.setKeyword(keyword);
		ArrayList<AcademyVo> list=(ArrayList<AcademyVo>)academyDao.searchbar(academyVo);
		model.addAttribute("list",list);
		
		return "site/main/searchbar";
	}
	@RequestMapping(value = "/tagSearch", method = RequestMethod.GET)
	public String tagsearch(Locale locale, Model model, String keyword) {
	
		System.out.println(keyword);
		academyVo.setKeyword(keyword);
		searchRankVo.setSearch(keyword);
		rankDao.insertSearch(searchRankVo);
		ArrayList<AcademyVo> list=(ArrayList<AcademyVo>)academyDao.selectTag(academyVo);
		model.addAttribute("list",list);
		
		return "site/main/tagsearch";
	}
	

	@RequestMapping(value = "/academyMain_topBar")
	public String academyMain_topBar(Locale locale, Model model,HttpSession session,int academyidx) {
		if(session.getAttribute("idx")!=null) {
			System.out.println(session.getAttribute("idx")+"");
			memberVo.setIdx(Integer.parseInt(session.getAttribute("idx")+""));
			ArrayList<MemberVo> list= (ArrayList<MemberVo>) memberDao.selectAllByIdx(memberVo);
			model.addAttribute("name",list.get(0).getName());
			
		}
		model.addAttribute("banner_style",academyStyleDao.select_banner(academyidx));
		model.addAttribute("academyName",academyDao.selectName(academyidx));
		
		return "academy/main/academyMain_topBar";
	}
	@RequestMapping(value = "/notLogPage")
	public String notLogPage(Locale locale, Model model,HttpSession session) {
		
		return "site/main/notLogPage";
	}
	@RequestMapping(value = "/insertSearch")
	public void insertSearch(Locale locale, Model model,String keyword) {
		searchRankVo.setSearch(keyword);
		rankDao.insertSearch(searchRankVo);
		

	}
	
	@RequestMapping(value = "/academy_review", method = RequestMethod.GET)
	public String academy_review(Locale locale, Model model) {
		ArrayList<ReviewVo> list = (ArrayList<ReviewVo>)reviewDao.select();
		model.addAttribute("list", list);
		

		
		return "academy/main/academy_review";
	}
	
	@RequestMapping(value = "/academy_review_write.do", method = RequestMethod.GET)
	public void academy_review_write_do(HttpSession session, String content, int academyidx) {
		System.out.println(content);
		System.out.println(academyidx);
		
		int memberidx = (int)session.getAttribute("idx");
		System.out.println(memberidx);
		
		reviewVo.setAcademy(academyidx);
		reviewVo.setCon(content);
		reviewVo.setWriter(memberidx);
		reviewDao.insertReview(reviewVo);
		
		
	}
	@RequestMapping(value = "/academy_review_delete.do", method = RequestMethod.GET)
	public void academy_review_delete_do(HttpSession session, int idx) {
		System.out.println(idx);
		
		reviewDao.deleteReview(idx);
		/*
		 * Map<String, String> map = new HashMap<String, String>();
		 * map.put("academyidx", academyidx); map.put("idx", idx);
		 */

	}
}
