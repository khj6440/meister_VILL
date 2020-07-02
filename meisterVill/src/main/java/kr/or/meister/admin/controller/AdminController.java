package kr.or.meister.admin.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.admin.model.service.AdminService;
import kr.or.meister.admin.model.vo.AdminMemberJoinSellJoinOrdersVO;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.MemberJoinVO;
import kr.or.meister.admin.model.vo.MemberStatsVO;
import kr.or.meister.admin.model.vo.SelectAllMemberPageVO;
import kr.or.meister.admin.model.vo.SellAndRequestVO;
import kr.or.meister.admin.model.vo.SellSellVO;
import kr.or.meister.admin.model.vo.SellJoinOrdersJoinOptionVO;
import kr.or.meister.admin.model.vo.SellStatsVO;
import kr.or.meister.admin.model.vo.selectAllSellPageVO;
import kr.or.meister.member.model.vo.MemberVO;

@Controller
@RequestMapping(value="/meister/admin")
public class AdminController {
	

	
	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	


	@RequestMapping(value="/memberHalt.do")
	public String memberHalt(HttpServletRequest request, int memberNo) {
		
		int result = service.memberHalt(memberNo);

       if(result>0) {
    	   return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
       }else {
    	   return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
       }
	}
	
	
	@RequestMapping(value="sellListFrm.do")
	public String sellList(HttpSession session, HttpServletRequest request, int reqPage) {
		
		selectAllSellPageVO sap = service.sellList(reqPage);
		
		request.setAttribute("list", sap.getList());
		request.setAttribute("pageNavi", sap.getPageNavi());
		return "admin/sellList.jsp?"+reqPage;
	}
	
	
		
	@RequestMapping(value="/memberRollback.do")
	public String memberRollback(HttpServletRequest request, int memberNo) {
		
		int result = service.memberRollback(memberNo);
		
		if(result > 0) {
			return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
		}else {
	    	return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
	       }
	}
	
	@RequestMapping(value="/memberDeleteRollback.do")
	public String memberDeleteRollback(HttpServletRequest request, int memberNo) {
		
		int result = service.memberRollback(memberNo);
		
		if(result > 0) {
			return "redirect:/meister/admin/memberDeletionFrm.do?reqPage=1";
		}else {
			return "redirect:/meister/admin/memberDeletionFrm.do?reqPage=1";
	       }
	}
	
	@RequestMapping(value="/memberHaltRollback.do")
	public String memberHaltRollback(HttpServletRequest request, int memberNo) {
		
		int result = service.memberRollback(memberNo);
		
		if(result > 0) {
			return "redirect:/meister/admin/memberHaltFrm.do?reqPage=1";
		}else {
	    	return "redirect:/meister/admin/memberHaltFrm.do?reqPage=1";
	       }
	}
	
	
	
