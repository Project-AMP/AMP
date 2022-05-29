package com.jj.amp;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedBag;
import org.apache.commons.collections.map.HashedMap;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jj.dao.MemberDao;
import com.jj.dao.MessageDao;
import com.jj.util.FileTypeUtil;
import com.jj.util.FileUploadPath;
import com.jj.vo.MemberVo;
import com.jj.vo.MessageVo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MessageController {
	@Autowired
	MessageVo messageVo;
	@Autowired
	MessageDao messageDao;
	@Autowired
	MemberVo memberVo;
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Locale locale, Model model,HttpSession session,HttpServletRequest request) {
		int member = (int)session.getAttribute("idx");
		String room_click=null;
		ArrayList<MessageVo> classList=new ArrayList<MessageVo>();
		ArrayList<MessageVo> academyList=new ArrayList<MessageVo>();
		classList=(ArrayList<MessageVo>)messageDao.myClass(member);
		academyList=(ArrayList<MessageVo>)messageDao.myAcademy(member);
	
		Map<String,Integer> param=(Map<String,Integer>)RequestContextUtils.getInputFlashMap(request);

			if(param!=null) {
				room_click=param.get("room_click").toString();

			}
				
		
		
		model.addAttribute("classList", classList);
		model.addAttribute("academyList", academyList);
		model.addAttribute("room_click",room_click);
		
		
		return "academy/message/message";
	}
	@RequestMapping(value = "/message_room", method = RequestMethod.GET)
	public String messageRoom(Locale locale, Model model,HttpSession session) {
		MessageVo mesVo=new MessageVo();
		MemberVo memVo=new MemberVo();
		mesVo.setMember(Integer.parseInt(session.getAttribute("idx")+""));
		ArrayList<MessageVo> list=(ArrayList<MessageVo>)messageDao.selectRoom(mesVo);
		String room_member="";
		String [] room_member_arr;
		for(int i=0;i<list.size();i++) {
			room_member=list.get(i).getRoom_member().replace("@@", ",").replace("@", "");
			room_member_arr=room_member.split(",");
			room_member="<br>인원 : "+room_member_arr.length+"명 ( ";
				
					for(int j=0;j<room_member_arr.length;j++) {
						memVo.setIdx(Integer.parseInt(room_member_arr[j]));	
						ArrayList<MemberVo> list1=(ArrayList<MemberVo>)memberDao.selectAllByIdx(memVo);
						if(list1.size()!=0) {
							room_member+=list1.get(0).getName();
						}else {
							room_member+="탈퇴한 회원";
						}
							if(j!=room_member_arr.length-1) {
								room_member+=" , ";
							}else {
								room_member+=" )";
							}
					}
				
			list.get(i).setRoom_title(list.get(i).getRoom_title()+room_member);
		}
	
			mesVo=null;
			memVo=null;
		model.addAttribute("list",list);
		
		return "academy/message/message_room";
	}
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		
		
		return "academy/message/notice";
	}
	@RequestMapping(value = "/message_kit", method = RequestMethod.GET)
	public String messagekit(Locale locale, Model model,String roomId) {
	
			MessageVo messageVo1=new MessageVo();
			MemberVo memVo=new MemberVo();
			
			messageVo1.setRoom(Integer.parseInt(roomId));
			ArrayList<MessageVo> list=(ArrayList<MessageVo>)messageDao.selectMessage(messageVo1);
			String type,con;
			FileTypeUtil fileTypeUtil=new FileTypeUtil();
			
			for(int i=0;i<list.size();i++) {
				//메시지 안읽은수
				int viewCount=0;
				if(list.get(i).getView().split("@@")[0].equals("")) {
					viewCount=0;
				}else {
					viewCount=list.get(i).getView().split("@@").length;
				}
				list.get(i).setView_count(viewCount);
				//확장자가 무엇인지
		
				con=list.get(i).getCon();
				type=fileTypeUtil.getFileType(con.substring(con.lastIndexOf(".")+1));
				list.get(i).setType(type);
			}
			
			//접속한 방 제목 만들기
			if(Integer.parseInt(roomId)!=00) {	
				messageVo1.setRoom_idx(Integer.parseInt(roomId));
				messageVo1=messageDao.selectRoomName(messageVo1);	
				String room_member="";
				String [] room_member_arr;
				room_member=messageVo1.getRoom_member().replace("@@", ",").replace("@", "");
				room_member_arr=room_member.split(",");
				room_member="     인원 : "+room_member_arr.length+"명 ( ";
					
						for(int j=0;j<room_member_arr.length;j++) {
							memVo.setIdx(Integer.parseInt(room_member_arr[j]));	
							ArrayList<MemberVo> list1=(ArrayList<MemberVo>)memberDao.selectAllByIdx(memVo);
							if(list1.size()!=0) {
								room_member+=list1.get(0).getName();
							}else {
								room_member+="탈퇴한 회원";
							}
								if(j!=room_member_arr.length-1) {
									room_member+=" , ";
								}else {
									room_member+=" )";
								}
						}
				messageVo1.setRoom_member(room_member);
		
				model.addAttribute("messageVo", messageVo1);
			}
			
			model.addAttribute("list",list);
			
		return "academy/message/message_kit";
	}
	@RequestMapping(value = "/readMessage", method = RequestMethod.GET)
	@ResponseBody
	public String readMessage(Locale locale, Model model,int roomId,HttpSession session) {
			int memberIdx=Integer.parseInt(session.getAttribute("idx")+"");
			messageVo.setMember(memberIdx);
			messageVo.setRoom(roomId);
			ArrayList<MessageVo> list=(ArrayList<MessageVo>)messageDao.selectIdxView(messageVo);
		
			
			if(list.size()==0) {
				return "false";
			}else {
				for(int i=0;i<list.size();i++) {
					messageVo.setIdx(list.get(i).getIdx());
					messageVo.setView(list.get(i).getView().replace("@"+memberIdx+"@", ""));
					messageDao.updateView(messageVo);
				}
		
				
				
				return "true";
			}
					
	}
	@RequestMapping(value = "/hasNewMessage", method = RequestMethod.GET)
	@ResponseBody
	 synchronized public int hasNewMessage(HttpSession session) {
			int memberIdx=Integer.parseInt(session.getAttribute("idx")+"");
			messageVo.setMember(memberIdx);

			return messageDao.hasNewMessage(messageVo);
		
		
					
	}
	
	@RequestMapping(value = "/isMyRoom", method = RequestMethod.GET)
	@ResponseBody
	public String isMyRoom(Locale locale, Model model,int roomId,HttpSession session) {
		int member=(int)session.getAttribute("idx");
		MessageVo vo=new MessageVo();
		vo.setMember(member);
		vo.setRoom_idx(roomId);
		if(messageDao.isMyRoom(vo)>0)
			return "true";
			return "false";
	
		
	}
	
	
	//파일 업로드
	@RequestMapping(value = "/fileUpload.do") 
	@ResponseBody
	public boolean multipartUpload( @RequestParam("file") MultipartFile file,HttpSession session,int room) throws Exception { 
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
	    String directory1 = (new FileUploadPath()).getDirectory()+ "amp\\src\\main\\webapp\\resources\\IMG\\site\\message";
	    String directory2 = (new FileUploadPath()).getDirectory()+ ".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\amp\\resources\\IMG\\site\\message";
	   
		/* 
		 * 이름 설정: 사진마다 이름이 재각각이고 겹치는 이름이 있을 수 있기 때문에 
		 * 	저장시 파일 이름을 fileName+(랜덤 문자열 20자리) 로 지정하면 순차적으로 이름이 생성 되어 저장 될것이다.
		 * 	하지만 기존 파일의 이름을 가지고 있어야 사용자가 파일에 신원을 인지 할 수 있기때문에
		 * 	message 테이블 con 부분에 저장,불러오기 함으로써 파일 이름을 사용자에게 명시 해줄 수 있다.
		 * 
		 */
		String con = StringUtils.cleanPath(new String(file.getOriginalFilename().getBytes("8859_1"), StandardCharsets.UTF_8));//사용자의 첨부파일 이름
		
		//랜덤 문자열
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 20; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}

		//이름 생성
	    String filename = "fileName"+temp+con.substring(con.lastIndexOf("."));	    
	    String filepath1 = Paths.get(directory1, filename).toString();
	    String filepath2 = Paths.get(directory2, filename).toString();
	    
	    
	    
	    // 두경로에 대한 파일 저장
	    BufferedOutputStream stream =
	        new BufferedOutputStream(new FileOutputStream(new File(filepath1)));
	    stream.write(file.getBytes());
	    stream = new BufferedOutputStream(new FileOutputStream(new File(filepath2)));
	    stream.write(file.getBytes());
	    stream.close();
	   
	    //db저장
	    int member_idx=(int)session.getAttribute("idx");
	    MessageVo messageVo1=new MessageVo();
	    messageVo1.setRoom_idx(room);	   
		messageVo1.setView(messageDao.selectRoomMember(messageVo1).replace("@"+member_idx+"@", ""));
		messageVo1.setRoom(room);
	    messageVo1.setMember(member_idx);
	    messageVo1.setCon(con);
	    messageVo1.setFile(filename);
	    messageDao.sendFile(messageVo1);
	    
	    return true;
	    
	}
	
		
	@RequestMapping(value = "/message_members", method = RequestMethod.GET)
	public String message_members(Model model,String classIdx,HttpSession session) {
		int member=(int)session.getAttribute("idx");
		Map<String,String> map= new HashMap<String, String>();
		map.put("member", member+"");
		map.put("classIdx", classIdx);
		ArrayList<MessageVo> list=(ArrayList<MessageVo>)messageDao.selectMembers(map);
		model.addAttribute("list",list);
		
		return "academy/message/message_members";
	}
	@RequestMapping(value = "/makeRoom", method = RequestMethod.GET)
	public String makeRoom(int classIdx,HttpSession session,int [] members,String roomName,RedirectAttributes redirectAttributes) {
		int member=(int)session.getAttribute("idx");
		String roomMember="@"+member+"@";
			for(int i=0;i<members.length;i++) {
				roomMember+="@"+members[i]+"@";
			}
		System.out.println(roomMember);
		messageVo.setRoom_member(roomMember);
		messageVo.setRoom_title(roomName);
		messageVo.setRoom_class(classIdx);
		messageDao.makeRoom(messageVo);
		messageVo.setMember(0);
		messageVo.setView("");
		messageVo.setCon("새로 생성된 방입니다.");
		messageVo.setRoom(messageVo.getRoom_idx());
		messageDao.sendMessage(messageVo);
		redirectAttributes.addFlashAttribute("room_click",messageVo.getRoom_idx());
		return "redirect:message";
	}
	
	
	
		
}

	

