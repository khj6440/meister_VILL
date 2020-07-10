package kr.or.meister.admin.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class SelectAllRequestPageVO {

	private List<RequestListVO> list;
	private String pageNavi;
	
	
	public SelectAllRequestPageVO(List<RequestListVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
