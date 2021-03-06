package kr.or.meister.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.board.model.dao.BoardDao;

@Service("boardService")
public class BoardService {
	
	@Autowired
	@Qualifier("boardDao")
	private BoardDao dao;
}
