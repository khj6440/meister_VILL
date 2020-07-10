package kr.or.meister.employ.model.vo;

import kr.or.meister.member.model.vo.MemberVO;
import lombok.Data;

@Data
public class EmployMemberVO {
	private EmployVO employvo;
	private MemberVO membervo;
}
