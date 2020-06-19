package kr.or.meister.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.or.meister.review.model.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	@Qualifier("reviewService")
	private ReviewService service;
}
