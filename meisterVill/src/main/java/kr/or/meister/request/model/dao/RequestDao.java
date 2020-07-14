package kr.or.meister.request.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.request.model.vo.RequestMemberVO;
import kr.or.meister.request.model.vo.RequestVO;

@Repository("requestDao")
public class RequestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List selectAllList(HashMap<String, Integer> map) {
		List list = sqlSession.selectList("request.selectAllList", map);
		return list;
	}

	public int totalCount() {
		return sqlSession.selectOne("request.selectTotal");
	}

	public RequestMemberVO selectOneList(int requestNo) {
		RequestMemberVO rmVO =sqlSession.selectOne("request.selectOneList", requestNo);
		System.out.println(rmVO);
		return rmVO;
	}

	public int insetRequest(RequestVO request) {
		return sqlSession.insert("request.insertList", request);
	}

	public MemberVO selectOne(String requestWriter) {
		return sqlSession.selectOne("request.selectOne",requestWriter);
	}

	public int insertChat(HashMap<String, String> chat) {
		return sqlSession.insert("request.insertChat", chat);
	}

	public int insertChat2(HashMap<String, String> chat) {
		return sqlSession.insert("request.insertChat2", chat);
	}

	public int totalKeyCount(String keyWord) {
		int result = sqlSession.selectOne("request.selectKeyTotal", keyWord);
		return result;
	}

	public List selectKeyWordList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("request.selectKeyWordList", map);
		return list;
	}
}
