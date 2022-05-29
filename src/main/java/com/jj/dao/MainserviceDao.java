package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.MainserviceVo;

public class MainserviceDao {


	SqlSession sqlSession;
	
	MainserviceDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	public List<MainserviceVo> select(){
		return sqlSession.selectList("com.jj.mappers.MainserviceMapper.select");
	}
	
	
}
