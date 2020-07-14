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
import kr.or.meister.member.model.vo.MemberUpdateVO;
import kr.or.meister.member.model.vo.CareerVO;
import kr.or.meister.member.model.vo.LicenseVO;
import kr.or.meister.member.model.vo.MemberJoinSellReviewVO;
import kr.or.meister.member.model.vo.MemberCookieVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;
import kr.or.meister.orders.model.vo.OrdersVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellVO;
import kr.or.meister.request.model.vo.RequestMemberVO;
import kr.or.meister.sell.model.vo.SellData;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;

@Service("memberService")
public class MemberService {

	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	public MemberVO selectOneMember(MemberVO m) {
		// hyeokjin
		MemberVO lm = dao.selectOneMember(m);
		return lm;
	}

	public ArrayList<ChatVO> selectAllChat(MemberVO m) {
		// hyeokjin
		List list = dao.selectAllChat(m);
		return (ArrayList<ChatVO>) list;
	}

	public ArrayList<ChatVO> showChat(String sender, String receiver) {
		// hyeokjin
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		List list = dao.showChat(map);
		return (ArrayList<ChatVO>) list;
	}

	public ArrayList<MessageVO> getMessage(String memberNickname) {
		// hyeokjin
		return (ArrayList<MessageVO>) (dao.getMessage(memberNickname));
	}

	public int getUnreadMsgCnt(String memberNickname) {
		// hyekojin
		return dao.selectUnreadCnt(memberNickname);
	}

	public MemberVO selectOneMember3(MemberVO m) {
		// TODO Auto-generated method stub
		MemberVO lm = dao.selectOneMember3(m);
		return lm;
	}

