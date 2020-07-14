package kr.or.meister.sell.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.coupon.model.vo.CouponJoinCouponIssuedVO;
import kr.or.meister.coupon.model.vo.CouponMemberVO;
import kr.or.meister.couponIssued.model.vo.CouponIssuedVO;
import kr.or.meister.etc.model.vo.MultiImgVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.orders.model.vo.OrderOptionVO;
import kr.or.meister.orders.model.vo.OrdersVO;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellMemberOptionVO;
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


	public SellVO selectSellInfo(int sellNo) {
		return sqlSession.selectOne("count.selectSellInfo",sellNo);
	}

	public MemberVO selectOneMember(int memberNo) {
		return sqlSession.selectOne("count.selectOneMember",memberNo);
	}

	public List selectOptionInfo(int sellNo) {
		return sqlSession.selectList("count.selectOptionsInfo",sellNo);
	}

	public List getCouponCnt(CouponMemberVO cm) {
		return sqlSession.selectList("member.couponList",cm);
	}

	public int purchaseSell(OrdersVO ov) {
		return sqlSession.insert("count.purchaseSell",ov);
	}

	public OrdersVO getOrders(int orderMemberNo) {
		return sqlSession.selectOne("count.getOrders",orderMemberNo);
	}

	public int couponUse(int[] couponNo) {
		return sqlSession.update("count.couponUse",couponNo);
	}

	public int orderOption(OrderOptionVO oov) {
		return sqlSession.insert("count.orderOption",oov);
	}



	

	public int deleteOpt(HashMap<String, Object> opt) {
		return sqlSession.delete("sell.deleteOpt", opt);
	}

	public List selectMultiImg(int sellNo) {
		return sqlSession.selectList("sell.selectMultiImg", sellNo);
	}

	public int totalKeyCount(String keyWord) {
		int result = sqlSession.selectOne("sell.selectKeyTotal", keyWord);
		return result;
	}
	public List selectKeyWordList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("sell.selectKeyWordList", map);
		return list;
	}

}
