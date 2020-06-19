package kr.or.meister.project.model.vo;

import lombok.Data;

@Data
public class ProjectNoticeVO {
	private int pNoticeNo;
	private int projectNo;
	private String pNoticeWriter;
	private String pNoticeContent;
	private String pNoticeDate;
}
