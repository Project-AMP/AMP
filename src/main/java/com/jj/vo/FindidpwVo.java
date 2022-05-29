package com.jj.vo;

public class FindidpwVo {
	
	// 아이디찾기시 사용되는 변수
	String name;
	String phone;
	
	// 반환시 사용되는 변수
	String id;
	String pw;
	
	// 비밀번호 재설정시 사용되는 변수들
	String updateid;
	String updatepw;
	
	
	
	public String getUpdateid() {
		return updateid;
	}
	public void setUpdateid(String updateid) {
		this.updateid = updateid;
	}
	public String getUpdatepw() {
		return updatepw;
	}
	public void setUpdatepw(String updatepw) {
		this.updatepw = updatepw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
	
}
