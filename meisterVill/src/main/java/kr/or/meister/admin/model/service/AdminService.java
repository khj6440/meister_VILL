package kr.or.meister.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.meister.admin.model.dao.AdminDao;
import kr.or.meister.member.model.vo.MemberVO;

@Service("adminService")
public class AdminService {

	@Autowired
	@Qualifier("adminDao")
	private AdminDao dao;

	public List<MemberVO> memberAllView() {
		return dao.selectAllMember();
	}
}
