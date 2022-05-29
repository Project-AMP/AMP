package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.FindidpwVo;


public class FindidpwDao {


	SqlSession sqlSession;
	
	FindidpwDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	// 이름, 핸드폰번호를 가지고 ID찾기
	public List<FindidpwVo> selectById(FindidpwVo vo){
		return sqlSession.selectList("com.jj.mappers.findidpwMapper.selectById", vo);
	}
	
	
	// 비밀번호 업데이트
	public int updatePw(FindidpwVo vo) {
		return sqlSession.update("com.jj.mappers.findidpwMapper.updatePw", vo);
	}
	
	// 21.03.15 진렬 수정
	// 아이디 찾기 - 아이디 확인 Select
	public String selectId(String id) {
		return sqlSession.selectOne("com.jj.mappers.findidpwMapper.selectid",id);
	}
	
	
	// 21.03.29 진렬 수정
	// 비밀번호 찾기 부분 - 아이디와 핸드폰이 일치하는지 확인하는 Select
	public List<FindidpwVo> selectpw(FindidpwVo vo) {
		return sqlSession.selectList("com.jj.mappers.findidpwMapper.selectpw", vo);
	}
}
