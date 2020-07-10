package kr.or.meister.admin.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
