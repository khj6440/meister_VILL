package kr.or.meister.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.admin.model.dao.AdminBoardDao;
import kr.or.meister.admin.model.dao.AdminDao;
import kr.or.meister.admin.model.vo.AdminMemberJoinSellJoinOrdersVO;
import kr.or.meister.admin.model.vo.AdminNoticePageVO;
import kr.or.meister.admin.model.vo.AdminQnaPageVO;
import kr.or.meister.admin.model.vo.AdminReportVO;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.ReportPageVO;
import kr.or.meister.admin.model.vo.ReportSaveVO;
import kr.or.meister.admin.model.vo.selectAllSellPageVO;
import kr.or.meister.notice.model.vo.NoticeVO;
import kr.or.meister.notice.model.vo.QnAVO;

@Service("adminBoardService")
public class AdminBoardService {

	@Autowired
	@Qualifier("adminBoardDao")
	private AdminBoardDao boardDao;
	
	@Autowired
	@Qualifier("adminDao")
	private AdminDao dao;
	
	
	public int sellHalt(int sellNo) {
		return boardDao.sellHalt(sellNo);
	}


	public int boardRollback(int sellNo) {
		return boardDao.boardRollback(sellNo);
	}


	public int sellDelete(int sellNo) {
		return boardDao.sellDelete(sellNo);
	}
	
	public int reviewDelete(int reportNo) {
		return boardDao.reviewDelete(reportNo);
	}
	
	public int reviewOk(int reportNo) {
		return boardDao.reviewOk(reportNo);
	}
	
	public int reviewRealDelete(int reportNo, int reportBoardNo) {
		HashMap<String ,Object> rrs = new HashMap<String, Object>();
		rrs.put("reportNo", reportNo);
		rrs.put("reportBoardNo", reportBoardNo);
		
		return boardDao.reviewRealDelete(rrs);
	}
	
	public int reviewBack(int reportNo) {
		return boardDao.reviewBack(reportNo);
	}
	
	public int reDel(int reviewNo) {
		return boardDao.reDel(reviewNo);
	}
	
	public int resDel(int reportSaveNo) {
		return boardDao.resDel(reportSaveNo);
	}
	
	public int reviewSaveBack(int reviewNo ,int sellNo, String reviewSaveContent) {
		HashMap<String ,Object> rrs = new HashMap<String, Object>();
		rrs.put("reviewNo", reviewNo);
		rrs.put("sellNo", sellNo);
		rrs.put("reviewSaveContent", reviewSaveContent);

		
		return boardDao.reviewSaveBack(rrs);
	}
	

/*------------------------------------------------------------------------------------------------------------------------*/

	public int requestApproval(int requestNo) {
		return boardDao.requestApproval(requestNo);
	}


	public int requestNoApproval(int requestNo) {
		return boardDao.requestNoApproval(requestNo);
	}
	
	public int requestEnd(int requestNo) {
		return boardDao.requestEnd(requestNo);
	}

	public int requestRollback(int requestNo) {
		return boardDao.requestRollback(requestNo);
	}


/*------------------------------------------------------------------------------------------------------------------------*/	
	
	

	
	public int adminNoticeCnt() {
		return dao.adminNoticeCnt();
	}
	
