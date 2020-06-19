package kr.or.meister.orders.model.vo;

import lombok.Data;

@Data
public class OrdersVO {
	private int orderNo;
	private int orderMemberNo;
	private int orderBoardNo;
	private String orderDate;
	private int orderBoardType;
}
