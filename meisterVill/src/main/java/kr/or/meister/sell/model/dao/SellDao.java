package kr.or.meister.sell.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sellDao")
public class SellDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List selectAllList() {
		return null;
	}
}
