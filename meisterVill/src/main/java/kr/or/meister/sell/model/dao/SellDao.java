package kr.or.meister.sell.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.etc.model.vo.MultiImgVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellVO;

@Repository("sellDao")
public class SellDao {

	@Autowired
	private SqlSessionTemplate sqlSession;



	public List selectAllList() {
		return sqlSession.selectList("sell.selectAllList");
	}

	public List selectAllList(HashMap<String, Integer> map) {
		return sqlSession.selectList("sell.selectAllList", map);
	}
	public int totalCount() {
		return sqlSession.selectOne("sell.selectTotal");
	}
	public SellJoinMemberVO selectOneList(int sellNo) {
		return sqlSession.selectOne("sell.selectOne",sellNo);
	}
	public int insertPick(HashMap<String, Integer> pick) {
		return sqlSession.insert("pick.insertPick",pick);
	}
	public int deletePick(HashMap<String, Integer> pick) {
		return sqlSession.delete("pick.deletePick",pick);
	}
	public int insertSell(SellVO sell) {
		int result = sqlSession.insert("sell.insertSell",sell);
		return sell.getSellNo();
	}
	public int insertOpt(OptionsVO opt) {
		return sqlSession.insert("sell.insertOpt", opt);
	}

	public int insertMulImg(MultiImgVO mul) {
		return sqlSession.insert("sell.insertMulImg", mul);
	}

	public int updateSellList(SellVO sell) {
		return sqlSession.update("sell.updateSellList",sell);
	}

	public List selecctPicList(int memberNo) {
		return sqlSession.selectList("sell.selectPick", memberNo);
	}

	public int deleteOpt(HashMap<String, Object> opt) {
		return sqlSession.delete("sell.deleteOpt", opt);
	}

	public List selectMultiImg(int sellNo) {
		return sqlSession.selectList("sell.selectMultiImg", sellNo);
	}
}
