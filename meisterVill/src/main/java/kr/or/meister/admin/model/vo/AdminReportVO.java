package kr.or.meister.admin.model.vo;

import lombok.Data;

@Data
public class AdminReportVO {

	private int reportNo;
	private String reportMemberNickname;
	private int reportBoardType;
	private int reportBoardNo;
	private int reviewNo;
	private int sellNo;
	private String reviewWriter;
	private String reviewContent;
	private int reviewPoint;
	private String reviewDate;
	private String reviewWriterImg;
	private String sellTitle;
	private String sellImg;
	private String memberImg;
	private int memberNo;
	private int reportSaveNo;
	private int reportNoS;
	private int sellNoS;
	private String reviewSaveContent;
	
}
