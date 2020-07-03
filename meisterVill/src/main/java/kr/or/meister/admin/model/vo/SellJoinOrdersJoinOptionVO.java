package kr.or.meister.admin.model.vo;

import lombok.Data;

@Data
public class SellJoinOrdersJoinOptionVO {

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
	private int oders_orderNo;
	private int orderMemberNo;
	private int orderBoardNo;
	private String orderDate;
	private int orderBoardType;
	private int orderOptionNo;
	private int options_optionNo;
	private int orderNo;
	private int optionNo;
	private int options_sellNo;
	private String optionTitle;
	private String optionContent;
	private int optionPrice;
	private int optionPlusDate;
}
