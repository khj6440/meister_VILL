package kr.or.meister.admin.model.vo;

import lombok.Data;

@Data
public class AdminMemberJoinSellJoinOrdersVO {

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
	private int sellNo;
	private String sellTitle;
	private int sellWriter;
	private int sellPrice;
	private String sellCategory1;
	private String sellCategory2;
	private String sellSkill;
	private String sellDate;
	private int sellAppro;
	private int sellStatus;
	private String sellOpt1;
	private String sellOpt2;
	private String sellOpt3;
	private int sellOptFix;
	private int sellPeriod;
	private String sellContent;
	private String sellFix;
	private String sellImg;
	private int orderNo;
	private int orderMemberNo;
	private int orderBoardNo;
	private String orderDate;
	private int orderBoardType;
	private int pickNo;
}
