package kr.or.meister.notice.model.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String noticeDate;
	private int noticeViewCount;
}
