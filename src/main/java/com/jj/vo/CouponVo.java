package com.jj.vo;

public class CouponVo {
	int idx,academy,num,g,c;
	String name,s_date,e_date,u_date,date,code,g_idx;
	double sale;
	
	String m_idx, m_coupon, m_date; int m_member; /* coupon_member테이블 데이터 */
	int finished;
	
	String academy_name;
	
	public int getFinished() {
		return finished;
	}
	public void setFinished(int finished) {
		this.finished = finished;
	}
	public String getM_idx() {
		return m_idx;
	}
	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_coupon() {
		return m_coupon;
	}
	public void setM_coupon(String m_coupon) {
		this.m_coupon = m_coupon;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public int getM_member() {
		return m_member;
	}
	public void setM_member(int m_member) {
		this.m_member = m_member;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getIdx() {
		return idx;
	}
	public String getG_idx() {
		return g_idx;
	}
	public void setG_idx(String g_idx) {
		this.g_idx = g_idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getAcademy() {
		return academy;
	}
	public void setAcademy(int academy) {
		this.academy = academy;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getG() {
		return g;
	}
	public void setG(int g) {
		this.g = g;
	}
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getSale() {
		return sale;
	}
	public void setSale(double sale) {
		this.sale = sale;
	}
	public String getAcademy_name() {
		return academy_name;
	}
	public void setAcademy_name(String academy_name) {
		this.academy_name = academy_name;
	}


}
