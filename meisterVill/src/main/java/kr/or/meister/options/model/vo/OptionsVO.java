package kr.or.meister.options.model.vo;

import lombok.Data;

@Data
public class OptionsVO {
	private int optionNo;
	private int sellNo;
	private String optionTitle;
	private String optionContent;
	private int optionPrice;
	private int optionPlusDate;
}
