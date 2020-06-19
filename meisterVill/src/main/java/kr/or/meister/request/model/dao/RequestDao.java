package kr.or.meister.request.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("requestDao")
public class RequestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
