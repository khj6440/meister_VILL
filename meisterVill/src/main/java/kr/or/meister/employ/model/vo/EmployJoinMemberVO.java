package kr.or.meister.employ.model.vo;

import kr.or.meister.member.model.vo.MemberVO;
import lombok.Data;

@Data
public class EmployJoinMemberVO {
	private EmployVO employvo;
	private MemberVO membervo;
}
