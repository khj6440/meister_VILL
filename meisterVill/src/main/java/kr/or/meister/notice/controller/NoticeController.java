package kr.or.meister.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.or.meister.notice.model.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	@Qualifier("noticeService")
	private NoticeService service;
}
