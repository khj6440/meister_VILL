package kr.or.meister.request.model.vo;

import lombok.Data;

@Data
public class RequestVO {
	private int requestNo;
	private String requestCategory1;
	private String requestCategory2;
	private String requestTitle;
	private String requestWriter;
	private String requestWrtierImg;
	private String requestNow;
	private String requestWantform;
	private String requestWantskill;
	private String requestContent;
	private int requestPrice;
	private int requestBoardEnd;
	private int requestProjectEnd;
	private int requestAppro;
	private int requestStatus;
	private String requestDate;
	private String requestResMembers;
}
