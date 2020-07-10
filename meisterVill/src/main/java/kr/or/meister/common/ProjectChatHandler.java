package kr.or.meister.common;

import java.util.ArrayList;
import java.util.HashMap;

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

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.project.model.dao.ProjectDao;
import kr.or.meister.project.model.vo.ProjectChatVO;

@Component("projectChatHandler")
public class ProjectChatHandler extends TextWebSocketHandler {

	@Autowired
	@Qualifier("projectDao")
	private ProjectDao dao;

	private ArrayList<WebSocketSession> members;
	private HashMap<String, WebSocketSession> mMap;
	private HashMap<String, HashMap<String, WebSocketSession>> pMap;

	public ProjectChatHandler() {
		members = new ArrayList<WebSocketSession>();
//		mMap = new HashMap<String, WebSocketSession>(); // 세션만 갖고 사용자를 구분할 수 없으니 맵의 키값으로 구분한다.
		pMap = new HashMap<String, HashMap<String, WebSocketSession>>();
	}

	// 소켓이 생성되어 연결되었을 때 동작되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("pChat 연결 성공 !!");
		members.add(session); // 신규 접속자 정보 저장

	}

	// 메세지를 수신하면 동작하는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		// 소켓으로 받은 메세지를 json 타입으로 변경하여 사용
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		String type = element.getAsJsonObject().get("type").getAsString();
		String projectNo = element.getAsJsonObject().get("projectNo").getAsString();
		if (type.equals("register")) {
			// type : register
			String memberNickname = element.getAsJsonObject().get("memberNickname").getAsString();

			for (String key : pMap.keySet()) {
				if (key.equals(projectNo)) {
					pMap.get(key).put(memberNickname, session);
					return;
				}
			}
			HashMap<String, WebSocketSession> mMap = new HashMap<String, WebSocketSession>();
			mMap.put(memberNickname, session);
			pMap.put(projectNo, mMap);
		} else {
			// type : pChat
			JsonObject obj = element.getAsJsonObject();
			String sender = obj.get("sender").getAsString();
			String senderImg = obj.get("senderImg").getAsString().equals("") ? null
					: obj.get("senderImg").getAsString();
			String sendTime = obj.get("sendTime").getAsString();
			String msg = obj.get("msg").getAsString();

			ProjectChatVO pc = new ProjectChatVO();
			pc.setProjectNo(Integer.parseInt(projectNo));
			pc.setPChatContent(msg);
			pc.setPChatImg(senderImg);
			pc.setPChatSender(sender);
			pc.setPChatTime(sendTime);

			dao.insertProjectChat(pc);

			if (!pMap.isEmpty()) {
				for (String target : pMap.get(projectNo).keySet()) {
					if (!target.equals(sender)) {
						WebSocketSession ws = pMap.get(projectNo).get(target);
						if (ws != null) {
							ws.sendMessage(new TextMessage(obj.toString()));
						}
					}
				}

			}
		}

	}

	// 연결이 끊기면 동작하는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("pChat 연결 종료 !!");
		members.remove(session);
	}
}
