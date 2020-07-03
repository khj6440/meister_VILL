package kr.or.meister.common;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sun.javafx.scene.paint.GradientUtils.Parser;

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.member.model.dao.MemberDao;

@Component("chatHandler")
public class ChatHandler extends TextWebSocketHandler{
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	
	private ArrayList<WebSocketSession> members;
	private HashMap<String, WebSocketSession> map;
	public ChatHandler() {
		members = new ArrayList<WebSocketSession>();
		map = new HashMap<String, WebSocketSession>();	//세션만 갖고 사용자를 구분할 수 없으니 맵의 키값으로 구분한다.
		
	}
	//소켓이 생성되어 연결되었을 때 동작되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결 성공 !!");
		members.add(session); //신규 접속자 정보 저장
		//사용자의 아이디를 받음
		//사용자의 안 읽은 메세지 개수를 봄
		//그리고 그걸 헤더에 띄움

	}
	//메세지를 수신하면 동작하는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		//소켓으로 받은 메세지를 json 타입으로 변경하여 사용
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		String type = element.getAsJsonObject().get("type").getAsString();
		if(type.equals("register")) {
			//type : register
			String memberNickname = element.getAsJsonObject().get("memberNickname").getAsString();
			map.put(memberNickname, session);
		}else {
			//type : chat
			JsonObject obj= element.getAsJsonObject();
			String target = obj.get("target").getAsString();
			String sender = obj.get("sender").getAsString();
			String senderImg =obj.get("senderImg").getAsString().equals("")?null:obj.get("senderImg").getAsString();
			String msg = obj.get("msg").getAsString();
			
			ChatVO newChat = new ChatVO();
			newChat.setChatReceiver(target);
			newChat.setChatSender(sender);
			newChat.setSenderImg(senderImg);
			newChat.setChatContent(msg);

			dao.insertChat(newChat);
			
			
			WebSocketSession ws = map.get(target); //target key 값을 요청
			if(ws != null) {
				//해당 target이 없다면.
				ws.sendMessage(new TextMessage(obj.toString()));
			}
		}
		
	}
	//연결이 끊기면 동작하는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 종료 !!");
		members.remove(session);
	}
}
