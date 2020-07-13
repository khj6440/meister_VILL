package kr.or.meister.member.model.vo;

import kr.or.meister.review.model.vo.ReviewVO;
import kr.or.meister.sell.model.vo.SellVO;
import lombok.Data;

@Data
public class MemberJoinSellReviewVO {
	private int memberNo;
	private String memberName;
	private String memberNickname;
	private String memberImg;
	private int memberLevel;
	private int memberStatus;
	private String memberIntro;
	private int sellNo;
	private String sellTitle;
	private int sellWriter;
	private int sellPrice;
	private String sellCategory1;
	private String sellCategory2;
	private String sellDate;
	private String sellImg;
	private int reviewNo;
	private String reviewWriter;
	private String reviewContent;
	private int reviewPoint;
	private String reviewDate;
	private String reviewWriterImg;
}
