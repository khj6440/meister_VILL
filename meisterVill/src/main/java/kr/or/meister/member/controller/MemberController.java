package kr.or.meister.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.or.meister.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService service;
}
