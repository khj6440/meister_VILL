package kr.or.meisert.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meisert.admin.model.dao.AdminDao;

@Service("adminService")
public class AdminService {

	@Autowired
	@Qualifier("adminDao")
	private AdminDao dao;
}
