package kr.or.meister.admin.model.vo;

import lombok.Data;

@Data
public class RequestListVO {

	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberHbd;
	private String memberNickname;
	private String memberPhone;
	private String memberImg;
	private String memberBank;
	private String memberAccount;
	private String memberTime;
	private int memberLevel;
	private int memberStatus;
	private String memberIntro;
	private String memberField;
	private String memberSkill;
	private String memberSchool;
	private String memberMajor;
	private String memberGrade;
	private String memberDate;
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
	private int orderNo;
	private int orderMemberNo;
	private int orderBoardNo;
	private String orderDate;
	private int orderBoardType;
	private int pickNo;
}
