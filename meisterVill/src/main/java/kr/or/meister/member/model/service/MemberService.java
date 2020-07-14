package kr.or.meister.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.chat.model.vo.ChatVO;

import kr.or.meister.coupon.model.vo.CouponJoinCouponIssuedVO;
import kr.or.meister.coupon.model.vo.CouponVO;

import kr.or.meister.employ.model.vo.EmployMemberVO;
import kr.or.meister.employ.model.vo.EmployVO;

import kr.or.meister.member.model.dao.MemberDao;

import kr.or.meister.member.model.vo.MemberDataVO;
import kr.or.meister.member.model.vo.MemberJoinSellReviewVO;
import kr.or.meister.member.model.vo.MemberCookieVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;

import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellVO;
import kr.or.meister.request.model.vo.RequestMemberVO;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;


@Service("memberService")
public class MemberService {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;


	public MemberVO selectOneMember(MemberVO m) {
		// hyeokjin
		MemberVO lm =  dao.selectOneMember(m);
		return lm;
	}

	public ArrayList<ChatVO> selectAllChat(MemberVO m) {
		// hyeokjin
		List list = dao.selectAllChat(m);
		return (ArrayList<ChatVO>)list;
	}

	public ArrayList<ChatVO> showChat(String sender, String receiver) {
		// hyeokjin
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", sender);
		map.put("receiver",receiver);
		List list = dao.showChat(map);
		return (ArrayList<ChatVO>)list;
	}

	public ArrayList<MessageVO> getMessage(String memberNickname) {
		// hyeokjin
		return (ArrayList<MessageVO>)(dao.getMessage(memberNickname));
	}

	public int getUnreadMsgCnt(String memberNickname) {
		// hyekojin
		return dao.selectUnreadCnt(memberNickname);
	}

	public MemberVO selectOneMember3(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm =  dao.selectOneMember3(m);
		return lm;
	}


	public MemberDataVO selectOneMember2(MemberDataVO mdv) {
		return dao.selectOneMember2(mdv);
	}

	
	public int updateMemberLevel(MemberVO member) {
		return dao.updateMemberLevel(member);
	}

	public int updateMemberLevel2(MemberVO member) {
		return dao.updateMemberLevel2(member);
	}

	public MemberVO selectOneMember4(MemberVO member) {
		return dao.selectOneMember4(member);
	}


	public MemberVO selectLoginMember(MemberVO m) {
		MemberVO lm =  dao.selectLoginMember(m);
		return lm;
	}

	public String findEmail(MemberVO m) {
		String memberEmail = dao.findEmail(m);
		return memberEmail;
	}

	public MemberVO checkLoginEmail(String memberEmail) {
		return dao.checkLoginEmail(memberEmail);
	}

	public int loginMaintain(MemberCookieVO mcookie) {
		return dao.loginMaintain(mcookie);
	}

	public MemberVO checkNickname(String memberNickname) {
		return dao.checkNickname(memberNickname);
	}


	public int joinMember(MemberVO m) {
		return dao.joinMember(m);
	}

	public int changeForgottenPw(MemberVO m) {
		return dao.changeForgottenPw(m);
	}

	public int welcomeCoupon(int memberNo) {
		return dao.welcomeCoupon(memberNo);
	}
	
	

	
	public HashMap<String, Object> selectAllEmploy(int memberNo,int reqPage, int employstatus, int employappro) {
	      int numPerPage = 5;
	      int totalCount = dao.totalCount(memberNo);
	      int totalPage = 0;
	      if (totalCount % numPerPage == 0) {
	         totalPage = totalCount / numPerPage;
	      } else {
	         totalPage = totalCount / numPerPage + 1;
	      }
	      int start = (reqPage - 1) * numPerPage + 1;
	      int end = reqPage * numPerPage;
	      HashMap<String, Integer> map = new HashMap<String, Integer>();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("employstatus", employstatus);
	      map.put("employappro", employappro);
	      List list = dao.selectAllEmploy(map);
	      System.out.println("list : "+list);
	      String pageNavi = "";
	      int pageNaviSize = 5;
	      int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
	      if (reqPage != 1) {
	         pageNavi += "<a class='btn' href='/meister/member/selectAllEmploy.do?reqPage=" + (reqPage - 1) + "'><</a>";
	      }
	      for (int i = 0; i < pageNaviSize; i++) {
	         if (reqPage == pageNo) {
	            pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
	         } else {
	            pageNavi += "<a class='btn' href='/meister/member/selectAllEmploy.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
	         }
	         pageNo++;
	         if (pageNo > totalPage) {
	            break;
	         }
	      }
	      if (reqPage < totalPage) {
	         pageNavi += "<a class='btn' href='/meister/member/selectAllEmploy.do?reqPage=" + (reqPage+1) + "'>></a>";
	      }
	      HashMap<String, Object> employMember = new HashMap<String, Object>();
	      for (int i = 0; i < list.size(); i++) {
	         EmployMemberVO employMemberVO = (EmployMemberVO)list.get(i);
	         employMember.put("employ"+i, employMemberVO);
	      }
	      employMember.put("number", list.size());
	      employMember.put("pageNavi", pageNavi);
	      return employMember;
	   }

	public HashMap<String, Object> selectAllRequest(int memberNo, int reqPage, String memberNickname) {
		 int numPerPage = 5;
	      int totalCount = dao.totalCountRequest(memberNickname);
	      int totalPage = 0;
	      if (totalCount % numPerPage == 0) {
	         totalPage = totalCount / numPerPage;
	      } else {
	         totalPage = totalCount / numPerPage + 1;
	      }
	      int start = (reqPage - 1) * numPerPage + 1;
	      int end = reqPage * numPerPage;
	      HashMap<String, Integer> map = new HashMap<String, Integer>();
	      map.put("start", start);
	      map.put("end", end);
	      List list = dao.selectAllRequest(map);
	      System.out.println("list : "+list);
	      String pageNavi = "";
	      int pageNaviSize = 5;
	      int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
	      if (reqPage != 1) {
	         pageNavi += "<a class='btn' href='/meister/member/selectAllRequest.do?reqPage=" + (reqPage - 1) + "'><</a>";
	      }
	      for (int i = 0; i < pageNaviSize; i++) {
	         if (reqPage == pageNo) {
	            pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
	         } else {
	            pageNavi += "<a class='btn' href='/meister/member/selectAllRequest.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
	         }
	         pageNo++;
	         if (pageNo > totalPage) {
	            break;
	         }
	      }
	      if (reqPage < totalPage) {
	         pageNavi += "<a class='btn' href='/meister/member/selectAllRequest.do?reqPage=" + (reqPage+1) + "'>></a>";
	      }
	      HashMap<String, Object> requestMember = new HashMap<String, Object>();
	      for (int i = 0; i < list.size(); i++) {
	         RequestMemberVO requestMemberVO = (RequestMemberVO)list.get(i);
	         requestMember.put("request"+i, requestMemberVO);
	      }
	      requestMember.put("number", list.size());
	      requestMember.put("pageNavi", pageNavi);
	      return requestMember;
	}

	public int readMsg(int msgNo) {
		//hyeokjin
		return dao.readMsg(msgNo);
	}

	public ArrayList<MemberJoinSellReviewVO> allMeister() {
		return (ArrayList<MemberJoinSellReviewVO>)dao.allMeistser();
	}

	public int totalCountMeister() {
		return dao.totalCountMeister();
	}

	public ArrayList<SellVO> mainIt() {
		return (ArrayList<SellVO>)dao.mainIt();
	}

	




}
