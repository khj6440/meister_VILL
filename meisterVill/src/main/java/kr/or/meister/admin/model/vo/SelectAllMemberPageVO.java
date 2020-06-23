package kr.or.meister.admin.model.vo;

import java.util.ArrayList;
import java.util.List;

import kr.or.meister.member.model.vo.MemberVO;
import lombok.Data;

@Data
public class SelectAllMemberPageVO {
	
	private List<MemberVO> list;
	private String pageNavi;
	
	
	public SelectAllMemberPageVO(List<MemberVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
	
}
