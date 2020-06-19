package kr.or.meister.review.model.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private int sellNo;
	private String reviewWriter;
	private String reviewContent;
	private int reviewPoint;
	private String reviewDate;
	private String reviewWriterImg;
}
