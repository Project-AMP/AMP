package com.jj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jj.vo.MyAlarmListVo;
import com.jj.vo.NoticeVo;

public class NoticeDao {

	@Autowired
	SqlSession sqlSession;

	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 해당 학원 idx(인덱스) 찾기
	public int selectidx(String name) {
		return sqlSession.selectOne("com.jj.mappers.noticeMapper.selectIdx", name);
	}
	public void viewUp(int idx) {
		sqlSession.update("com.jj.mappers.noticeMapper.viewUp", idx);
	}

	// 공지사항 글쓰기 저장
	public int insertNotice(NoticeVo vo) {
		return sqlSession.insert("com.jj.mappers.noticeMapper.insertNotice", vo);
	}

	// 공지사항 전체목록 가져오기
	public List<NoticeVo> selectList(Map<String, String> map) {

		List<NoticeVo> list = sqlSession.selectList("com.jj.mappers.noticeMapper.selectList", map);
		return list;

	}

	// 전체 게시물 수 구하기
	public int getRowTotal(Map<String, String> map) {
		int count = sqlSession.selectOne("com.jj.mappers.noticeMapper.notice_count", map);
		return count;
	}

	// 공지사항 상세보기
	public NoticeVo getNoticeOne(Map<String, String> map) {
		return sqlSession.selectOne("com.jj.mappers.noticeMapper.notice_detail", map);
	}

	// 공지사항 글 삭제
	public int deleteNotice(Map<String, String> map) {
		return sqlSession.delete("com.jj.mappers.noticeMapper.notice_delete", map);
	}

	// 공지사항 글 수정 정보 얻어오기
	public NoticeVo select_update_notice(String idx) {
		return sqlSession.selectOne("com.jj.mappers.noticeMapper.select_update_notice", idx);
	}

	// 공지사항 글 수정
	public int updateNotice(NoticeVo noticeVo) {
		return sqlSession.update("com.jj.mappers.noticeMapper.notice_update", noticeVo);
	}

	
	
	// 진렬 21.06.01 추가
	// 학원 idx를 통해 academy 테이블에서 학원 이름 조회
	public String selectAdcademyName(int notice_academyidx) {
		return sqlSession.selectOne("com.jj.mappers.noticeMapper.selectAcademyName", notice_academyidx);
	}

	// 해당 학원을 즐겨찾기 한 사람 + 수강생 및 강사를 조회
	public List<String> selectMembers(int notice_academyidx) {
		return sqlSession.selectList("com.jj.mappers.noticeMapper.selectMembers", notice_academyidx);
	}

	// academy_alarm에 값 저장하기
	public int insertMembers(Map<String, Object> paramMap) {
		return sqlSession.insert("com.jj.mappers.noticeMapper.insertMembers", paramMap);
	}

	// 즐겨찾기 한 회원인지 아닌지 조회(공지사항 알림관련)
	public String selectbookmark(Map<String, Object> noticemap) {
		return sqlSession.selectOne("com.jj.mappers.noticeMapper.selectbookmark", noticemap);
	}

	// 해당 학원의 수강생 및 강사인지 아닌지 조회(공지사항 알림관련)
	public String selectacademy_member(Map<String, Object> noticemap) {
		return sqlSession.selectOne("com.jj.mappers.noticeMapper.selectacademy_member", noticemap);
	}

	// 본인이 즐겨찾기 했거나 수강생 또는 강사일때 공지사항알람 리스트 조회
	public List<MyAlarmListVo> selectMyAlarmList(int user_idx) {

		return sqlSession.selectList("com.jj.mappers.noticeMapper.selectMyAlarmList", user_idx);
	}

	// 공지사항의 idx를 가지고 제목을 조회
	public String select_Notice_title(int noticeidx) {
		return sqlSession.selectOne("com.jj.mappers.noticeMapper.select_Notice_title", noticeidx);
	}

}
