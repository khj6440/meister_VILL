package kr.or.meister.project.model.vo;

import lombok.Data;

@Data
public class ProjectChatVO {
	private int pChatNo;
	private int projectNo;
	private String pChatSender;
	private String pChatContent;
	private String pChatTime;
	private String pChatImg;
}
