package kr.or.meister.coupon.model.vo;

import kr.or.meister.member.model.vo.MemberVO;
import lombok.Data;

@Data
public class CouponJoinMemberVO {
	private MemberVO membervo;
	private CouponJoinCouponIssuedVO cjcivo;
}
