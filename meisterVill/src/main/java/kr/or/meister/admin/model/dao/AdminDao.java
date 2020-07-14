package kr.or.meister.admin.model.dao;


import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.or.meister.admin.model.vo.AdminMemberJoinSellJoinOrdersVO;
import kr.or.meister.admin.model.vo.AdminNoticePageVO;
import kr.or.meister.admin.model.vo.AdminReportVO;
import kr.or.meister.admin.model.vo.MemberInformVO;
import kr.or.meister.admin.model.vo.MemberJoinEmployVO;
import kr.or.meister.admin.model.vo.MemberJoinReportVO;
import kr.or.meister.admin.model.vo.MemberJoinVO;
import kr.or.meister.admin.model.vo.RequestListVO;
import kr.or.meister.admin.model.vo.RequestSellVO;
import kr.or.meister.admin.model.vo.SellSellVO;
import kr.or.meister.admin.model.vo.SellJoinOrdersJoinOptionVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.notice.model.vo.NoticeVO;
import kr.or.meister.notice.model.vo.QnAVO;
import kr.or.meister.sell.model.vo.SellVO;





@Repository("adminDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MemberJoinReportVO> selectAllMember() {
		return sqlSession.selectList("memberJoinReport.selectAllMember");
	}
	
	public List<MemberJoinReportVO> selectAllHaltMember() {
		return sqlSession.selectList("memberJoinReport.selectAllHaltMember");
	}
	
	public List<MemberJoinReportVO> selectAllDeletionMember() {
		return sqlSession.selectList("memberJoinReport.selectAllDeletionMember");
	}

	public MemberJoinVO memberOneView(int memberNo) {
		return sqlSession.selectOne("memberJoin.memberOneView",memberNo);
	}
	
	public List<MemberInformVO> memberCareer(int memberNo) {
		return sqlSession.selectList("joinSellJoinOrders.memberCareer",memberNo);
	}
	
	public List<MemberInformVO> memberLicense(int memberNo) {
		return sqlSession.selectList("joinSellJoinOrders.memberLicense",memberNo);
	}
	
	public List<AdminMemberJoinSellJoinOrdersVO> memberPick(int memberNo) {
		return sqlSession.selectList("joinSellJoinOrders.memberPick",memberNo);
	}

	public int totalCount() {
		return sqlSession.selectOne("adminMember.totalCount");
	}
	
	public int totalHaltCount() {
		return sqlSession.selectOne("adminMember.totalHaltCount");
	}
	
	public int totalDeletionCount() {
		return sqlSession.selectOne("adminMember.totalDeletionCount");
	}

	public List<MemberVO> selectList(HashMap<String, Integer> se) {
		return sqlSession.selectList("adminMember.selectList",se);
	}
	
	public List<MemberVO> memberHaltPage(HashMap<String, Integer> se) {
		return sqlSession.selectList("adminMember.selectHaltList",se);
	}
	
	public List<MemberVO> memberDeletionPage(HashMap<String, Integer> se) {
		return sqlSession.selectList("adminMember.selectDeletionList",se);
	}

	public MemberVO memberLogin(HashMap<String, String> login) {
		return sqlSession.selectOne("adminMember.memberLogin",login);
	}

	public List<AdminMemberJoinSellJoinOrdersVO> memberSell(int memberNo) {
		return sqlSession.selectList("joinSellJoinOrders.memberSell",memberNo);
	}

	public List<SellJoinOrdersJoinOptionVO> memberOrder(int memberNo) {
		return sqlSession.selectList("sellJoinOrdersJoinOption.memberOrder",memberNo);
	}
	
	public List<AdminMemberJoinSellJoinOrdersVO> sellList(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.sellList",se);
	}
	
	public List<AdminMemberJoinSellJoinOrdersVO> sellAllViewSellList(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.sellAllViewSellList",se);
	}
	
	public List<AdminMemberJoinSellJoinOrdersVO> sellAllViewPickList(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.sellAllViewPickList",se);
	}
	
	public List<AdminMemberJoinSellJoinOrdersVO> sellApproval(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.sellApproval",se);
	}
	
	public List<RequestListVO> requestListFrm(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.requestListFrm",se);
	}

	public List<RequestListVO> requestApprovalFrm(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.requestApprovalFrm",se);
	}

