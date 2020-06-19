package kr.or.meister.couponIssued.model.vo;

import lombok.Data;

@Data
public class CouponIssuedVO {
	private int couponIssuedNo;
	private int couponIssuedMemberNo;
	private int couponIssuedCouponNo;
	private int couponIssuedCheck;
	private int couponIssuedStart;
	private int couponIssuedEnd;
}
