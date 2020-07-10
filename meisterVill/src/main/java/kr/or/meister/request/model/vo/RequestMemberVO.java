package kr.or.meister.request.model.vo;

import kr.or.meister.member.model.vo.MemberVO;
import lombok.Data;

@Data
public class RequestMemberVO {
	private RequestVO requestvo;
	private MemberVO membervo;
}
