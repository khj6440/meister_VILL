package kr.or.meister.admin.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.admin.model.service.AdminService;
import kr.or.meister.admin.model.vo.AdminMemberJoinSellJoinOrdersVO;
import kr.or.meister.admin.model.vo.MemberInformVO;
import kr.or.meister.admin.model.vo.MemberJoinEmployVO;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.MemberJoinVO;
import kr.or.meister.admin.model.vo.MemberMaxMoneyVO;
import kr.or.meister.admin.model.vo.MemberStatsVO;
import kr.or.meister.admin.model.vo.SelectAllMemberPageVO;
import kr.or.meister.admin.model.vo.SelectAllRequestPageVO;
import kr.or.meister.admin.model.vo.SellAndRequestVO;
import kr.or.meister.admin.model.vo.SellSellVO;
import kr.or.meister.admin.model.vo.SellJoinOrdersJoinOptionVO;
import kr.or.meister.admin.model.vo.SellStatsVO;
import kr.or.meister.admin.model.vo.selectAllSellPageVO;
import kr.or.meister.etc.model.vo.ReportVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.sell.model.service.SellService;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellVO;

@Controller
@RequestMapping(value="/meister/admin")
public class AdminController {
	

	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@Autowired
	@Qualifier("sellService")
	private SellService sellService;
	
	@RequestMapping(value="approval.do")
	public String approval(int sellNo, HttpServletRequest request) {
		
		int result = service.approval(sellNo);
		
		if(result>0) {
			return "redirect:/meister/admin/sellApprovalFrm.do?reqPage=1";
		}else {
			return "redirect:/meister/admin/sellApprovalFrm.do?reqPage=1";
		}	
	}
	
	
	@RequestMapping(value="approvalNo.do")
	public String approvalNo(int sellNo, HttpServletRequest request) {
		
		int result = service.approval(sellNo);
		
		if(result>0) {
			return "redirect:/meister/admin/sellApprovalFrm.do?reqPage=1";
		}else {
			return "redirect:/meister/admin/sellApprovalFrm.do?reqPage=1";
		}	
	}

	
	@RequestMapping(value="/qwe.do")
	public String qwe() {
		return "admin/qwe";
	}

	@RequestMapping(value="/memberHalt.do")
	public String memberHalt(HttpServletRequest request, int memberNo) {
		
		int result = service.memberHalt(memberNo);

       if(result>0) {
    	   return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
       }else {
    	   return "redirect:/meister/admin/memberAllViewFrm.do?reqPage=1";
       }
	}
	
	@RequestMapping(value="requestApprovalFrm.do")
	public String requestApproval(HttpSession session, HttpServletRequest request, int reqPage) {
		
		SelectAllRequestPageVO srp = service.requestApprovalFrm(reqPage);
		int totalCnt = service.requestApprovalCnt();
		request.setAttribute("list", srp.getList());
		request.setAttribute("pageNavi", srp.getPageNavi());
		request.setAttribute("reqPage", reqPage);
		request.setAttribute("totalCnt", totalCnt);
		return "admin/requestApproval.jsp?"+reqPage;
	}
	
	@RequestMapping(value="sellApprovalFrm.do")
	public String sellApproval(HttpSession session, HttpServletRequest request, int reqPage) {
		
		selectAllSellPageVO sap = service.sellApproval(reqPage);
		int totalCnt = service.sellApprovalCnt();
		request.setAttribute("list", sap.getList());
		request.setAttribute("pageNavi", sap.getPageNavi());
		request.setAttribute("reqPage", reqPage);
		request.setAttribute("totalCnt", totalCnt);
		return "admin/sellApproval.jsp?"+reqPage;
	}
	
	
	@RequestMapping(value="sellListFrm.do")
	public String sellList(HttpSession session, HttpServletRequest request, int reqPage) {
		
		selectAllSellPageVO sap = service.sellList(reqPage);
		
		request.setAttribute("list", sap.getList());
		request.setAttribute("pageNavi", sap.getPageNavi());
		return "admin/sellList.jsp?"+reqPage;
	}
	
