package kr.or.meister.coupon.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class CouponApplyVO {
	private List arrCouponName;
	private List arrCouponPrice;
	private int totalDiscount;
}
