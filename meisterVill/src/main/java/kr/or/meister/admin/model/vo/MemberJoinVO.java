package kr.or.meister.admin.model.vo;


import lombok.Data;

@Data
public class MemberJoinVO {

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
	private int reportNo;
	private String reportMemberNickname;
	private int reportBoardType;
	private int reportBoardNo;
	private int orderNo;
	private int orderMemberNo;
	private int orderBoardNo;
	private String orderDate;
	private int orderBoardType;
	private int reviewNo;
	private int sellNo;
	private String reviewWriter;
	private String reviewContent;
	private int reviewPoint;
	private String reviewDate;
	private String reviewWriterImg;
	
	
}