	@RequestMapping(value="requestListFrm.do")
	public String requestListFrm(HttpServletRequest request, int reqPage) {
		
		SelectAllRequestPageVO srp = service.requestListFrm(reqPage);
		
		request.setAttribute("list", srp.getList());
		request.setAttribute("pageNavi", srp.getPageNavi());
		return "admin/requestList.jsp?"+reqPage;
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
		int totalCnt = service.totalCount();
		request.setAttribute("list", sap.getList());
		request.setAttribute("pageNavi", sap.getPageNavi());
		request.setAttribute("reqPage", reqPage);
		request.setAttribute("totalCnt", totalCnt);
		return "admin/memberAllView.jsp?"+reqPage;
	}
	
		
	@RequestMapping(value="/memberOneViewFrm.do")
	public String memberOneViewFrm(HttpServletRequest request, int memberNo) {
		NumberFormat df = NumberFormat.getNumberInstance();
		MemberJoinVO member = new MemberJoinVO();

		member = service.memberOneView(memberNo);
		List<AdminMemberJoinSellJoinOrdersVO> sellList = service.memberSell(memberNo);
		List<SellJoinOrdersJoinOptionVO> sellOrderList =service.memberOrder(memberNo);
		List<MemberInformVO> career = service.memberCareer(memberNo);
		List<MemberInformVO> license = service.memberLicense(memberNo);
		List<AdminMemberJoinSellJoinOrdersVO> pick = service.memberPick(memberNo);
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
	
		request.setAttribute("listNum", df.format(listNum));
		request.setAttribute("price", df.format(sellHigh));
		request.setAttribute("sum", df.format(sum));
		request.setAttribute("so", sellOrderList);
		request.setAttribute("m", member);
		request.setAttribute("s", sellList);
		request.setAttribute("career", career);
		request.setAttribute("license", license);
		request.setAttribute("pick", pick);

		return "admin/memberOneView.jsp?"+memberNo;
	}
	
	
	
