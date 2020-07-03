package kr.or.meister.admin.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class SellAndRequestVO {

	private List<SellSellVO> ss;
	private List<RequestSellVO> rs;
	
	
	public SellAndRequestVO(List<SellSellVO> ss2, List<RequestSellVO> rs2) {
		super();
		this.ss = ss2;
		this.rs = rs2;
	}
	
	
	
}
