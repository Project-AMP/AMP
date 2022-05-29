package com.jj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.AcademyStyleVo;
import com.jj.vo.TestVo;

public class AcademyStyleDao {


	SqlSession sqlSession;
	
	AcademyStyleDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	public AcademyStyleVo select_banner(int academy) {
		return sqlSession.selectOne("com.jj.mappers.academyStyleMapper.select_banner",academy);
	}
	public void save_banner(AcademyStyleVo vo) {
		sqlSession.insert("com.jj.mappers.academyStyleMapper.save_banner",vo);
	}
	public void update_banner(AcademyStyleVo vo) {
		sqlSession.update("com.jj.mappers.academyStyleMapper.update_banner",vo);
	}
	public void save_notImg_banner(AcademyStyleVo vo) {
		sqlSession.insert("com.jj.mappers.academyStyleMapper.save_notImg_banner",vo);
	}
	public void update_notImg_banner(AcademyStyleVo vo) {
		sqlSession.update("com.jj.mappers.academyStyleMapper.update_notImg_banner",vo);
	}
	public void save_main(AcademyStyleVo vo) {
		sqlSession.insert("com.jj.mappers.academyStyleMapper.save_main",vo);
	}
	public void update_main(AcademyStyleVo vo) {
		sqlSession.update("com.jj.mappers.academyStyleMapper.update_main",vo);
	}
	public void save_notImg_main(AcademyStyleVo vo) {
		sqlSession.insert("com.jj.mappers.academyStyleMapper.save_notImg_main",vo);
	}
	public void update_notImg_main(AcademyStyleVo vo) {
		sqlSession.update("com.jj.mappers.academyStyleMapper.update_notImg_main",vo);
	}
	
	
}
