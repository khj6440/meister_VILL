package kr.or.meister.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.review.model.service.ReviewService;

@Controller
@RequestMapping("/meister/review")
public class ReviewController {

	@Autowired
	@Qualifier("reviewService")
	private ReviewService service;
}
