package kr.or.meister.comments.controller;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.meister.comments.model.service.CommentsService;

@Controller
public class CommentsController {

	@Autowired
	@Qualifier("commentsService")
	private CommentsService service;
}