	public MemberDataVO selectOneMemberInf(int memberNo) {
		MemberUpdateVO member = dao.selectOneMember2(memberNo);
		CareerVO career = dao.selectOneCareer(memberNo);
		LicenseVO license = dao.selectOneLicense(memberNo);
		MemberDataVO m = new MemberDataVO();
		m.setMemberupdatevo(member);
		m.setCareervo(career);
		m.setLicensevo(license);
		return m;
		
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
		MemberVO lm = dao.selectLoginMember(m);
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

	/*
	 * public ArrayList<CouponJoinCouponIssuedVO> selectAllCoupon(int memberNo) {
	 * return (ArrayList<CouponJoinCouponIssuedVO>) dao.couponMoalOpen(memberNo); }
	 * 
	 * public ArrayList<CouponJoinCouponIssuedVO> selectAllCoupon(SellJoinOthersVO
	 * sjo) { return (ArrayList<CouponJoinCouponIssuedVO>) dao.selectAllCoupon(sjo);
	 * }
	 */

	public HashMap<String, Object> selectAllEmploy(int memberNo, int reqPage, int employstatus, int employappro) {
		int numPerPage = 5;
		int totalCount = dao.totalCountEmploy(memberNo);
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
		map.put("memberNo", memberNo);
		map.put("employstatus", employstatus);
		map.put("employappro", employappro);
		List list = dao.selectAllEmploy(map);
		System.out.println("list : " + list);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (reqPage != 1) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllEmploy.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage - 1) + "&memberNickname=&employstatus=" + employstatus + "&employappro=" + employappro
					+ "'><</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/meister/member/selectAllEmploy.do?memberNo=" + memberNo + "&reqPage="
						+ pageNo + "&employstatus=" + employstatus + "&employappro=" + employappro + "'>" + pageNo
						+ "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (reqPage < totalPage) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllEmploy.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage + 1) + "&employstatus=" + employstatus + "&employappro=" + employappro + "'>></a>";
		}
		HashMap<String, Object> employMember = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			EmployMemberVO employMemberVO = (EmployMemberVO) list.get(i);
			employMember.put("employ" + i, employMemberVO);
		}
		employMember.put("number", list.size());
		employMember.put("pageNavi", pageNavi);
		return employMember;
	}

	public HashMap<String, Object> selectAllRequest(int memberNo, int reqPage, String memberNickname, int requeststatus,
			int requestappro) {
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNickname", memberNickname);
		map.put("requeststatus", requeststatus);
		map.put("requestappro", requestappro);
		
		List list = dao.selectAllRequest(map);
		System.out.println("service list : " + list);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (reqPage != 1) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllRequest.do?reqPage=" + (reqPage - 1)
					+ "&memberNickname=" + memberNickname + "&requeststatus=" + requeststatus + "&requestappro="
					+ requestappro + "'><</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/meister/member/selectAllRequest.do?reqPage=" + pageNo
						+ "&memberNickname=" + memberNickname + "&requeststatus=" + requeststatus + "&requestappro="
						+ requestappro + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (reqPage < totalPage) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllRequest.do?reqPage=" + (reqPage + 1)
					+ "&memberNickname=" + memberNickname + "&requeststatus=" + requeststatus + "&requestappro="
					+ requestappro + "'>></a>";
		}
		HashMap<String, Object> requestMember = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			RequestMemberVO requestMemberVO = (RequestMemberVO) list.get(i);
			requestMember.put("request" + i, requestMemberVO);
		}
		requestMember.put("number", list.size());
		requestMember.put("pageNavi", pageNavi);
		return requestMember;
	};

	
	

	
	/*public HashMap<String, Object> selectAllEmploy(int memberNo,int reqPage, int employstatus, int employappro) {
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
	}*/

	public int readMsg(int msgNo) {
		// hyeokjin
		return dao.readMsg(msgNo);
	}

	public HashMap<String, Object> selectAllSell(int memberNo, int reqPage, int sellstatus, int sellappro) {
		int numPerPage = 5;
		int totalCount = dao.totalCountSell(memberNo);
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
		map.put("sellstatus", sellstatus);
		map.put("sellappro", sellappro);
		map.put("memberNo", memberNo);
		List list = dao.selectAllSell(map);
		System.out.println("list : " + list);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (reqPage != 1) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllSell.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage - 1) + "&sellStatus=" + sellstatus + "&sellAppro=" + sellappro + "'><</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/meister/member/selectAllSell.do?memberNo=" + memberNo + "&reqPage="
						+ pageNo + "&sellStatus=" + sellstatus + "&sellAppro=" + sellappro + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (reqPage < totalPage) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllSell.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage + 1) + "&sellStatus=" + sellstatus + "&sellAppro=" + sellappro + "'>></a>";
		}
		HashMap<String, Object> sellJoinMember = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			SellJoinMemberVO sellJoinMemberVO = (SellJoinMemberVO) list.get(i);
			sellJoinMember.put("sell" + i, sellJoinMemberVO);
		}
		sellJoinMember.put("number", list.size());
		sellJoinMember.put("pageNavi", pageNavi);
		return sellJoinMember;
	}

	public HashMap<String, Object> selectAllPick(int memberNo, int reqPage) {
		int numPerPage = 5;
		int totalCount = dao.totalCountPick(memberNo);
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
		List list = dao.selectAllPick(map);
		System.out.println("list : " + list);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (reqPage != 1) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllPick.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage - 1) + "'><</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/meister/member/selectAllPick.do?memberNo=" + memberNo + "&reqPage="
						+ pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (reqPage < totalPage) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllPick.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage + 1) + "'>></a>";
		}
		HashMap<String, Object> sellJoinMember = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			SellJoinMemberVO sellJoinMemberVO = (SellJoinMemberVO) list.get(i);
			sellJoinMember.put("employ" + i, sellJoinMemberVO);
		}
		sellJoinMember.put("number", list.size());
		sellJoinMember.put("pageNavi", pageNavi);
		return sellJoinMember;
	}

	public HashMap<String, Object> selectAllRequestRe(int memberNo, int reqPage) {
		int numPerPage = 5;

		int totalCount = dao.totalCountRequestRe(memberNo);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		map.put("str1", memberNo + "/");
		map.put("str2", "/" + memberNo + "/");
		List list = dao.selectAllRequestRe(map);
		System.out.println("list : " + list);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if (reqPage != 1) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllRequestRe.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage - 1) + "'><</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/meister/member/selectAllRequestRe.do?memberNo=" + memberNo
						+ "&reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (reqPage < totalPage) {
			pageNavi += "<a class='btn' href='/meister/member/selectAllRequestRe.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage + 1) + "'>></a>";
		}
		HashMap<String, Object> requestMember2 = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			RequestMemberVO requestMemberVO = (RequestMemberVO) list.get(i);
			requestMember2.put("employ" + i, requestMemberVO);
		}
		requestMember2.put("number", list.size());
		requestMember2.put("pageNavi", pageNavi);
		return requestMember2;
	}

	public List<OrdersVO> selectAllOrder(int memberNo, int purchase) {

		List<OrdersVO> list = dao.selectAllOrder(memberNo,purchase);

		return list;
	}
	public SellVO selectOneOfSell(int sell_no) {
		return dao.selectOneOfSell(sell_no);
	}

	public int updateProfileMember(MemberDataVO member) {
		MemberUpdateVO member2 = member.getMemberupdatevo();
		CareerVO member3 = member.getCareervo();
		LicenseVO member4 = member.getLicensevo();
		
		int result = dao.updateProfileMember(member2);
		int result2 = dao.updateProfileCareer(member3);
		int result3 = dao.updateProfileLicense(member4);
		if(result ==1&& result2==1&& result3==1) {
			return 1;
		}
		return 0;
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

	


	public SellData selectAllSell2(int memberNo, int reqPage, int sellstatus, int sellappro) {
		int numPerPage = 5;
		int totalCount = dao.totalCountSell(memberNo);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("sellstatus", String.valueOf(sellstatus));
		map.put("sellappro", String.valueOf(sellappro));
		map.put("memberNo", String.valueOf(memberNo));
		List list = dao.selectAllSell2(map);
		System.out.println("list : " + list);
		String pageNavi = "";
		int pageNaviSize = 3;
		int pageNo = 1;
		if (reqPage != 1) {
			pageNo = reqPage - 1;
		}
		if (reqPage != 1) {
			pageNavi += "<a class='btn' href='/meister/member/myprofile.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage - 1) + "&sellStatus=" + sellstatus + "&sellAppro=" + sellappro + "'><</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/meister/member/myprofile.do?memberNo=" + memberNo + "&reqPage="
						+ pageNo + "&sellStatus=" + sellstatus + "&sellAppro=" + sellappro + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (reqPage < totalPage) {
			pageNavi += "<a class='btn' href='/meister/member/myprofile.do?memberNo=" + memberNo + "&reqPage="
					+ (reqPage + 1) + "&sellStatus=" + sellstatus + "&sellAppro=" + sellappro + "'>></a>";
		}
		SellData sd = new SellData((ArrayList<SellVO>) list, pageNavi);
		
		return sd;
	}
	

}
