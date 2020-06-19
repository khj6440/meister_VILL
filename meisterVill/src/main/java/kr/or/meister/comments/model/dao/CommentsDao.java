package kr.or.meister.comments.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentsDao")
public class CommentsDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
