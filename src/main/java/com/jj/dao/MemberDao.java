package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.MemberVo;
import com.jj.vo.TestVo;

public class MemberDao {


	SqlSession sqlSession;
	
	MemberDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	public List<MemberVo> selectIdxById(MemberVo vo){
		return sqlSession.selectList("com.jj.mappers.memberMapper.selectIdxById",vo);
	}
	public List<MemberVo> selectIdxByPw(MemberVo vo){
		return sqlSession.selectList("com.jj.mappers.memberMapper.selectIdxByPw",vo);
	}
	public List<MemberVo> selectIdxByPhone(MemberVo vo){
		return sqlSession.selectList("com.jj.mappers.memberMapper.selectIdxByPhone",vo);
	}
	public List<MemberVo> selectIdxByPlatform(MemberVo vo){
		return sqlSession.selectList("com.jj.mappers.memberMapper.selectIdxByPlatform",vo);
	}
	public List<MemberVo> selectAllByIdx(MemberVo vo){
		return sqlSession.selectList("com.jj.mappers.memberMapper.selectAllByIdx",vo);
	}
	public void joinMember1(MemberVo vo) {
		sqlSession.update("com.jj.mappers.memberMapper.joinMember1",vo);
		
	}
	public void joinMember2(MemberVo vo) {
		sqlSession.insert("com.jj.mappers.memberMapper.joinMember2",vo);
		
	}
	public void joinMember3(MemberVo vo) {
		sqlSession.update("com.jj.mappers.memberMapper.joinMember3",vo);
		
	}
	public void joinMember4(MemberVo vo) {
		sqlSession.insert("com.jj.mappers.memberMapper.joinMember4",vo);
		
	}
	public List<MemberVo> selectByNamePhone(MemberVo vo){
		return sqlSession.selectList("com.jj.mappers.memberMapper.selectByNamePhone", vo);
	}
	
}
