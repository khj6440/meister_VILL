package kr.or.meister.employ.model.vo;

import lombok.Data;

@Data
public class EmployVO {
	private int employNo;
	private String employTitle;
	private String employCategory1;
	private String employCategory2;
	private String employContent;
	private String employSkill;
	private int employPrice;
	private String employEnrollDate;
	private String employStartDate;
	private int employPeriod;
	private String employBoardEnd;
	private int employAppro;
	private int employStatus;
	private int employWriter;
	private String projectMembers;
	private String projectStart;
}
