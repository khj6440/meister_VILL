package kr.or.meister.sell.model.vo;

import kr.or.meister.etc.model.vo.MultiImgVO;
import kr.or.meister.etc.model.vo.PickVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.review.model.vo.ReviewVO;
import lombok.Data;

@Data
public class SellJoinOthersVO {
	private SellVO sellvo;
	private MemberVO membervo;
	private MultiImgVO multiimgvo;
	private OptionsVO optionsvo;
}