	public AdminNoticePageVO adminNotice(int reqPage) {
			int numPerPage = 12;
			
			int totalCount = dao.adminNoticeCnt();
			System.out.println("공지사항 전체 갯수 : "+totalCount);
			
			System.out.println("한번에 표시할 게시물 갯수 : "+numPerPage);
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
			List<NoticeVO> list = dao.adminNoticeList(se);

			
			
			String pageNavi = "";
			
			int pageNaviSize = 5; 
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			
			if(pageNo != 1) {
				pageNavi += "<a class='btn' href='/meister/adminBoard/adminNotice.do?reqPage="+(pageNo-pageNaviSize)+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>이전</a>";
			}
			for(int i=0; i<pageNaviSize; i++) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='btn' style=' background-color:#76D5FF; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='btn' href='/meister/adminBoard/adminNotice.do?reqPage="+pageNo+"' style=' background-color:#B6EAFA; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</a>";			
					}
				pageNo++;
				if(pageNo>totalPage) {
					break;
				}
			}
			
			if(pageNo <= totalPage) {
				pageNavi += "<a class='btn' href='/meister/adminBoard/adminNotice.do?reqPage="+pageNo+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>다음</a>";
			}

			
			AdminNoticePageVO anp = new AdminNoticePageVO(list, pageNavi);		
			
				
			return anp;

	}


	public NoticeVO noticeOneView(int noticeNo) {
		return boardDao.noticeOneView(noticeNo);
	}


	public int noticeDelete(int noticeNo) {
		return boardDao.noticeDelete(noticeNo);
	}


	
	public int qnaCnt() {
		return dao.adminQnaCnt();
	}
	
	public AdminQnaPageVO qna(int reqPage) {
		
		int numPerPage = 12;
		
		int totalCount = dao.adminQnaCnt();
		System.out.println("공지사항 전체 갯수 : "+totalCount);
		
		System.out.println("한번에 표시할 게시물 갯수 : "+numPerPage);
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
		List<QnAVO> list = dao.adminQnaList(se);

		
		
		String pageNavi = "";
		
		int pageNaviSize = 5; 
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/adminQnA.do?reqPage="+(pageNo-pageNaviSize)+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn' style=' background-color:#76D5FF; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/meister/adminBoard/adminQnA.do?reqPage="+pageNo+"' style=' background-color:#B6EAFA; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</a>";			
				}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/adminQnA.do?reqPage="+pageNo+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>다음</a>";
		}

		
		AdminQnaPageVO qna = new AdminQnaPageVO(list, pageNavi);		
		
			
		return qna;
	}


	public int newQna(String qnaTitle, String qnaContent) {
		
		HashMap<String ,String> qna = new HashMap<String, String>();
		qna.put("qnaTitle", qnaTitle);
		qna.put("qnaContent", qnaContent);
		
		return boardDao.newQna(qna);
	}



	public int adminNoticeInsert(String memberNickname, String noticeTitle, String ck4) {
		HashMap<String ,String> notice = new HashMap<String, String>();
		notice.put("memberNickname", memberNickname);
		notice.put("noticeTitle", noticeTitle);
		notice.put("noticeContent", ck4);
		return boardDao.adminNoticeInsert(notice);
	}


	public NoticeVO NoticeView(int noticeNo) {
		return boardDao.NoticeView(noticeNo);
	}


	public int viewCount(int noticeNo) {
		return boardDao.viewCount(noticeNo);
	}


	public AdminNoticePageVO mainNotice(int reqPage) {
		int numPerPage = 12;
		
		int totalCount = dao.adminNoticeCnt();
		System.out.println("공지사항 전체 갯수 : "+totalCount);
		
		System.out.println("한번에 표시할 게시물 갯수 : "+numPerPage);
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
		List<NoticeVO> list = dao.adminNoticeList(se);

		
		
		String pageNavi = "";
		
		int pageNaviSize = 5; 
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/mainNotice.do?reqPage="+(pageNo-pageNaviSize)+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn' style=' background-color:#76D5FF; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/meister/adminBoard/mainNotice.do?reqPage="+pageNo+"' style=' background-color:#B6EAFA; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</a>";			
				}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/mainNotice.do?reqPage="+pageNo+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>다음</a>";
		}

		
		AdminNoticePageVO anp = new AdminNoticePageVO(list, pageNavi);		
		
			
		return anp;

	}
	
	public int reportCnt() {
		return dao.reportCnt();
	}


	public ReportPageVO reportPage(int reqPage) {

		int numPerPage = 12;
		
		int totalCount = dao.reportCnt();
		System.out.println("신고 전체 갯수 : "+totalCount);
		
		System.out.println("한번에 표시할 신고 갯수 : "+numPerPage);
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
		List<AdminReportVO> list = dao.reportPage(se);

		
		
		String pageNavi = "";
		
		int pageNaviSize = 5; 
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/reportList.do?reqPage="+(pageNo-pageNaviSize)+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn' style=' background-color:#76D5FF; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/meister/adminBoard/reportList.do?reqPage="+pageNo+"' style=' background-color:#B6EAFA; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</a>";			
				}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/reportList.do?reqPage="+pageNo+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>다음</a>";
		}

		
		ReportPageVO report = new ReportPageVO(list, pageNavi);		
		
			
		return report;
	}
	
	
	public int reportDelCnt() {
		return dao.reportDelCnt();
	}
	
	public ReportPageVO reportDelPage(int reqPage) {

		int numPerPage = 12;
		
		int totalCount = dao.reportDelCnt();
		System.out.println("신고 전체 갯수 : "+totalCount);
		
		System.out.println("한번에 표시할 신고 갯수 : "+numPerPage);
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
		List<AdminReportVO> list = dao.reportDelPage(se);

		
		
		String pageNavi = "";
		
		int pageNaviSize = 5; 
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/reportDelList.do?reqPage="+(pageNo-pageNaviSize)+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>이전</a>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='btn' style=' background-color:#76D5FF; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/meister/adminBoard/reportDelList.do?reqPage="+pageNo+"' style=' background-color:#B6EAFA; border-radius: 5px; margin-left: 2px;'>"+pageNo+"</a>";			
				}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/meister/adminBoard/reportDelList.do?reqPage="+pageNo+"' style=' background-color:#F4F4F4; border-radius: 5px; margin-left: 2px;'>다음</a>";
		}

		
		ReportPageVO report = new ReportPageVO(list, pageNavi);		
		
			
		return report;
	}
	


	public int reportReviewSave(int reportNo, int sellNo, String reviewContent) {
		HashMap<String ,Object> rrs = new HashMap<String, Object>();
		rrs.put("reportNo", reportNo);
		rrs.put("sellNo", sellNo);
		rrs.put("reviewContent", reviewContent);
		
		return boardDao.reportReviewSave(rrs);
	}


	public int reviewDel(String reviewContent, int reviewNo) {
		HashMap<String ,Object> rd = new HashMap<String, Object>();
		rd.put("reviewContent", reviewContent);
		rd.put("reviewNo", reviewNo);
		return boardDao.reviewDel(rd);
	}


	public int reviewSaveDel(int reportSaveNo) {
		return boardDao.reviewSaveDel(reportSaveNo);
	}


	public List<ReportSaveVO> reportIf() {
		return (List<ReportSaveVO>)boardDao.reportIf();
	}


	public int reportBoardNoDelete(int reportBoardNo, int reportNo) {
		HashMap<String ,Object> rd = new HashMap<String, Object>();
		rd.put("reportBoardNo", reportBoardNo);
		rd.put("reportNo", reportNo);
		
		return boardDao.reportBoardNoDelete(rd);
	}
	



}