	@RequestMapping(value="/memberDeletion.do")
	public String memberDeletion(HttpServletRequest request, int memberNo) {
		
		int result = service.memberDelete(memberNo);
		
		if(result > 0) {
			return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
		}else {
			return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
	       }
	}
	
	
	
	
	@RequestMapping(value="/memberAllViewFrm.do")
	public String memberAllViewFrm(HttpSession session, HttpServletRequest request, int reqPage) {
		
		SelectAllMemberPageVO sap = service.memberAllViewPage(reqPage);
		
		request.setAttribute("list", sap.getList());
		request.setAttribute("pageNavi", sap.getPageNavi());
		return "admin/memberAllView.jsp?"+reqPage;
	}
	
		
	@RequestMapping(value="/memberOneViewFrm.do")
	public String memberOneViewFrm(HttpServletRequest request, int memberNo) {
		MemberJoinVO member = new MemberJoinVO();
		System.out.println("회원번호 : "+memberNo);
		member = service.memberOneView(memberNo);
		List<AdminMemberJoinSellJoinOrdersVO> sellList = service.memberSell(memberNo);
		List<SellJoinOrdersJoinOptionVO> sellOrderList =service.memberOrder(memberNo);

		int sum = 0;
		int listNum = 0;
		int sellHigh = 0;
		
		if(sellList.get(0).getSellNo() != 0) {
		listNum = sellList.size();
		}
		
		if(sellOrderList.size() != 0) {

			for(int i=0; i<sellOrderList.size(); i++) {		
				sum += sellOrderList.get(i).getSellPrice();
				sum += sellOrderList.get(i).getOptionPrice();
			}
			sellHigh = sellOrderList.get(0).getSellPrice();

		}
	
		request.setAttribute("listNum", listNum);
		request.setAttribute("price", sellHigh);
		request.setAttribute("sum", sum);
		request.setAttribute("so", sellOrderList);
		request.setAttribute("m", member);
		request.setAttribute("s", sellList);
		return "admin/memberOneView.jsp?"+memberNo;
	}
	
	
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/memberSell.do",
	 * produces="application/json; charset=utf-8;") public String
	 * memberSell(HttpServletRequest request,HttpServletResponse response, int
	 * memberNo) {
	 * 
	 * System.out.println("회원번호 :"+memberNo );
	 * 
	 * List<AdminMemberJoinSellJoinOrdersVO> sellList =
	 * service.memberSell(memberNo);
	 * 
	 * return new Gson().toJson(sellList); 
	 * }
	 */
	
	
	@RequestMapping(value="/adminLogin.do")
	public String memberLogin(HttpSession session, String memberEmail,String memberPw ) {
		MemberVO member = new MemberVO();

		System.out.println("회원이메일 : "+memberEmail);
		System.out.println("회원비번 : "+memberPw);
		member = service.memberLogin(memberEmail,memberPw);
		if(member != null) {
			session.setAttribute("member", member);
			return "redirect:/meister/admin/adminIndexFrm.do";
		}else {
			return "redirect:/index.jsp";
		}
	}
	
	

		@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "admin/loginPage";
	}
		
			
		@RequestMapping(value="/memberHaltFrm.do")
		public String memberHaltFrm(HttpSession session, HttpServletRequest request, int reqPage) {
			
			SelectAllMemberPageVO sap = service.memberHaltPage(reqPage);
			
			if(sap.getList() != null) {
			request.setAttribute("list", sap.getList());
			}
			request.setAttribute("pageNavi", sap.getPageNavi());

			return "admin/memberHaltView.jsp?"+reqPage;
		}
		
			
			@RequestMapping(value="/memberDeletionFrm.do")
			public String memberDeletionFrm(HttpSession session, HttpServletRequest request, int reqPage) {
				
				SelectAllMemberPageVO sap = service.memberDeletion(reqPage);
				
				request.setAttribute("list", sap.getList());
				request.setAttribute("pageNavi", sap.getPageNavi());

				return "admin/memberDeletionView.jsp?"+reqPage;
			}
	
	
	@RequestMapping(value="/adminIndexFrm.do")
	public String adminIndexFrm(HttpServletRequest request) {
		DecimalFormat df = new DecimalFormat("#,###");
		MemberStatsVO ms = service.memberStats();
		SellStatsVO ss = service.sellStats();
		SellAndRequestVO saq = service.sellAndRequest();
		int sellRequestSum = 0;
		
		for(int i=0; i<saq.getSs().size(); i++) {
			sellRequestSum += saq.getSs().get(i).getSellPrice();
			sellRequestSum += saq.getSs().get(i).getOptionPrice();
			
			System.out.println("셀 가격 : "+saq.getSs().get(i).getSellPrice());
			System.out.println("셀 옵션 가격 : "+saq.getSs().get(i).getOptionPrice());
			System.out.println("총 가격 : "+sellRequestSum);
			System.out.println();
		}
		
		for(int i=0; i<saq.getRs().size(); i++) {
			sellRequestSum += saq.getRs().get(i).getRequestPrice();
			
			System.out.println("리퀘스트 가격 : "+saq.getRs().get(i).getRequestPrice());
			System.out.println("총 가격 : "+sellRequestSum);
		}
		 
		
		int sSum = ss.getRCnt() + ss.getSCnt() + ss.getECnt();
		
		float sS = (float)ss.getSellCnt()/(float)sSum*100;
		float sR = (float)ss.getRequestCnt()/(float)sSum*100;
		float sE = (float)ss.getEmployCnt()/(float)sSum*100;
		
		float l0 = (float)ms.getLevel0Cnt()/(float)ms.getCnt()*100;
		float l1 = (float)ms.getLevel1Cnt()/(float)ms.getCnt()*100;
		float l2 = (float)ms.getLevel2Cnt()/(float)ms.getCnt()*100;
		
		String sSell = String.format("%.1f", sS);
		String sRequest = String.format("%.1f", sR);
		String sEmploy = String.format("%.1f", sE);
		String level0 = String.format("%.1f", l0);
		String level1 = String.format("%.1f", l1);
		String level2 = String.format("%.1f", l2);
		
		request.setAttribute("level0Cnt", ms.getLevel0Cnt());
		request.setAttribute("level1Cnt", ms.getLevel1Cnt());
		request.setAttribute("level2Cnt", ms.getLevel2Cnt());
		request.setAttribute("level0", level0);
		request.setAttribute("level1", level1);
		request.setAttribute("level2", level2);
		
		request.setAttribute("sEmployCnt", ss.getEmployCnt());
		request.setAttribute("sRequestCnt", ss.getRequestCnt());
		request.setAttribute("sSellCnt", ss.getSellCnt());
		request.setAttribute("sSell", sSell);
		request.setAttribute("sRequest", sRequest);
		request.setAttribute("sEmploy", sEmploy);
		
		request.setAttribute("sellRequestSum", df.format(sellRequestSum));
		
		return "admin/adminIndex";
	}
}

