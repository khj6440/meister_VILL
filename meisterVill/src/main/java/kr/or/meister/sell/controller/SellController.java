package kr.or.meister.sell.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.sell.model.service.SellService;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;


@Controller
public class SellController {
	
	@Autowired
	@Qualifier("sellService")
	private SellService service;

	
	@ResponseBody
	@RequestMapping(value="/getSellList.do", produces = "application/json;charset=utf-8")
	public String getList(MemberVO m) {
		HashMap<String, Object> list = service.selectAllList();
		System.out.println(list.get("number"));
		return new Gson().toJson(list);
	}
	@RequestMapping(value="/sellList.do")
	public String sellList() {
		return "sell/sellList";
	}
	@ResponseBody
	@RequestMapping(value="/pickList.do")
	public String insertPick(int no, MemberVO m) {
		int result = service.insertPick(no, 2);
		if (result == 0) {
			 return "0";
		} else 
		return "1";
	}
	@ResponseBody
	@RequestMapping(value="/deletePickList.do")
	public String deltePick(int no, MemberVO m) {
		int result = service.deletePick(no, 2);
		if (result == 0) {
			 return "0";
		} else 
		return "1";
	}

}
