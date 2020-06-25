package kr.or.meister.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.admin.model.dao.AdminDao;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.MemberJoinVO;
import kr.or.meister.admin.model.vo.SelectAllMemberPageVO;
import kr.or.meister.member.model.vo.MemberVO;

@Service("adminService")
public class AdminService {

	@Autowired
	@Qualifier("adminDao")
	private AdminDao dao;

	public ArrayList<MemberJoinReportVO> memberAllView() {	
		return (ArrayList<MemberJoinReportVO>)dao.selectAllMember();	
	}
	
	
/*--------------------------------------------------------------------------------------------------*/	

	public MemberJoinVO memberOneView(int memberNo) {
		return dao.memberOneView(memberNo);
	}
	
	
/*--------------------------------------------------------------------------------------------------*/	
	
	
	

	public SelectAllMemberPageVO memberAllViewPage(int reqPage) {
		
		int numPerPage = 6;
		System.out.println("한번에 표시할 회원 갯수 : "+numPerPage);
		
		int totalCount = dao.totalCount();
		System.out.println("회원의 전체 갯수 : "+totalCount);
		
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		HashMap<String ,Integer> se = new HashMap<String, Integer>();
		se.put("start", start);
		se.put("end", end);
		List<MemberVO> list = dao.selectList(se);

		
		
		String pageNavi = "";
		
		int pageNaviSize = 5; 
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/memberAllViewFrm.do?reqPage="+(pageNo-pageNaviSize)+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn' style=' background-color:#76D5FF; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/memberAllViewFrm.do?reqPage="+pageNo+"' style=' background-color:#B6EAFA; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</a>";			
				}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/memberAllViewFrm.do?reqPage="+pageNo+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>다음</a>";
		}

		
		SelectAllMemberPageVO sap = new SelectAllMemberPageVO(list, pageNavi);		
		
		return sap;
	}

	
	
/*--------------------------------------------------------------------------------------------------*/	
	

	
	public MemberVO memberLogin(String memberEmail, String memberPw) {
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("memberEmail", memberEmail);
		login.put("memberPw", memberPw);
		return dao.memberLogin(login);
	}
}