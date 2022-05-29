package com.jj.amp;

import java.io.UnsupportedEncodingException; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.protobuf.TextFormat.ParseException;
import com.jj.dao.NoticeDao;
import com.jj.vo.MyAlarmListVo;
import com.jj.vo.NoticeVo;

import com.jj.util.PageUtil;
import com.jj.util.Paging;

// 2021-04-11 진렬 수정(공지사항 관련 컨트롤러 입니다.)
@Controller
public class NoticeController {
	
	@Autowired
	NoticeDao noticeDao;
	@Autowired
	NoticeVo noticeVo;
	//@Autowired
	//MyAlarmListVo myAlarmListVo;
	
	
	
	@RequestMapping(value="notice.do")
	public String notice(Model model, String academyidx, Integer page) {
		if(academyidx.equals("0")) {
			return "redirect:main";
		}
	
		return "academy/message/notice";
	}
	@RequestMapping(value="notice_kit")
	public String noticeKit(Model model, String academyidx, Integer page ,String condition,String keyword) {

		
		// selectList(1) => 학원 인덱스 번호가 1이라고 가정
		noticeVo.setAcademy(Integer.parseInt(academyidx));
		
		// 페이지 초기화(현재 페이지)
		int nowPage = 1;
		
		if(page != null) {
			nowPage = page;
		}
		
		
		//한 페이지에 표시되는 게시물의 시작과 끝번호를 계산
		int start = (nowPage - 1) * PageUtil.Board.BLOCKLIST + 1;
		int end = start + PageUtil.Board.BLOCKLIST - 1;
		
		int academy = noticeVo.getAcademy(); // 학원 idx
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("start", start+"");
		map.put("end", end+"");
		map.put("academy", academy+"");
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		
		// 공지사항 전체목록 가져오기
		List<NoticeVo> noticelist = null;
		noticelist = noticeDao.selectList( map );

		// 전체 게시물 수 구하기
		int row_total = noticeDao.getRowTotal(map);

		// 하단 페이지메뉴 생성하기
		String pageMenu = Paging.getPaging("notice.do", nowPage, row_total, PageUtil.Board.BLOCKLIST, PageUtil.Board.BLOCKPAGE, academyidx);
		
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("pageMenu", pageMenu);

		// 세션에 기록되어 있는 정보를 지운다
		//request.getSession().removeAttribute("show");
		
		
		//ArrayList<NoticeVo> noticelist = (ArrayList<NoticeVo>)noticeDao.selectNotice(noticeVo);
		//model.addAttribute("noticelist", noticelist);
		
		return "academy/message/notice_kit";
	}
	
	
	// 글쓰기 화면으로 이동
	@RequestMapping(value="noticeWrite.do")
	public String noticeWrite(Model model, String academyidx) {
		
		System.out.println("테에스트 >>> " + academyidx);
		
		return "academy/message/noticeWrite";
	}
	
	
	// 공지사항 글쓰기 저장
	
	/*
	 * @RequestMapping(value="notice_save.do") public String notice_save(Model
	 * model, String title, String content, int academyidx) throws
	 * UnsupportedEncodingException {
	 * 
	 * System.out.println("title >>> " + title + "content >>> " + content);
	 * 
	 * 
	 * Map<String, String> map = new HashMap<String, String>();
	 * 
	 * map.put("academy", academyidx+""); int num=noticeDao.getRowTotal(map);
	 * 
	 * noticeVo.setNum(num+1); noticeVo.setTitle(title); noticeVo.setCon(content);
	 * noticeVo.setAcademy(academyidx);
	 * 
	 * 
	 * int result = noticeDao.insertNotice(noticeVo);
	 * 
	 * if(result == 1) { return "redirect:notice.do?academyidx=" + academyidx; }else
	 * { return "academy/message/noticeWrite"; }
	 * 
	 * }
	 */
	 // notice_save()
	
	

	
	
