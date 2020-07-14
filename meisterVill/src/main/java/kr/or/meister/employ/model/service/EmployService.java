package kr.or.meister.employ.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.employ.model.dao.EmployDao;
import kr.or.meister.employ.model.vo.EmployJoinMemberVO;
import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;

@Service("employService")
public class EmployService {

	@Autowired
	@Qualifier("employDao")
	private EmployDao dao;

	public HashMap<String, Object> selectAllList(int reqPage, String keyWord) {
		int numPerPage = 10;
		if(keyWord.equals("no")) {
			int totalCount = dao.totalCount();
			int totalPage = 0;
			
			if (totalCount % numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			} else {
				totalPage = totalCount / numPerPage + 1;
			}
			int start = (reqPage - 1) * numPerPage + 1;
			int end = reqPage * numPerPage;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			List list = dao.selectAllList(map);
			String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
			
			if (reqPage != 1) {
				pageNavi += "<a class='btn' href='/meister/employ/showList.do?reqPage=" + (reqPage - 1) + "'><</a>";
			}
			for (int i = 0; i < pageNaviSize; i++) {
				if (reqPage == pageNo) {
					pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
				} else {
					pageNavi += "<a class='btn' href='/meister/employ/showList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
				}
				pageNo++;
				if (pageNo > totalPage) {
					break;
				}
			}
			if (reqPage < totalPage) {
				pageNavi += "<a class='btn' href='/meister/employ/showList.do?reqPage=" + (reqPage+1) + "'>></a>";
			}
			HashMap<String, Object> employ = new HashMap<String, Object>();
			for (int i = 0; i < list.size(); i++) {
				EmployVO employVO = (EmployVO)list.get(i);
				employ.put("employ"+i, employVO);
				employ.put("number", list.size());
			}
			employ.put("pageNavi", pageNavi);
			return employ;
		} else {
			int totalCount = dao.totalKeyCount(keyWord);
			int totalPage = 0;
			
			if (totalCount % numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			} else {
				totalPage = totalCount / numPerPage + 1;
			}
			int start = (reqPage - 1) * numPerPage + 1;
			int end = reqPage * numPerPage;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("keyWord", keyWord);
			List list = dao.selectKeyWordList(map);
			String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
			
			if (reqPage != 1) {
				pageNavi += "<a class='btn' href='/meister/employ/showList.do?reqPage=" + (reqPage - 1) + "'><</a>";
			}
			for (int i = 0; i < pageNaviSize; i++) {
				if (reqPage == pageNo) {
					pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
				} else {
					pageNavi += "<a class='btn' href='/meister/employ/showList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
				}
				pageNo++;
				if (pageNo > totalPage) {
					break;
				}
			}
			if (reqPage < totalPage) {
				pageNavi += "<a class='btn' href='/meister/employ/showList.do?reqPage=" + (reqPage+1) + "'>></a>";
			}
			HashMap<String, Object> employ = new HashMap<String, Object>();
			for (int i = 0; i < list.size(); i++) {
				EmployVO employVO = (EmployVO)list.get(i);
				employ.put("employ"+i, employVO);
				employ.put("number", list.size());
			}
			employ.put("pageNavi", pageNavi);
			return employ;
		}
	}

	public EmployJoinMemberVO selectOneList(int no) {
		EmployJoinMemberVO ejmVO = dao.selectOneList(no);
		return ejmVO;
	}

	public int insertEmploy(EmployVO employ) {
		int result = dao.insertEmploy(employ);
		return result;
	}
}
