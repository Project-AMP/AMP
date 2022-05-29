package com.jj.vo;

public class MessageVo {
	
	int idx,room,member;	
	String con,date,file,view;
	
	String name;
	
	//message_room
	int room_idx,room_class;
	String room_title,room_member;
	//view는 db에 저장된 String 형이고 view_count는 db에 없는 몇명이 봤나 안봤나를 계산히기 위한 메서드이다.
	int view_count;
	String type;
	//
	int class_idx,member_idx,academy_idx,teacher_idx;
	String class_name,class_time,class_teachr;
	String member_name;
	String academy_name;
	
	
	
	
	public int getTeacher_idx() {
		return teacher_idx;
	}
	public void setTeacher_idx(int teacher_idx) {
		this.teacher_idx = teacher_idx;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getAcademy_idx() {
		return academy_idx;
	}
	public void setAcademy_idx(int academy_idx) {
		this.academy_idx = academy_idx;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_time() {
		return class_time;
	}
	public void setClass_time(String class_time) {
		this.class_time = class_time;
	}
	public String getClass_teachr() {
		return class_teachr;
	}
	public void setClass_teachr(String class_teachr) {
		this.class_teachr = class_teachr;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getAcademy_name() {
		return academy_name;
	}
	public void setAcademy_name(String academy_name) {
		this.academy_name = academy_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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

	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public int getRoom_class() {
		return room_class;
	}
	public void setRoom_class(int room_class) {
		this.room_class = room_class;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getRoom_member() {
		return room_member;
	}
	public void setRoom_member(String room_member) {
		this.room_member = room_member;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	


}
