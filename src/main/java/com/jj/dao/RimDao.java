package com.jj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jj.vo.RimVo;

public class RimDao {
	
	SqlSession sqlSession;
	
	
	
	RimDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	// 강사 목록 가져오기
	public List<RimVo> selectTeacherList(int academy_idx){
		
		return sqlSession.selectList("com.jj.mappers.RimMapper.selectTeacherList", academy_idx);
		
	}
	
	
	// 선택한 강사 삭제하기
	public int deleteTeacher(Map<String, Object> map) {
		return sqlSession.delete("com.jj.mappers.RimMapper.deleteTeacher", map);
	}
	
	
	
	// 수강생 목록 가져오기
	public List<RimVo> selectMemberList(int academy_idx){
		return sqlSession.selectList("com.jj.mappers.RimMapper.selectMemberList", academy_idx);
	}
	
	
	// 선택한 수강생 삭제하기
	public int deleteMember(Map<String, Object> map) {
		return sqlSession.delete("com.jj.mappers.RimMapper.deleteMember", map);
	}
	
	
	// 강사 및 수강생 검색하여 조회
	public List<RimVo> select_Teacher_Member_List_search(Map<String, Object> map){
		return sqlSession.selectList("com.jj.mappers.RimMapper.selectTeacherList_search", map);
	}
	
	
}