/*-----------------------------------member 통계------------------------------------------ */
	public int cnt() {
		return sqlSession.selectOne("adminMember.cnt");
	}
	
	public int level0Cnt() {
		return sqlSession.selectOne("adminMember.level0Cnt");
	}
	
	public int level1Cnt() {
		return sqlSession.selectOne("adminMember.level1Cnt");
	}
	
	public int level2Cnt() {
		return sqlSession.selectOne("adminMember.level2Cnt");
	}
/*--------------------------------------------------------------------------------------------*/
	
	
	
/*-----------------------------------sell 통계------------------------------------------ */	
	
	public int sCnt() {
		return sqlSession.selectOne("adminMember.sCnt");
	}
	
	public int rCnt() {
		return sqlSession.selectOne("adminMember.rCnt");
	}
	
	public int eCnt() {
		return sqlSession.selectOne("adminMember.eCnt");
	}
	
	public int sellCnt() {
		return sqlSession.selectOne("adminMember.sellCnt");
	}
	
	public int memberOneViewSellCnt(int memberNo) {
		return sqlSession.selectOne("adminMember.memberOneViewSellCnt", memberNo);
	}
	
	public int memberOneViewPickCnt(int memberNo) {
		return sqlSession.selectOne("adminMember.memberOneViewPickCnt", memberNo);
	}
	
	public int sellListCnt() {
		return sqlSession.selectOne("adminMember.sellListCnt");
	}
	
	public int sellApprovalCnt() {
		return sqlSession.selectOne("adminMember.sellApprovalCnt");
	}
	
	public int requestCnt() {
		return sqlSession.selectOne("adminMember.requestCnt");
	}
	
	public int requestApprovalCnt() {
		return sqlSession.selectOne("adminMember.requestApprovalCnt");
	}
	
	public int employCnt() {
		return sqlSession.selectOne("adminMember.employCnt");
	}
	
	/*--------------------------------------------------------------------------------------------*/	
	
	public List<SellSellVO> sellSell() {
		return sqlSession.selectList("adminMember.sellSell");
	}
	
	public List<SellSellVO> oneMemberSellSell() {
		return sqlSession.selectList("adminMember.oneMemberSellSell");
	}
	
	
	public List<RequestSellVO> RequestSell() {
		return sqlSession.selectList("adminMember.requestSell");
	}
	
	public List<RequestSellVO> oneMemberRequestSell() {
		return sqlSession.selectList("adminMember.oneMemberRequestSell");
	}

	public int memberHalt(int memberNo) {
		return sqlSession.update("adminMember.memberHalt",memberNo);
	}

	public int memberRollback(int memberNo) {
		return sqlSession.update("adminMember.memberRollback",memberNo);
	}


	public int memberDelete(int memberNo) {
		return sqlSession.update("adminMember.memberDelete",memberNo);
	}
	
	public int approval(int sellNo) {
		return sqlSession.update("adminMember.approval",sellNo);
	}

	public int adminNoticeCnt() {
		return sqlSession.selectOne("adminMember.adminNoticeCnt");
	}

	public List<NoticeVO> adminNoticeList(HashMap<String, Integer> se) {

		return sqlSession.selectList("joinSellJoinOrders.adminNoticeList",se);
	}

	public int adminQnaCnt() {
		return sqlSession.selectOne("adminMember.adminQnaCnt");
	}

	public List<QnAVO> adminQnaList(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.adminQnaList",se);
	}

	public List<AdminMemberJoinSellJoinOrdersVO> adminMainSellList() {
		return sqlSession.selectList("adminMember.adminMainSellList");
	}

	public List<MemberJoinEmployVO> adminMainEmployList() {
		return sqlSession.selectList("adminMember.adminMainEmployList");
	}

	public int reportCnt() {
		return sqlSession.selectOne("adminMember.reportCnt");
	}
	
	public List<AdminReportVO> reportPage(HashMap<String, Integer> se) {
		return sqlSession.selectList("joinSellJoinOrders.reportPage",se);
	}
	




}
