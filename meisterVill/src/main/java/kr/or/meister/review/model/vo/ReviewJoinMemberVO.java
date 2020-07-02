package kr.or.meister.review.model.vo;

import kr.or.meister.member.model.vo.MemberVO;
import lombok.Data;

@Data
public class ReviewJoinMemberVO {
	private ReviewVO reviewvo;
	private MemberVO membervo;

}
