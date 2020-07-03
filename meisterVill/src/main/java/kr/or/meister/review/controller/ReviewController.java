package kr.or.meister.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import kr.or.meister.review.model.service.ReviewService;
import kr.or.meister.review.model.vo.ReviewJoinMemberVO;
import kr.or.meister.review.model.vo.ReviewVO;

@Controller
@RequestMapping("/meister/review")
public class ReviewController {

	@Autowired
	@Qualifier("reviewService")
	private ReviewService service;

	@ResponseBody
	@RequestMapping(value = "/selectReview.do",produces = "application/json;charset=utf-8")
	public String selectReview(int sellNo, Model m) {
		ArrayList<ReviewJoinMemberVO> list = service.selectReview(sellNo);
		return new Gson().toJson(list);
	}
}
