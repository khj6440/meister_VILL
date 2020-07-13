package kr.or.meister.coupon.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class CouponApplyVO {
	private ArrayList<String> arrCouponName;
	private ArrayList<Integer> arrCouponPrice;
	private int totalDiscount;
}
