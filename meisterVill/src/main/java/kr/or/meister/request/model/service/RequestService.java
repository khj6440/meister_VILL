package kr.or.meister.request.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.employ.model.vo.EmployJoinMemberVO;
import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.request.model.dao.RequestDao;
import kr.or.meister.request.model.vo.RequestMemberVO;
import kr.or.meister.request.model.vo.RequestVO;

@Service("requestService")
public class RequestService {

	@Autowired
	@Qualifier("requestDao")
	private RequestDao dao;

	public HashMap<String, Object> selectAllList(int reqPage,String keyWord) {
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
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			List list = dao.selectAllList(map);
			String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
			
			if (reqPage != 1) {
				pageNavi += "<a class='btn' href='/meister/request/showList.do?reqPage=" + (reqPage - 1) + "'><</a>";
			}
			for (int i = 0; i < pageNaviSize; i++) {
				if (reqPage == pageNo) {
					pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
				} else {
					pageNavi += "<a class='btn' href='/meister/request/showList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
				}
				pageNo++;
				if (pageNo > totalPage) {
					break;
				}
			}
			if (reqPage < totalPage) {
				pageNavi += "<a class='btn' href='/meister/request/showList.do?reqPage=" + (reqPage+1) + "'>></a>";
			}
			HashMap<String, Object> request = new HashMap<String, Object>();
			for (int i = 0; i < list.size(); i++) {
				RequestMemberVO rmVO = (RequestMemberVO)list.get(i);
				request.put("request"+i, rmVO.getRequestvo());
				request.put("number", list.size());
			}
			request.put("pageNavi", pageNavi);
			return request;
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
				pageNavi += "<a class='btn' href='/meister/request/showList.do?reqPage=" + (reqPage - 1) + "'><</a>";
			}
			for (int i = 0; i < pageNaviSize; i++) {
				if (reqPage == pageNo) {
					pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
				} else {
					pageNavi += "<a class='btn' href='/meister/request/showList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
				}
				pageNo++;
				if (pageNo > totalPage) {
					break;
				}
			}
			if (reqPage < totalPage) {
				pageNavi += "<a class='btn' href='/meister/request/showList.do?reqPage=" + (reqPage+1) + "'>></a>";
			}
			HashMap<String, Object> request = new HashMap<String, Object>();
			for (int i = 0; i < list.size(); i++) {
				RequestMemberVO rmVO = (RequestMemberVO)list.get(i);
				request.put("request"+i, rmVO.getRequestvo());
				request.put("number", list.size());
			}
			request.put("pageNavi", pageNavi);
			return request;
		} 
	}

	public RequestMemberVO selectOneList(int requestNo) {
		RequestMemberVO rmv = dao.selectOneList(requestNo);
		return rmv;
	}

	public int insertRequeset(RequestVO request) {
		int result = dao.insetRequest(request);
		return result;
	}

	public MemberVO selectOne(String requestWriter) {
		MemberVO member2 = dao.selectOne(requestWriter);
		return member2;
	}

	public int insertChat(MemberVO member, MemberVO member2) {
		String memberNick = member.getMemberNickname();
		String memberImg = member.getMemberImg();
		String writerNick = member2.getMemberNickname();
		String writerImg = member2.getMemberImg();
		
		HashMap<String, String> chat = new HashMap<String, String>();
		chat.put("memberNick", memberNick);
		chat.put("memberImg", memberImg);
		chat.put("writerNick", writerNick);
		chat.put("writerImg", writerImg);
		int result = dao.insertChat(chat);
		int result2 = dao.insertChat2(chat);
		System.out.println(result +","+ result2);
		return result;
	}

	
	
}
