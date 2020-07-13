package kr.or.meister.admin.model.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.ReportSaveVO;
import kr.or.meister.notice.model.vo.NoticeVO;
import kr.or.meister.notice.model.vo.QnAVO;

@Repository("adminBoardDao")
public class AdminBoardDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int sellHalt(int sellNo) {
		return sqlSession.update("adminMember.sellHalt",sellNo);
	}


	public int boardRollback(int sellNo) {
		return sqlSession.update("adminMember.boardRollback",sellNo);
	}


	public int sellDelete(int sellNo) {
		return sqlSession.update("adminMember.sellDelete",sellNo);
	}
	
	public int reviewDelete(int reportNo) {
		return sqlSession.update("adminMember.reviewDelete",reportNo);
	}
	
	public int reviewOk(int reportNo) {
		return sqlSession.update("adminMember.reviewOk",reportNo);
	}
	
	public int reviewRealDelete(HashMap<String, Object> rrs) {
		return sqlSession.delete("adminMember.reviewRealDelete",rrs);
	}
	
	public int reviewBack(int reportNo) {
		return sqlSession.delete("adminMember.reviewBack",reportNo);
	}
	
	public int reDel(int reviewNo) {
		return sqlSession.delete("adminMember.reDel",reviewNo);
	}
	
	public int resDel(int reportSaveNo) {
		return sqlSession.delete("adminMember.resDel",reportSaveNo);
	}

	
/*-----------------------------------------------------------------------------------------------------------------------*/	
	

	public int requestApproval(int requestNo) {
		return sqlSession.update("adminMember.requestApproval",requestNo);
	}


	public int requestNoApproval(int requestNo) {
		return sqlSession.update("adminMember.requestNoApproval",requestNo);
	}
	
	public int requestEnd(int requestNo) {
		return sqlSession.update("adminMember.requestEnd",requestNo);
	}
	
	public int requestRollback(int requestNo) {
		return sqlSession.update("adminMember.requestRollback",requestNo);
	}


	public NoticeVO noticeOneView(int noticeNo) {
		return sqlSession.selectOne("adminMember.noticeOneView",noticeNo);
	}


	public int noticeDelete(int noticeNo) {
		return sqlSession.delete("adminMember.noticeDelete",noticeNo);
	}


	public int newQna(HashMap<String, String> qna) {
		return sqlSession.insert("adminMember.newQna",qna);
	}


	public int adminNoticeWrite(String memberNickname) {
		return sqlSession.insert("adminMember.newQna",memberNickname);
	}


	public int adminNoticeInsert(HashMap<String, String> notice) {
		return sqlSession.insert("adminMember.adminNoticeInsert",notice);
	}


	public NoticeVO NoticeView(int noticeNo) {
		return sqlSession.selectOne("adminMember.NoticeView",noticeNo);
	}


	public int viewCount(int noticeNo) {
		return sqlSession.update("adminMember.viewCount",noticeNo);
	}


	public int reportReviewSave(HashMap<String, Object> rrs) {
		return sqlSession.insert("adminMember.reportReviewSave",rrs);
	}
	
	public int reviewSaveBack(HashMap<String, Object> rrs) {
		return sqlSession.update("adminMember.reviewSaveBack",rrs);
	}

	public int reviewDel(HashMap<String, Object> rd) {
		return sqlSession.update("adminMember.reviewDel",rd);
	}


	public int reviewSaveDel(int reportSaveNo) {
		return sqlSession.delete("joinSellJoinOrders.reviewSaveDel",reportSaveNo);
	}


	public List<ReportSaveVO> reportIf() {
		return sqlSession.selectList("adminMember.reportIf");
	}


	public int reportBoardNoDelete(HashMap<String, Object> rd) {
		return sqlSession.delete("adminMember.reportBoardNoDelete", rd);
	}

}
