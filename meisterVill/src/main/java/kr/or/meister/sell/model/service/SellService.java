package kr.or.meister.sell.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.sell.model.dao.SellDao;
import kr.or.meister.sell.model.vo.SellVO;

@Service("sellService")
public class SellService {

	@Autowired
	@Qualifier("sellDao")
	private SellDao dao;

	public ArrayList<SellVO> selectAllList() {
		List list = dao.selectAllList();
		return null;
	}
}
