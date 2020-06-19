package kr.or.meister.request.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.request.model.dao.RequestDao;

@Service("requestService")
public class RequestService {

	@Autowired
	@Qualifier("requestDao")
	private RequestDao dao;
	
}
