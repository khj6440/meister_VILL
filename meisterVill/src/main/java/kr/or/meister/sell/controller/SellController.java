package kr.or.meister.sell.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.sell.model.service.SellService;
import kr.or.meister.sell.model.vo.SellVO;

@Controller
@RequestMapping("/meister/sell")
public class SellController {
	
	@Autowired
	@Qualifier("sellService")
	private SellService service;
	
	@ResponseBody
	@RequestMapping(value="/getSellList.do", produces = "application/json;charset=utf-8")
	public String getList() {
		ArrayList<SellVO> list = service.selectAllList();
		return new Gson().toJson(list);
	}
}
