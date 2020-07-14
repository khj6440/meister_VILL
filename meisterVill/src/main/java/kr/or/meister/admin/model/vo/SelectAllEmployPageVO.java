package kr.or.meister.admin.model.vo;

import java.util.List;


import lombok.Data;

@Data
public class SelectAllEmployPageVO {

	
	private List<EmployListVO> list;
	private String pageNavi;
	
	
	public SelectAllEmployPageVO(List<EmployListVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
