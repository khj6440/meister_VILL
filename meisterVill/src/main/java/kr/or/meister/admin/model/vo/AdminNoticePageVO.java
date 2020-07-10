package kr.or.meister.admin.model.vo;

import java.util.List;

import kr.or.meister.notice.model.vo.NoticeVO;
import lombok.Data;

@Data
public class AdminNoticePageVO {

	private List<NoticeVO> list;
	private String pageNavi;
	
	
	public AdminNoticePageVO(List<NoticeVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
