package kr.or.meister.member.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MemberDataVO {
	private ArrayList<MemberVO> memberList;
	private ArrayList<CareerVO> careerList;
	private ArrayList<LicenseVO> lisenceList;
	
}
