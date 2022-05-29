package com.jj.util;

public class PageUtil {
	
	// 게시판별 페이지의 속성을 관리하기 위한 내부클래스들을 만들어두면
	// 일반 게시판과 공지사항등 게시판이 두 개 이상일 때 상수로 특정 클래스를 골라서 접근하기 편해진다.
	
	public static class Board{ // 내부클래스
		
		public static final String VIEW_PATH = "/WEB-INF/views/message";
		
		// 한 페이지당 보여줄 게시물 수
		public final static int BLOCKLIST = 15;
		
		// 한 화면에 보여지는 페이지 메뉴 수( prev 1 2 3 next )
		public final static int BLOCKPAGE = 5;
		
	}
	
	public static class Notice{
		public final static int BLOCKLIST = 10;
		public final static int BLOCKPAGE = 5;
	}
	
	//Util.Notice.BLOCKLIST // 페이지가 10개 보이도록 처리 가능
	
}
