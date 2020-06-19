package kr.or.meister.etc.model.vo;

import lombok.Data;

@Data
public class MultiImgVO {
	private int imgNo;
	private int multiBoardNo;
	private int multiBoardType;
	private String filename;
	private String filepath;
}
