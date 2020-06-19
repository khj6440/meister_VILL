package kr.or.meister.employ.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("employDao")
public class EmployDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
