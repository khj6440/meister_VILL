package kr.or.meister.employ.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.employ.model.dao.EmployDao;

@Service("employService")
public class EmployService {

	@Autowired
	@Qualifier("employDao")
	private EmployDao dao;
}
