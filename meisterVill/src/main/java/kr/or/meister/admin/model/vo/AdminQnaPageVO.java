package kr.or.meister.admin.model.vo;

import java.util.List;


import kr.or.meister.notice.model.vo.QnAVO;
import lombok.Data;

@Data
public class AdminQnaPageVO {

	private List<QnAVO> list;
	private String pageNavi;
	
	
	public AdminQnaPageVO(List<QnAVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
