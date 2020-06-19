package kr.or.meister.comments.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.comments.model.dao.CommentsDao;

@Service("commentsService")
public class CommentsService {

	@Autowired
	@Qualifier("commentsDao")
	private CommentsDao dao;
}
