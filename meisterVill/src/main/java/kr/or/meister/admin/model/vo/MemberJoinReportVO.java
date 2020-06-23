package kr.or.meister.admin.model.vo;

import lombok.Data;

@Data
public class MemberJoinReportVO {

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
}
