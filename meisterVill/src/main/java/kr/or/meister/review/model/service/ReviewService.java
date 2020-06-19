package kr.or.meister.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.review.model.dao.ReviewDao;

@Service("reviewService")
public class ReviewService {

	@Autowired
	@Qualifier("reviewDao")
	private ReviewDao dao;
}
