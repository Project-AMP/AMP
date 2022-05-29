package com.jj.amp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jj.dao.RimDao;
import com.jj.vo.RimVo;

@Controller
public class RimController {
	
	@Autowired
	RimDao rimdao;
	
	
	// 강사 목록 검색 컨트롤러
	@RequestMapping(value="academy_teacher_list")
	public String academy_teacher_list(Model model, Integer academy_idx, Integer teacher_member, Integer id_name, String content) {
		
		System.out.println("academy_idx " + academy_idx);
		System.out.println("teacher_member " + teacher_member);
		System.out.println("id_name " + id_name);
		System.out.println("content " + content);
		
		if(teacher_member == null && id_name==null && content == null) {
			//System.out.println("aaaaaaaa");
			List<RimVo> teacher_list = new ArrayList<RimVo>();
			 
			 teacher_list = rimdao.selectTeacherList(academy_idx);
			 model.addAttribute("teacher_list", teacher_list);
			 
		}else if(teacher_member == 0){
			
			//System.out.println("bbbbbbbb");
			
			List<RimVo> teacher_list_search = new ArrayList<RimVo>();
			 
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("academy_idx", academy_idx);
			map.put("teacher_member", teacher_member);
			map.put("id_name", id_name);
			map.put("content", content);
			map.put("TS", "T");
			
			teacher_list_search = rimdao.select_Teacher_Member_List_search(map);
			
			//System.out.println(">>> " + teacher_list_search);
			
			model.addAttribute("teacher_list", teacher_list_search);
		}
		 
		
		return "academy/admin/teacher_list_kit";
	}
	
	
	// 강사 탈퇴 컨트롤러
	@RequestMapping(value="academy_teacher_del")
	@ResponseBody
	public String academy_teacher_del(Model model, String[] teacher_idx_list, int academy_idx) {
		
		/*
		 * System.out.println("academy_idx >>> " + academy_idx); for(int i=0;
		 * i<teacher_idx_list.length; i++) { System.out.println(teacher_idx_list[i] +
		 * " >>> "+i +"번째 값"); }
		 */
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("academy_idx", academy_idx);
		map.put("teacher_idx_list", teacher_idx_list);
		
		int result = rimdao.deleteTeacher(map);
		
		if(result > 0) {
			return "true";
		}else {
			return "false";
		}
		
		//return "academy/admin/teacher_list_kit";
	}
	
	
	
	
	// 수강생 목록 검색 컨트롤러
	@RequestMapping(value="academy_member_list")
	public String academy_member_list(Model model, Integer academy_idx, Integer teacher_member, Integer id_name, String content) {
		
		
		/*
		 * List<RimVo> member_list = new ArrayList<RimVo>();
		 * 
		 * member_list = rimdao.selectMemberList(academy_idx);
		 * model.addAttribute("member_list", member_list);
		 */
		
		
		
		
		//System.out.println("ccccccc");
		
		List<RimVo> member_list_search = new ArrayList<RimVo>();
		 
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("academy_idx", academy_idx);
		map.put("teacher_member", teacher_member);
		map.put("id_name", id_name);
		map.put("content", content);
		map.put("TS", "S");
		
		member_list_search = rimdao.select_Teacher_Member_List_search(map);
		
		System.out.println(">>> " + member_list_search);
		
		model.addAttribute("member_list", member_list_search);
		
		
			
		return "academy/admin/member_list_kit";
	}
	
	
	
	
	// 수강생 탈퇴 컨트롤러
	@RequestMapping(value="academy_member_del")
	@ResponseBody
	public String academy_member_del(Model model, String[] member_idx_list, int academy_idx) {
			
		/*
		 * System.out.println("academy_idx >>> " + academy_idx); for(int i=0;
		 * i<member_idx_list.length; i++) { System.out.println(member_idx_list[i] +
		 * " >>> "+i +"번째 값  /// 수강생"); }
		 */
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("academy_idx", academy_idx);
		map.put("member_idx_list", member_idx_list);
			
		int result = rimdao.deleteMember(map);
			
		if(result > 0) {
			return "true";
		}else {
			return "false";
		}
		
		//return "academy/admin/teacher_list_kit";
	}
	
	
}
