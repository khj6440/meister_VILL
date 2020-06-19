package kr.or.meister.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.meister.board.model.service.BoardService;

@Controller
@RequestMapping("/meister/board")
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService service;
}
