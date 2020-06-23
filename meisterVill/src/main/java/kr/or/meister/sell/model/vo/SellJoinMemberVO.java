package kr.or.meister.sell.model.vo;

import kr.or.meister.member.model.vo.MemberVO;
import lombok.Data;

@Data
public class SellJoinMemberVO {
	private SellVO sellvo;
	private MemberVO membervo;
}
