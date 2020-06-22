package kr.or.meister.etc.model.vo;

import lombok.Data;
import kr.or.meister.member.model.vo.MemberVO;


@Data
public class ReportVO {
	private int reportNo;
	private String reportMemberNickname;
	private int reportBoardType;
	private int reportBoardNo;
	private MemberVO MemberVO;
}
