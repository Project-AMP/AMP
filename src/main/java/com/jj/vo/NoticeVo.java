package com.jj.vo;

public class NoticeVo {
	
	int no;
	int idx; // 공지사항 글 번호
	String title; // 공지사항 - 제목
	int academy; // 공지사항 - 학원 인덱스 번호
	String date; // 공지사항 - 글 생성 날자
	String con; // 공지사항 - 내용
	int view; // 공지사항 - 조회수
	String file; // 공지사항 - 파일
	int num;
	

	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAcademy() {
		return academy;
	}
	public void setAcademy(int academy) {
		this.academy = academy;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	
	
}
