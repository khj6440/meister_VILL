package kr.or.meister.sell.model.vo;

import java.util.HashMap;


public class SellPageData {
	private	HashMap<String, Object> sjm;
	private String pageNavi;
	public SellPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellPageData(HashMap<String, Object> sjm, String pageNavi) {
		super();
		this.sjm = sjm;
		this.pageNavi = pageNavi;
	}
	public HashMap<String, Object> getSjm() {
		return sjm;
	}
	public void setSjm(HashMap<String, Object> sjm) {
		this.sjm = sjm;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
