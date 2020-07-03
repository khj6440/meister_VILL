package kr.or.meister.common;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.member.model.dao.MemberDao;
import kr.or.meister.message.model.vo.MessageVO;


@Component("msgHandler")
public class MsgHandler extends TextWebSocketHandler {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	
	private ArrayList<WebSocketSession> members;
	private HashMap<String, WebSocketSession> map;
	public MsgHandler() {
		members =new ArrayList<WebSocketSession>();
		map = new HashMap<String, WebSocketSession>();
	}
	
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("쪽지 연결 성공!");
		members.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//쪽지받는 사람 아이디
		//아이디기준으로 안읽은 쪽지 갯수
		System.out.println(message.getPayload());
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		String type = element.getAsJsonObject().get("type").getAsString();
		if(type.equals("register")) {
			//type : register
			String memberNickname = element.getAsJsonObject().get("memberNickname").getAsString();
			map.put(memberNickname, session);
		}else {
			//type : msg
			JsonObject obj= element.getAsJsonObject();
			String target = obj.get("target").getAsString();
			String sender = obj.get("sender").getAsString();
			String msgTitle = obj.get("msgTitle").getAsString();
			String msgContent = obj.get("msgContent").getAsString();
			
			MessageVO newMsg = new MessageVO();
			
			newMsg.setMsgContent(msgContent);
			newMsg.setMsgTitle(msgTitle);
			newMsg.setMsgSender(sender);
			newMsg.setMsgReceiver(target);
			
			int result =dao.insertMessage(newMsg);
			int unreadCnt = dao.selectUnreadCnt(target);
			WebSocketSession ws = map.get(target); //target key 값을 요청
			if(ws != null) {
				//해당 target이 없다면.
				ws.sendMessage(new TextMessage(String.valueOf(unreadCnt)));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("쪽지연결 종료!");
		members.remove(session);
	}
}
