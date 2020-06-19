package kr.or.meister.member.model.vo;

import lombok.Data;

@Data
public class LicenseVO {
	private int licenseNo;
	private int memberNo;
	private String licenseName;
	private String licenseDate;
	private String licenseAgency;
}
