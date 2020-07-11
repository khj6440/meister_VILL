package kr.or.meister.request.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.request.model.vo.RequestMemberVO;

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
		RequestMemberVO r =sqlSession.selectOne("request.selectOneList", requestNo);
		System.out.println(r);
		return r;
	}
}
