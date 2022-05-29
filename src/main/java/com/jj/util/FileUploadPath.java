package com.jj.util;

public class FileUploadPath {
	/* 
	 * 파일 저장 경로설정: 경로 2개 1.이클립스 내부 2.서버 내부 
	 * 1.이클립스 내부:서버가 닫히더라도 이크립스 내부에서 가지고 있다면 서버가 다시 시작 되었을 때 서버 내부로 다시 가지고 감
	 * 2.서버내부 : 이클립스 내부에만 저장 한다면 
	 * 	서버 내부에서 이클립스 내부의 데이터를 받는 시간이 걸리기 때문에 즉각적인 처리가 안이루어 지는 경우가 있음
	 * 	즉각적인 처리를 위한 서버 내부로 직접 저장
	 * 
	 * 요약: 두 경로 모두 저장을 해줘야 즉각적인 처리,서버 재시작시 다시 불러옴 이 가능함.
	 * 
	 * 
	 * 
	 * 
	 * C:\Users\harry\OneDrive\바탕 화면\졸작\joljak\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\amp\resources\IMG\site\message
	 * 이태현 주소
	 *    String directory1 = "C:\\Users\\harry\\OneDrive\\바탕 화면\\졸작\\joljak\\amp\\src\\main\\webapp\\resources\\IMG\\site\\message";
    String directory2 = "C:\\Users\\harry\\OneDrive\\바탕 화면\\졸작\\joljak\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\amp\\resources\\IMG\\site\\message";
	 * 
	 * 
	 */
    String directory = "C:\\Users\\harry\\OneDrive\\바탕 화면\\졸작\\joljak\\";
   
	public String getDirectory() {
		return directory;
	}
	public void setDirectory(String directory) {
		this.directory = directory;
	}

   
}
