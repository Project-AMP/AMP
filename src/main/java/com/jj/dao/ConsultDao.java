package com.jj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.ConsultVo;



public class ConsultDao {


	SqlSession sqlSession;
	
	ConsultDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}

	public void insertConsult(ConsultVo vo){
		sqlSession.selectList("com.jj.mappers.ConsultMapper.insertConsult",vo);
	}
	public List<ConsultVo> selectBystuname(ConsultVo vo){
		return sqlSession.selectList("com.jj.mappers.ConsultMapper.selectBystuname",vo);
	}
	public List<ConsultVo> selectByConsult(ConsultVo vo){
		return sqlSession.selectList("com.jj.mappers.ConsultMapper.selectByConsult",vo);
	}
	public List<ConsultVo> consultList(Map<String,String> map){
		return sqlSession.selectList("com.jj.mappers.ConsultMapper.consultList",map);
	}
	public void updateState(int idx){
		 sqlSession.update("com.jj.mappers.ConsultMapper.updateState",idx);
	}

}
