package kr.or.meister.sell.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.coupon.model.vo.CouponJoinCouponIssuedVO;
import kr.or.meister.coupon.model.vo.CouponMemberVO;
import kr.or.meister.couponIssued.model.vo.CouponIssuedVO;
import kr.or.meister.etc.model.vo.MultiImgVO;
import kr.or.meister.etc.model.vo.PickVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.orders.model.vo.OrderOptionVO;
import kr.or.meister.orders.model.vo.OrdersVO;
import kr.or.meister.sell.model.dao.SellDao;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellMemberOptionVO;
import kr.or.meister.sell.model.vo.SellVO;

@Service("sellService")
public class SellService {

	@Autowired
	@Qualifier("sellDao")
	private SellDao dao;

	public HashMap<String, Object> selectAllList(int reqPage) {
		int numPerPage = 12;
		int totalCount = dao.totalCount();
		int totalPage = 0;
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List list = dao.selectAllList(map);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (reqPage != 1) {
			pageNavi += "<a class='btn' href='/meister/sell/sellList.do?reqPage=" + (reqPage - 1) + "'><</a>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/meister/sell/sellList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (reqPage < totalPage) {
			pageNavi += "<a class='btn' href='/meister/sell/sellList.do?reqPage=" + (reqPage+1) + "'>></a>";
		}

		HashMap<String, Object> sjm = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			SellJoinMemberVO sell = (SellJoinMemberVO)list.get(i);
			sjm.put("sell"+i, sell.getSellvo());
			sjm.put("member"+i, sell.getMembervo());
			sjm.put("number", list.size());
		}
		sjm.put("pageNavi", pageNavi);
		return sjm;
	}

	public int insertPick(int sellNo, int m) {
		HashMap<String, Integer> pick = new HashMap<String, Integer>();
		pick.put("no", sellNo);
		pick.put("m",m);
		int result = dao.insertPick(pick);	
		return result;
	}

	public int deletePick(int sellNo, int m) {
		System.out.println("서비스단 sellno" + sellNo + "m" + m);
		HashMap<String, Integer> pick = new HashMap<String, Integer>();
		pick.put("no", sellNo);
		pick.put("m",m);
		System.out.println("1"+pick.get("no"));
		System.out.println("2"+pick.get("m"));
		int result = dao.deletePick(pick);	
		return result;
	}

	public SellJoinMemberVO selectOneList(int sellNo) {
		SellJoinMemberVO sjm = dao.selectOneList(sellNo);
		return sjm;
	}

	public int insertSell(SellVO sell) {
		int result = dao.insertSell(sell);
		return result;
	}

	public int insertOpt(OptionsVO opt) {
		int result = dao.insertOpt(opt);
		return result;
	}

	public int insertMulImg(MultiImgVO mul) {
		int result = dao.insertMulImg(mul);
		return result;
	}

	public int updateSellList(SellVO sell) {
		int result = dao.updateSellList(sell);
		return result;
	}

	public ArrayList<PickVO> selectPickList(int memberNo) {
		List list = dao.selecctPicList(memberNo);
		return (ArrayList<PickVO>)list;
	}

<<<<<<< HEAD
	public SellVO selectSellInfo(int sellNo) {
		return dao.selectSellInfo(sellNo);
	}

	public MemberVO selectOneMember(int memberNo) {
		return dao.selectOneMember(memberNo);
	}

	public ArrayList<OptionsVO> selectOptionsInfo(int sellNo) {
		return (ArrayList<OptionsVO>)dao.selectOptionInfo(sellNo);
	}

	public ArrayList<CouponJoinCouponIssuedVO> getCouponCnt(CouponMemberVO cm) {
		return (ArrayList<CouponJoinCouponIssuedVO>)dao.getCouponCnt(cm);
	}

	public int purchaseSell(OrdersVO ov) {
		return dao.purchaseSell(ov);
	}

	public OrdersVO getOrders(int orderMemberNo) {
		return dao.getOrders(orderMemberNo);
	}

	public int couponUse(int[] couponNo) {
		return dao.couponUse(couponNo);
	}

	public int orderOption(OrderOptionVO oov) {
		return dao.orderOption(oov);
	}


	
=======
	public int deleteOpt(HashMap<String, Object> opt) {
		return dao.deleteOpt(opt);
	}

	public ArrayList<MultiImgVO> selectMultiImg(int sellNo) {
		List list = dao.selectMultiImg(sellNo);
		return (ArrayList<MultiImgVO>)list;
	}
>>>>>>> master
}
