package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.TestVo;

public class TestDao {


	SqlSession sqlSession;
	
	TestDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	public List<TestVo> select(){
		return sqlSession.selectList("com.jj.mappers.testMapper.select");
	}
	
	
}
