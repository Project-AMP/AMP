package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.AcademyMemberVo;
import com.jj.vo.ClassMemberVo;
import com.jj.vo.ClassVo;


public class ClassMemberDao {


	SqlSession sqlSession;
	
	ClassMemberDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}

	public void insertMember(ClassMemberVo vo){
		sqlSession.selectList("com.jj.mappers.classMemberMapper.insertMember",vo);
	}
	public int isInClass(ClassMemberVo vo){
		return sqlSession.selectOne("com.jj.mappers.classMemberMapper.isInClass",vo);
	}
	public List<ClassMemberVo> selectClassMember(ClassMemberVo vo){
		return sqlSession.selectList("com.jj.mappers.classMemberMapper.selectClassMember",vo);
	}
	
}
