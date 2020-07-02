package kr.or.meister.sell.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.meister.member.model.vo.MemberVO;

@Repository("sellDao")
public class SellDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List selectAllList() {
		return sqlSession.selectList("sell.selectAllList");
	}

	public int insertPick(HashMap<String, Integer> pick) {
		return sqlSession.insert("pick.insertPick",pick);
	}

	public int deletePick(HashMap<String, Integer> pick) {
		return sqlSession.delete("pick.deletePick",pick);
	}
}
