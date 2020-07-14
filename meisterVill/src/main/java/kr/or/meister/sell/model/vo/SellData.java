package kr.or.meister.sell.model.vo;

import java.util.ArrayList;



public class SellData {
	private ArrayList<SellVO> list;
	private String pageNavi;
	public SellData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SellData(ArrayList<SellVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<SellVO> getList() {
		return list;
	}
	public void setList(ArrayList<SellVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
