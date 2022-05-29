package com.jj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.EventVo;
import com.jj.vo.NoticeVo;

public class EventDao {


	SqlSession sqlSession;
	
	EventDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	public List<EventVo> select(){
		return sqlSession.selectList("com.jj.mappers.EventMapper.select");
	}
	public void viewUp(int idx) {
		sqlSession.update("com.jj.mappers.eventMapper.viewUp", idx);
	}
	
	// 이벤트 글쓰기 저장
	public int insertEvent(EventVo vo) {
		return sqlSession.insert("com.jj.mappers.EventMapper.insertEvent", vo);
	}
	
	public EventVo getEventOne(Map<String, String> map) {
		return sqlSession.selectOne("com.jj.mappers.EventMapper.event_detail", map);
	}
	public int getRowTotal(Map<String, String> map) {
		int count = sqlSession.selectOne("com.jj.mappers.EventMapper.event_count", map);
		return count;
	}
	
	public String getEventCon(String idx) {
		return sqlSession.selectOne("com.jj.mappers.EventMapper.event_con", idx);
	}
}
