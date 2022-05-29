package com.jj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.AcademyVo;
import com.jj.vo.CouponVo;


public class CouponDao {

	
	SqlSession sqlSession;
	
	CouponDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}

	public void makeCoupon1(CouponVo vo) {
		sqlSession.insert("com.jj.mappers.couponMapper.makeCoupon1",vo);
	}
	public void makeCoupon2(CouponVo vo) {
		sqlSession.insert("com.jj.mappers.couponMapper.makeCoupon2",vo);
	}
	public List adminCouponList(int academyidx) {
		return sqlSession.selectList("com.jj.mappers.couponMapper.adminCouponList",academyidx);
	}
	public List myCouponList(Map<String,Integer> map) {
		return sqlSession.selectList("com.jj.mappers.couponMapper.myCouponList",map);
	}
	public List myCouponListAll(Map<String,Integer> map) {
		return sqlSession.selectList("com.jj.mappers.couponMapper.myCouponListAll",map);
	}
	public List isCoupon(Map<String,String> map) {
		return sqlSession.selectList("com.jj.mappers.couponMapper.isCoupon",map);
	}
	public void addCouponMember(Map<String,Integer> map) {
		sqlSession.insert("com.jj.mappers.couponMapper.addCouponMember",map);
	}
	public int hasCoupon(Map<String,String> map) {
		return sqlSession.selectOne("com.jj.mappers.couponMapper.hasCoupon",map);
	}
	public void deleteCoupon(int idx) {
		sqlSession.delete("com.jj.mappers.couponMapper.deleteCoupon",idx);
	}
}
