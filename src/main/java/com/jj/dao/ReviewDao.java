package com.jj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jj.vo.ReviewVo;

public class ReviewDao {


	SqlSession sqlSession;
	
	ReviewDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	public List<ReviewVo> select(){
		return sqlSession.selectList("com.jj.mappers.reviewMapper.select");
	}
	
	public int insertReview(ReviewVo vo) {
		return sqlSession.insert("com.jj.mappers.reviewMapper.insertReview", vo);
	}
	
	// 라뷰 삭제
	public int deleteReview(int idx) {
		return sqlSession.delete("com.jj.mappers.reviewMapper.deleteReview", idx);
	}
	
	
}
