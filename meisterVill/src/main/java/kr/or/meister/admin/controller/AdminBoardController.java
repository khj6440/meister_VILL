package kr.or.meister.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.admin.model.service.AdminBoardService;
import kr.or.meister.admin.model.service.AdminService;
import kr.or.meister.admin.model.vo.AdminNoticePageVO;
import kr.or.meister.admin.model.vo.AdminQnaPageVO;
import kr.or.meister.admin.model.vo.SelectAllRequestPageVO;
import kr.or.meister.admin.model.vo.selectAllSellPageVO;
import kr.or.meister.notice.model.vo.NoticeVO;
import kr.or.meister.notice.model.vo.QnAVO;
import kr.or.meister.sell.model.service.SellService;

@Controller
@RequestMapping(value="/meister/adminBoard")
public class AdminBoardController {

	
	@Autowired
	@Qualifier("adminBoardService")
	private AdminBoardService boardService;
	
	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@Autowired
	@Qualifier("sellService")
	private SellService sellService;
	
	
	
	@RequestMapping(value="/sellHalt.do")
	public String sellHalt(int sellNo) {
		
		int result = boardService.sellHalt(sellNo);

       if(result>0) {
    	   return "redirect:/meister/admin/sellListFrm.do?reqPage=1";
       }else {
    	   return "redirect:/meister/admin/sellListFrm.do?reqPage=1";
       }
	}
	
	@RequestMapping(value="/boardRollback.do")
	public String boardRollback(int sellNo) {
		
		int result = boardService.boardRollback(sellNo);

       if(result>0) {
    	   return "redirect:/meister/admin/sellListFrm.do?reqPage=1";
       }else {
    	   return "redirect:/meister/admin/sellListFrm.do?reqPage=1";
       }
	}
	
	@RequestMapping(value="/sellDelete.do")
	public String sellDelete(int sellNo) {
		
		int result = boardService.sellDelete(sellNo);

       if(result>0) {
    	   return "redirect:/meister/admin/sellListFrm.do?reqPage=1";
       }else {
    	   return "redirect:/meister/admin/sellListFrm.do?reqPage=1";
       }
	}
	
/*-----------------------------------------------------------------------------------------------------------------------*/

	
	@RequestMapping(value="/requestApproval.do")
	public String requestHalt(int requestNo) {
		
		int result = boardService.requestApproval(requestNo);

       if(result>0) {
    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
       }else {
    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
       }
	}
	
	@RequestMapping(value="/requestNoApproval.do")
	public String requestNoApproval(int requestNo) {
		
		int result = boardService.requestNoApproval(requestNo);

       if(result>0) {
    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
       }else {
    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
       }
	}
	


/*---------------------------------------------------------------------------------------------------------------------*/
	
	@ResponseBody
	@RequestMapping(value="/sellAllView.do", produces="application/json; charset=utf-8;")
	public String sellAllView(int reqPage, int memberNo) {
					
		selectAllSellPageVO srp = service.sellAllView(reqPage, memberNo);
		
        return new Gson().toJson(srp); 
	}
	
	
	@ResponseBody
	@RequestMapping(value="/pickAllView.do", produces="application/json; charset=utf-8;")
	public String pickAllView(int reqPage, int memberNo) {
	
		selectAllSellPageVO srp = service.pickAllView(reqPage, memberNo);
		
			return new Gson().toJson(srp); 

		    }

	
	/*---------------------------------------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/requestEnd.do")
	public String requestEnd(int requestNo) {
		int result = boardService.requestEnd(requestNo);

	       if(result>0) {
	    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
	       }else {
	    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
	       }
	}
	
	@RequestMapping(value="/requestRollback.do")
	public String requestRollback(int requestNo) {
		int result = boardService.requestRollback(requestNo);

	       if(result>0) {
	    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
	       }else {
	    	   return "redirect:/meister/admin/requestApprovalFrm.do?reqPage=1";
	       }
	}
	
/*-----------------------------------------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/adminNotice.do")
	public String adminNotice(HttpServletRequest request,int reqPage) {
		
		AdminNoticePageVO adminNotice = boardService.adminNotice(reqPage);
		int totalCnt = boardService.adminNoticeCnt();
		
		request.setAttribute("list", adminNotice.getList());
		request.setAttribute("pageNavi", adminNotice.getPageNavi());
		request.setAttribute("reqPage", reqPage);
		request.setAttribute("totalCnt", totalCnt);
		return "admin/adminNoticeList.jsp?"+reqPage;
	}
	
/*-----------------------------------------------------------------------------------------------------------------------*/
	
		@RequestMapping(value="adminViewPage.do")
		public String adminViewPage(HttpServletRequest result,int noticeNo) {
			
			NoticeVO notice = boardService.noticeOneView(noticeNo);
			
			result.setAttribute("notice", notice);
			return "admin/adminViewPage";
		}
		
		
		@RequestMapping(value="noticeDelete.do")
		public String noticeDelete(int noticeNo) {
			int result = boardService.noticeDelete(noticeNo);
			
			if(result > 0) {
				return "redirect:/";
			}else {
				return "redirect:/";
			}	
		}
		
		
		@RequestMapping(value="adminQnA.do")
		public String adminQnA(HttpServletRequest request,int reqPage) {
			
			AdminQnaPageVO qna = boardService.qna(reqPage);
			int totalCnt = boardService.qnaCnt();
			request.setAttribute("list", qna.getList());
			request.setAttribute("pageNavi", qna.getPageNavi());
			request.setAttribute("reqPage", reqPage);
			request.setAttribute("totalCnt", totalCnt);
			return"admin/qna.jsp?"+reqPage;
		}
		
		@RequestMapping(value="newQna.do")
		public String newQna(String qnaTitle, String qnaContent) {
			
			System.out.println("제목 : "+qnaTitle);
			System.out.println("내용 : "+qnaContent);
			
			int qna = boardService.newQna(qnaTitle, qnaContent);
			
			return "redirect:/meister/adminBoard/adminQnA.do?reqPage=1";
		}
		
		@RequestMapping(value="adminNoticeWrite.do")
		public String adminNoticeWrite() {
			return "admin/adminNoticeWrite";
		}
		
		@RequestMapping(value="adminNoticeInsert.do")
		public String adminNoticeInsert(HttpServletRequest request,String memberNickname, String noticeTitle, String ck4) {

			int result = boardService.adminNoticeInsert(memberNickname,noticeTitle,ck4);

			return "redirect:/meister/adminBoard/adminNotice.do?reqPage=1";
		}
		
		@RequestMapping(value="noticeView.do")
		public String noticeView(HttpServletRequest request, int noticeNo) {
			int viewCount = boardService.viewCount(noticeNo);
			NoticeVO notice= boardService.NoticeView(noticeNo);
			
			request.setAttribute("n", notice);
			return "admin/noticeView";
		}
	
}
