package kr.or.meister.sell.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.sell.model.dao.SellDao;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
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

	public int insertPick(int no, int m) {
		HashMap<String, Integer> pick = new HashMap<String, Integer>();
		pick.put("no", no);
		pick.put("m",m);
		int result = dao.insertPick(pick);	
		return result;
	}

	public int deletePick(int no, int m) {
		HashMap<String, Integer> pick = new HashMap<String, Integer>();
		pick.put("no", no);
		pick.put("m",m);
		int result = dao.deletePick(pick);	
		return result;
	}

	public SellJoinOthersVO selectOneList(int sellNo, int memberNo) {
		HashMap<String, Integer> number = new HashMap<String, Integer>();
		number.put("sellNo", sellNo);
		number.put("memberNo", memberNo);
		SellJoinOthersVO sjo = dao.selectOneList(number);
		return sjo;
	}

	public int insertSell(SellVO sell) {
		int result = dao.insertSell(sell);
		return result;
	}

	public int insertOpt(OptionsVO opt) {
		int result = dao.insertOpt(opt);
		return result;
	}
}
