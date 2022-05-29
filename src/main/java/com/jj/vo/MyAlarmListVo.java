package com.jj.vo;

public class MyAlarmListVo {
	
	int idx;
	int member;
	int academy;
	
	String content;
	String date;
	
	
	int notice_idx;
	String notice_academy_name,notice_title;
	
	
	
	
	
	
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_academy_name() {
		return notice_academy_name;
	}
	public void setNotice_academy_name(String notice_academy_name) {
		this.notice_academy_name = notice_academy_name;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public int getAcademy() {
		return academy;
	}
	public void setAcademy(int academy) {
		this.academy = academy;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
