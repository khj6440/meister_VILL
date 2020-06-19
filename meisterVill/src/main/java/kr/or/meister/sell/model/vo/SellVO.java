package kr.or.meister.sell.model.vo;

import lombok.Data;

@Data
public class SellVO {
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
}
