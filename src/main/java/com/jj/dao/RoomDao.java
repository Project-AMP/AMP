package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.RoomVo;


public class RoomDao {

	SqlSession sqlSession;
	
	RoomDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	public List<RoomVo> selectAcademy(RoomVo vo){
		return sqlSession.selectList("com.jj.mappers.RoomMapper.selectAcademy",vo);
	}
	
}
