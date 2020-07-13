package kr.or.meister.admin.model.vo;

import lombok.Data;

@Data
public class ReportSaveVO {
	 private int reportSaveNo;
     private int reportNo;
     private int sellNo; 
     private String reviewContent;
}
