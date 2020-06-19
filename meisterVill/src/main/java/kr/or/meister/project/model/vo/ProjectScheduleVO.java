package kr.or.meister.project.model.vo;

import lombok.Data;

@Data
public class ProjectScheduleVO {
	private int pScheduleNo;
	private int projectNo;
	private String pScheduleWriter;
	private String pScheduleContent;
	private String pScheduleStart;
	private String pScheduleEnd;
}
