package com.jj.handler;
import java.util.ArrayList;

import java.util.List;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jj.dao.MessageDao;
import com.jj.vo.MessageVo;


@Controller
@RequestMapping("/echo") 
public class EchoHandler extends TextWebSocketHandler{

	@Autowired
	MessageDao messageDao;
	

	/* 웹소켓 세션을 저장할 리스트 생성 */
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	

	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{ // 연결 생성될 때
		sessionList.add(session);	
		System.out.println("연결"+session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{ // 메세지가 전송될 때

		
			String msg = message.getPayload().toString();	//파라미터로 받아온 메시지를 담는다(json형태의 문자열로 저장 담겨왔다. chatting.jsp sendMessage()함수 참고)

			
			JSONParser jparser=new JSONParser();			//json 형태의 문자열을 json으로 변환 하기위한 	파서
			JSONObject obj=(JSONObject)jparser.parse(msg);  //파서를 이용해서 json형태로 얻는다
	
			String messageStr=obj.get("message").toString();//메시지 내용 , 작성자id,방id를 모두 문자열로 받았다!! 이제 받은 데이터를 Vo를 통해 db에 넣어줄수 있다
			String idx=obj.get("id").toString();
			String roomIdStr=obj.get("roomId").toString();
			if(!messageStr.equals("")) {
				MessageVo messageVo=new MessageVo();
				messageVo.setRoom_idx(Integer.parseInt(roomIdStr));
				messageVo.setView(messageDao.selectRoomMember(messageVo).replace("@"+idx+"@", ""));
				messageVo.setRoom(Integer.parseInt(roomIdStr));
				messageVo.setCon(messageStr);
				messageVo.setMember(Integer.parseInt(idx));
				messageDao.sendMessage(messageVo);
				messageVo=null;
			}
			
		for(WebSocketSession sess: sessionList) {
			//이건 간단하게 설명해 chatting.jsp 스크립트부분 에서
			//메시지 오거나 보낼시 자동으로 호출되는 onMessage(msg) 함수가 받을 파라미터 msg로 메시지를 보낸다.
			//즉 여기서 이런식으로 보내주면 onMessage(msg)가 호출되어질것이다.
			
			
			sess.sendMessage(new TextMessage(msg));
		}
		
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{ // 연결이 끊길 때
		System.out.println("연결 끊김"+session);
		sessionList.remove(session);
		
	}
	
}