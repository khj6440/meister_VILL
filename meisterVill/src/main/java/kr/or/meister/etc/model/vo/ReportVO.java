package kr.or.meister.etc.model.vo;

import lombok.Data;

@Data
public class ReportVO {
	private int reportNo;
	private String reportMemberNickname;
	private int reportBoardType;
	private int reportBoardNo;
}
