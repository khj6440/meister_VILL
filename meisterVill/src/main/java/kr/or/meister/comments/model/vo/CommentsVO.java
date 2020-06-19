package kr.or.meister.comments.model.vo;

import lombok.Data;

@Data
public class CommentsVO {
	private int commentNo;
	private int boardNo;
	private String commentWriter;
	private String commentContent;
	private int commentLevel;
	private int commentRef;
	private String commentDate;
	private String commentWriterImg;
}
