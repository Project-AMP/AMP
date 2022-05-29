package com.jj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.ClassVo;
import com.jj.vo.CouponVo;

public class ClassDao {

	SqlSession sqlSession;

	ClassDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ClassVo> selectIdx(ClassVo vo) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.selectIdx", vo);
	}

	public List<ClassVo> selectName(ClassVo vo) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.selectName", vo);
	}
	public ClassVo selectClass(int classIdx) {
		return sqlSession.selectOne("com.jj.mappers.ClassMapper.selectClass", classIdx);
	}

	public List<ClassVo> myClassList(ClassVo vo) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.myClassList", vo);
	}
	public List<ClassVo> myClassListAll(ClassVo vo) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.myClassListAll", vo);
	}

	public List<ClassVo> getPaymentList(int academyidx) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.getPaymentList", academyidx);
	}

	public List<ClassVo> getClassList(Map<String, Object> map) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.getClassList", map);
	}

	public List<ClassVo> getKategories(int academy) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.getKategories", academy);
	}

	// 회원의 쿠폰리스트를 가져온다
	public List<CouponVo> selectMyCoupon(Map<String, Object> map) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.selectMyCoupon", map);
	}

	// 회원 수강신청
	public int insertclass(Map<String, Object> map) {
		return sqlSession.insert("com.jj.mappers.ClassMapper.insertclass", map);
	}

	// 관리자 수강정보 관리
	public List<ClassVo> adminClassList(int academyidx) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.adminClassList", academyidx);
	}

	// 강의실 목록 조회
	public List<ClassVo> adminRoomList(int academyidx) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.adminRoomList", academyidx);
	}

	// 강사 목록 조회
	public List<ClassVo> adminTeacherList(int academyidx) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.adminTeacherList", academyidx);
	}

	// 관리자 - 수강 개설
	public void adminClassInsert(Map<String, Object> map) {
		sqlSession.selectList("com.jj.mappers.ClassMapper.adminClassInsert", map);
	}

	// 관리자 - 수강 폐지
	public int deleteclass(Map<String, Object> map) {
		return sqlSession.delete("com.jj.mappers.ClassMapper.deleteclass", map);
	}

	// 관리자 - 카테고리 목록 조회
	public List<ClassVo> adminCategory(int academyidx) {
		return sqlSession.selectList("com.jj.mappers.ClassMapper.adminCategory", academyidx);
	}

	// 관리자 - 수강 수정
	public int admin_class_update(Map<String, Object> map) {
		return sqlSession.update("com.jj.mappers.ClassMapper.admin_class_update", map);
	}
	
	// 수강신청 리스트 갯수 얻어오기
	public int get_sugang_count(Map<String, Object> map) {
		return sqlSession.selectOne("com.jj.mappers.ClassMapper.countClassList",map);
	}
	

}
