package kr.or.meister.chat.model.vo;

import lombok.Data;

@Data
public class ChatVO {
	private int chatNo;
	private String chatSender;
	private String chatReceiver;
	private String chatContent;
	private String chatTime;
	private String chatOut;
	private int chatRead;
	private String senderImg;
	private String receiverImg;
}
