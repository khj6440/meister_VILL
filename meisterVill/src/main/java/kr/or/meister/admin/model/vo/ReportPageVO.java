package kr.or.meister.admin.model.vo;

import java.util.List;
import lombok.Data;

@Data
public class ReportPageVO {

	
	private List<AdminReportVO> list;
	private String pageNavi;
	
	
	public ReportPageVO(List<AdminReportVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
