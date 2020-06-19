package kr.or.meister.member.model.vo;

import lombok.Data;

@Data
public class CareerVO {
	private int careerNo;
	private int memberNo;
	private int typeFree;
	private String companyName;
	private String companyDepartment;
	private String companyJobTitle;
	private int companyJobMon;
}
