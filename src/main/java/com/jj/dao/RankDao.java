package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.AcademyRankVo;
import com.jj.vo.RoomVo;
import com.jj.vo.SearchRankVo;


public class RankDao {

	SqlSession sqlSession;
	
	RankDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	public void insertSearch(SearchRankVo vo){
		sqlSession.insert("com.jj.mappers.rankMapper.insertSearch",vo);
	}
	public List<SearchRankVo> selectSearch(){
		return sqlSession.selectList("com.jj.mappers.rankMapper.selectSearch");
	}
	public void deleteSearch(){
		sqlSession.delete("com.jj.mappers.rankMapper.deleteSearch");
	}
	
	public void insertAcademy(AcademyRankVo vo){
		sqlSession.insert("com.jj.mappers.rankMapper.insertAcademy",vo);
	}
	public List<AcademyRankVo> selectAcademy(){
		return sqlSession.selectList("com.jj.mappers.rankMapper.selectAcademy");
	}
	public void deleteAcademy(){
		sqlSession.delete("com.jj.mappers.rankMapper.deleteAcademy");
	}
	
}
