package kr.or.meister.sell.model.service;


import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import kr.or.meister.sell.model.dao.SellDao;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;


@Service("sellService")
public class SellService {

	@Autowired
	@Qualifier("sellDao")
	private SellDao dao;


	public HashMap<String, Object> selectAllList() {
		List list = dao.selectAllList();
		HashMap<String, Object> sjm = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			SellJoinMemberVO sell = (SellJoinMemberVO)list.get(i);
			sjm.put("sell"+i, sell.getSellvo());
			sjm.put("member"+i, sell.getMembervo());
			sjm.put("number", list.size());
		}
		return sjm;
	}

	public int insertPick(int no, int m) {
		HashMap<String, Integer> pick = new HashMap<String, Integer>();
		pick.put("no", no);
		pick.put("m",m);
		int result = dao.insertPick(pick);	
		return 0;
	}

	public int deletePick(int no, int m) {
		HashMap<String, Integer> pick = new HashMap<String, Integer>();
		pick.put("no", no);
		pick.put("m",m);
		int result = dao.deletePick(pick);	
		return 0;
	}

}
