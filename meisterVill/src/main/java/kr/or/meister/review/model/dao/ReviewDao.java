package kr.or.meister.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("reviewDao")
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List selectReview(int sellNo) {
		return sqlSession.selectList("review.selectReview",sellNo);
	}
}
