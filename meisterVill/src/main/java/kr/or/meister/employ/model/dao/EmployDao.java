package kr.or.meister.employ.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.employ.model.vo.EmployJoinMemberVO;
import kr.or.meister.employ.model.vo.EmployVO;

@Repository("employDao")
public class EmployDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int totalCount() {
		return sqlSession.selectOne("employ.selectTotal");
	}

	public List selectAllList(HashMap<String, Object> map) {
		return sqlSession.selectList("employ.selectAllList", map);
	}

	public EmployJoinMemberVO selectOneList(int no) {
		return sqlSession.selectOne("employ.selectOneList", no);
	}

	public int insertEmploy(EmployVO employ) {
		System.out.println("컨텐트값" + employ.getEmployContent());
		return sqlSession.insert("employ.insertEmploy", employ);
	}

	public int totalKeyCount(String keyWord) {
		int result = sqlSession.selectOne("employ.selectKeyTotal", keyWord);
		System.out.println(result);
		return result;
	}
	
	public List selectKeyWordList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("employ.selectKeyWordList", map);
		return list;
	}

	
}
