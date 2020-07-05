package kr.or.meister.admin.model.vo;

import java.util.List;
import lombok.Data;

@Data
public class selectAllSellPageVO {

	private List<AdminMemberJoinSellJoinOrdersVO> list;
	private String pageNavi;
	
	
	public selectAllSellPageVO(List<AdminMemberJoinSellJoinOrdersVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
}
