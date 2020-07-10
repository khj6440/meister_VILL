package kr.or.meister.admin.model.service;

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



}
