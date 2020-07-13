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
	private int couponNo;
	private String couponName;
	private int couponTimeLimit;
	private int couponMoney;
	private int couponStatus;
	private String couponEnd;
	private String couponContent;
	private String couponImg;
	private int couponLessMoney;
}
