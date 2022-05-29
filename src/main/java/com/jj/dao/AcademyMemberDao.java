package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.AcademyMemberVo;
import com.jj.vo.AcademyVo;


public class AcademyMemberDao {


	SqlSession sqlSession;
	
	AcademyMemberDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}

	public void insertMember(AcademyMemberVo vo){
		sqlSession.selectList("com.jj.mappers.academyMemberMapper.insertMember",vo);
	}
	public List<AcademyMemberVo> selectByAM(AcademyMemberVo vo){
		return sqlSession.selectList("com.jj.mappers.academyMemberMapper.selectByAM",vo);
	}
	
	public Integer selectByAM2(AcademyMemberVo vo){
		return sqlSession.selectOne("com.jj.mappers.academyMemberMapper.selectByAM2",vo);
	}
}