	@RequestMapping(value="/memberOneViewSellView.do", produces="application/json; charset=utf-8;")
	public String memberOneViewSellView(HttpServletRequest request, int memberNo) {
		MemberJoinVO member = new MemberJoinVO();

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
		
		return new Gson().toJson(sellList); 
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
	

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/indexFrm.do")
	public String indexFrm(HttpSession session) {
		return "redirect:/index.jsp";
	}
		
			
		@RequestMapping(value="/memberHaltFrm.do")
		public String memberHaltFrm(HttpSession session, HttpServletRequest request, int reqPage) {
			
			SelectAllMemberPageVO sap = service.memberHaltPage(reqPage);
			int totalCnt = service.totalHaltCount();
			if(sap.getList() != null) {
			request.setAttribute("list", sap.getList());
			}
			request.setAttribute("pageNavi", sap.getPageNavi());
			request.setAttribute("reqPage", reqPage);
			request.setAttribute("totalCnt", totalCnt);
			return "admin/memberHaltView.jsp?"+reqPage;
		}
		
			
			@RequestMapping(value="/memberDeletionFrm.do")
			public String memberDeletionFrm(HttpSession session, HttpServletRequest request, int reqPage) {
				
				SelectAllMemberPageVO sap = service.memberDeletion(reqPage);
				int totalCnt = service.totalDeletionCount();
				request.setAttribute("list", sap.getList());
				request.setAttribute("pageNavi", sap.getPageNavi());
				request.setAttribute("reqPage", reqPage);
				request.setAttribute("totalCnt", totalCnt);
				return "admin/memberDeletionView.jsp?"+reqPage;
			}
			
			

/*------------------------------------메인페이지 Frm------------------------------------------------------------*/
			
	@RequestMapping(value="/adminIndexFrm.do")
	public String adminIndexFrm(HttpServletRequest request) {

		List<AdminMemberJoinSellJoinOrdersVO> mainSell = service.adminMainSellList();
		List<MemberJoinEmployVO> mainEmploy = service.adminMainEmployList();
		NumberFormat df = NumberFormat.getNumberInstance();
		MemberStatsVO ms = service.memberStats();
		SellStatsVO ss = service.sellStats();
		SellAndRequestVO saq = service.sellAndRequest();
		SellAndRequestVO oneMemberSaq = service.oneMemberSellAndRequest();
		int reportCnt = service.reportCnt();
		
		int allSum = 0;
		int allMember = 0;
		int sellSum = 0;
		int sellMember = 0;
		int requestSum = 0;
		int requestMember = 0;
		int sellRequestSum = 0;
		if(oneMemberSaq.getRs().size() != 0) {
		requestSum = oneMemberSaq.getRs().get(0).getRequestPrice();
		requestMember =  Integer.parseInt(oneMemberSaq.getRs().get(0).getRequestResMembers());
		
		for(int i=0; i<oneMemberSaq.getRs().size(); i++) {
			if(requestSum < oneMemberSaq.getRs().get(i).getRequestPrice()) {
				requestSum = oneMemberSaq.getRs().get(i).getRequestPrice();
				requestMember = Integer.parseInt(oneMemberSaq.getRs().get(i).getRequestResMembers());
			}
		}
		
		}
		
		if(oneMemberSaq.getRs().size() == 0) {
			requestSum = 0;
			requestMember = 0;
		}
		
		
/*-----------------------------------------sell최대 가격 구하기-------------------------------------------------------------*/
		
		if(oneMemberSaq.getSs().size() != 0) {
		for(int i=0; i<oneMemberSaq.getSs().size(); i++) {
			oneMemberSaq.getSs().get(i).setSellPrice
				(oneMemberSaq.getSs().get(i).getSellPrice()+
					oneMemberSaq.getSs().get(i).getOptionPrice()); 			
		}
		
		sellSum = oneMemberSaq.getSs().get(0).getSellPrice();
		sellMember = oneMemberSaq.getSs().get(0).getSellWriter();
		
		
		for(int i=0; i<oneMemberSaq.getSs().size(); i++) {
			if(sellSum < oneMemberSaq.getSs().get(i).getSellPrice()) {
				sellSum = oneMemberSaq.getSs().get(i).getSellPrice();
				sellMember = oneMemberSaq.getSs().get(i).getSellWriter();
			}
		}
	}

		if(oneMemberSaq.getSs().size() == 0){
			sellSum = 0;
			sellMember = 0;
		}
		
/*------------------------------------------------------------------------------------------------------------------------*/
		

		

		

		if(sellSum > requestSum) {
			allSum = sellSum;
			allMember = sellMember;
		}else {
			allSum = requestSum;
			allMember = requestMember;
		}


		MemberJoinVO sm = new MemberJoinVO();
		MemberJoinVO rm = new MemberJoinVO();
		MemberJoinVO am = new MemberJoinVO();
		sm = service.memberOneView(sellMember);
		rm = service.memberOneView(requestMember);
		am = service.memberOneView(allMember);

/*----------------------------------------------------------------------------------------------------------------------*/		
		
		for(int i=0; i<saq.getSs().size(); i++) {
			sellRequestSum += saq.getSs().get(i).getSellPrice();
			sellRequestSum += saq.getSs().get(i).getOptionPrice();
		}
		
		for(int i=0; i<saq.getRs().size(); i++) {
			sellRequestSum += saq.getRs().get(i).getRequestPrice();
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
		
		request.setAttribute("sm", sm);
		request.setAttribute("sellSum", df.format(sellSum));
		request.setAttribute("rm", rm);
		request.setAttribute("requestSum", df.format(requestSum));
		request.setAttribute("am", am);
		request.setAttribute("allSum", df.format(allSum));
		
		request.setAttribute("sellRequestSum", df.format(sellRequestSum));
		
		request.setAttribute("mainSell", mainSell);
		request.setAttribute("mainEmploy", mainEmploy);
		request.setAttribute("reportCnt", reportCnt);
		return "admin/adminIndex";
	}
	
	
}

