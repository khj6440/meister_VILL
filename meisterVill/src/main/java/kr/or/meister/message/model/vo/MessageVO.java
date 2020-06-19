package kr.or.meister.message.model.vo;

import lombok.Data;

@Data
public class MessageVO {
	private int msgNo;
	private String msgTitle;
	private String msgContent;
	private String msgSender;
	private String msgReceiver;
	private String msgTime;
	private int msgRead;
}
