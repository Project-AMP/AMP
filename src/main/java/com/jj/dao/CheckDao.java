package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.CheckVo;
import com.jj.vo.TestVo;

public class CheckDao {


	SqlSession sqlSession;
	
	CheckDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	public List<CheckVo> selectByStudent(CheckVo vo){
		return sqlSession.selectList("com.jj.mappers.checkMapper.selectByStudent",vo);
	}
	public List<CheckVo> selectByTeacher(CheckVo vo){
		return sqlSession.selectList("com.jj.mappers.checkMapper.selectByTeacher",vo);
	}
	public void insert(CheckVo vo){
		sqlSession.insert("com.jj.mappers.checkMapper.insert",vo);
	}
	public void update(CheckVo vo){
		sqlSession.update("com.jj.mappers.checkMapper.update",vo);
	}
	public int hasCon(CheckVo vo){
		return sqlSession.selectOne("com.jj.mappers.checkMapper.hasCon",vo);
	}
	
	
}