	// 공지사항 글쓰기 저장
		@RequestMapping(value = "notice_write_alarm_save.do")
		public String notice_save(Model model, String title,  @RequestBody String notice_Data)
				throws UnsupportedEncodingException, org.json.simple.parser.ParseException {
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(notice_Data);
			
			String title_id = obj.get("title_id").toString();
			String title_content = obj.get("title_content").toString();
			int academy_idx = Integer.parseInt(obj.get("notice_academyidx").toString());
			
			
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("academy", academy_idx+"");
			int num=noticeDao.getRowTotal(map);
			
			
			
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			
			// 해당 학원을 즐겨찾기 한 사람 + 수강생 및 강사를 조회
			// list 변수에는 해당학원(ex : idx가 3)을 즐겨찾기한 사람 및 수강생 강사의 idx가 들어있음
			List<String> members = new ArrayList<String>();
			
			List<Map<String, Object>> staffList = new ArrayList<Map<String, Object>>();
			noticeVo.setNum(num+1);
			noticeVo.setTitle(title_id);
			noticeVo.setCon(title_content);
			noticeVo.setAcademy(academy_idx);
			
			noticeDao.insertNotice(noticeVo); // 여기서 insert한 공지사항의 idx를 noticevo에 저장함
			int getidx = noticeVo.getIdx();
			
			System.out.println("getidx >>> " + getidx);
			
			String notice_title = noticeDao.select_Notice_title(getidx);
			
			// 학원 인덱스 put
			paramMap.put("academy_idx", academy_idx); // ex : 3
			

			// academyindex를 가지고 학원 이름 조회
			String academyName = noticeDao.selectAdcademyName(academy_idx);
			
			// 학원 알림 내용 put
			paramMap.put("academyName", academyName);
			paramMap.put("content", getidx);

			Map<String, Object> staffMap;
			
			members = noticeDao.selectMembers(academy_idx);

			for (int i = 0; i < members.size(); i++) {
				staffMap = new HashMap<String, Object>();

				staffMap.put("member", members.get(i).toString());

				staffList.add(staffMap);
			}

			paramMap.put("staffList", staffList);

			noticeDao.insertMembers(paramMap);
			
			return "redirect:notice.do?academyidx=" + academy_idx;

		}// notice_save() 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 공지사항 상세보기
	@RequestMapping(value="notice_detail.do")
	public String notice_detail(Model model, String academyidx, String idx) {
		
		
		noticeDao.viewUp(Integer.parseInt( idx));
		//System.out.println("pppppp >>>> "+academyidx + "," + "ooooooo" + idx);
		Map<String, String> map = new HashMap<String, String>();
		map.put("academyidx", academyidx);
		map.put("idx", idx);
		
		NoticeVo notice_detail = null;
		notice_detail = noticeDao.getNoticeOne(map);
		
		model.addAttribute("notice_detail", notice_detail);
		
		return"academy/message/noticeDetail";
	}
	
	
	
	// 공지사항 글 삭제
	@RequestMapping(value="notice_delete.do")
	public String notice_delete(Model model, String academyidx, String idx) throws UnsupportedEncodingException {
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("academyidx", academyidx);
		map.put("idx", idx);
		
		int result = noticeDao.deleteNotice(map);
		
		if(result == 1) {
			return "redirect:notice.do?academyidx=" + academyidx;
		}
		return "academy/message/noticeDetail";
		
	}
	
	
	// 공지사항 글수정페이지 이동
	@RequestMapping(value="notice_update.do")
	public String notice_update(Model model, String academyidx, String idx) {
		
		NoticeVo notice_update_detail = null;
		notice_update_detail = noticeDao.select_update_notice(idx);
		model.addAttribute("notice_update_detail", notice_update_detail);
		
		
		return "academy/message/noticeUpdate";
	}
	
	
	// 공지사항 글수정 업데이트
	@RequestMapping(value="notice_update2.do")
	public String notice_update2(Model model, String title, String content, String academyidx, String idx) throws UnsupportedEncodingException {

		
		noticeVo.setTitle(title);
		noticeVo.setCon(content);
		noticeVo.setIdx(Integer.parseInt(idx));
		
		int result = noticeDao.updateNotice(noticeVo);
		
		if(result == 1) {
			return "redirect:notice.do?academyidx=" + academyidx;
		}else {
			return "academy/message/noticeWrite";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 내가 즐겨찾기 및 수강생 또는 강사인지 확인
		@RequestMapping(value = "myAcademy_notice", method = RequestMethod.GET)
		@ResponseBody
		public String myAcademy_notice(Locale locale, Model model, int academyidx, HttpSession session) {

			int member = (int) session.getAttribute("idx");

			Map<String, Object> noticeMap = new HashMap<String, Object>();
			noticeMap.put("member", member);
			noticeMap.put("academy_idx", academyidx);

			String result = noticeDao.selectbookmark(noticeMap);
			String result2 = noticeDao.selectacademy_member(noticeMap);

			if (result == null && result2 == null)
				return "false";
			else
				return "true";
		}

		// 내 공지사항 알림 목록 불러오기(topbar 좌측 상단 알림 클릭시)
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "myNoticeAlarmList.do")
		public String myNoticeAlarmList(Locale locale, Model model, int user_idx, HttpSession session) {
			
			// List 객체 생성
			List<MyAlarmListVo> myNoticeAlarmList = new ArrayList<MyAlarmListVo>();
			
			// 유저 idx를 가지고 알림을 조회 후 List에 초기화
			myNoticeAlarmList = noticeDao.selectMyAlarmList(user_idx);
			
			
			
			model.addAttribute("list", myNoticeAlarmList);

			return "academy/message/myAlarmList";

		}
	
}























