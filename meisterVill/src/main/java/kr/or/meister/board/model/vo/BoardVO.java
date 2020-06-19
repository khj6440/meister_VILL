package kr.or.meister.board.model.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private String boardDate;
	private String boardFilename;
	private String boardFilepath;
	private int boardReadCount;
}
