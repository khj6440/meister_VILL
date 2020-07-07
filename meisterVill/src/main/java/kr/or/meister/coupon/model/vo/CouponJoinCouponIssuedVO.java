package kr.or.meister.coupon.model.vo;

import lombok.Data;

@Data
public class CouponJoinCouponIssuedVO {

	private int couponIssuedNo;
	private int couponIssuedMemberNo;
	private int couponIssuedCouponNo;
	private int couonIssuedCheck;
	private String couponIsseudStart;
	private String couponIssuedEnd;
	private CouponVO couponvo;
}
