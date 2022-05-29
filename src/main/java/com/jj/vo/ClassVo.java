package com.jj.vo;



public class ClassVo {
	
	int idx, room,price;
	String name,time, s_date, e_date, teacher, limited,kategorie;

	int member,academy,finished;
	String room_name,teacher_name,date,member_name;
	double sale;
	
	String academy_name;
	
	private int nowPage, // 현재 페이지
	startPage, // 시작 페이지
	endPage,  // 끝페이지
	total, // 게시글 총 갯수
	cntPerPage, // 페이지당 글 갯수
	lastPage, // 마지막 페이지
	start, // sql 쿼리에 쓸 start
	end; // sql 쿼리에 쓸 end
	
	private int cntPage = 5;
	
	public ClassVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public ClassVo(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}

	// 제일 마지막 페이지 계산
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
		}

		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);

			if (getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}

		// DB 쿼리에서 사용할 start, end값 계산
		public void calcStartEnd(int nowPage, int cntPerPage) { // 2, 5
			//setEnd(nowPage * cntPerPage);
			//setStart(getEnd() - cntPerPage);
			
			setEnd(5);
			
			if(nowPage == 1) {
				setStart(0);
			}else {
				setStart( (nowPage*5) - 5 ); //3x5 = 10
			}
			 // 1일때 0
			 // 2일때 5 
			 // 3일때 10
			 // 4일때 15
		}

		
	
	// getter & setter
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	
	public String getKategorie() {
		return kategorie;
	}

	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}

	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public double getSale() {
		return sale;
	}

	public void setSale(double sale) {
		this.sale = sale;
	}

	public int getFinished() {
		return finished;
	}

	public void setFinished(int finished) {
		this.finished = finished;
	}

	public int getAcademy() {
		return academy;
	}

	public void setAcademy(int academy) {
		this.academy = academy;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLimited() {
		return limited;
	}
	public void setLimited(String limited) {
		this.limited = limited;
	}

	public String getAcademy_name() {
		return academy_name;
	}

	public void setAcademy_name(String acadmey_name) {
		this.academy_name = acadmey_name;
	}
	
	

}
