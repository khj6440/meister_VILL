package kr.or.meister.sell.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.sell.model.dao.SellDao;

@Service("sellService")
public class SellService {

	@Autowired
	@Qualifier("sellDao")
	private SellDao dao;
}
