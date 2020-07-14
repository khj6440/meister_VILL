package kr.or.meister.sell.model.vo;

import java.util.ArrayList;

import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import lombok.Data;

@Data
public class SellMemberOptionVO {

	private SellVO sellvo;
	private MemberVO membervo;
	private ArrayList<OptionsVO> optionsvoArr;
}
