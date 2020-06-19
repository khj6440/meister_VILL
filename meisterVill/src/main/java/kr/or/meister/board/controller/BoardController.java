package kr.or.meister.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.or.meister.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService service;
}
