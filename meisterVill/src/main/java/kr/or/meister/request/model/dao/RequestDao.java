package kr.or.meister.request.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
