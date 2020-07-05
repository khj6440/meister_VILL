package kr.or.meister.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.review.model.dao.ReviewDao;
import kr.or.meister.review.model.vo.ReviewJoinMemberVO;
import kr.or.meister.review.model.vo.ReviewVO;

@Service("reviewService")
public class ReviewService {

	@Autowired
	@Qualifier("reviewDao")
	private ReviewDao dao;

	public ArrayList<ReviewJoinMemberVO> selectReview(int sellNo) {
		List list = dao.selectReview(sellNo);
		return (ArrayList<ReviewJoinMemberVO>)list;
	}
}
