package kr.or.meister.sell.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.sell.model.service.SellService;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellVO;

@Controller
@RequestMapping("/meister/sell")
public class SellController {
	
	@Autowired
	@Qualifier("sellService")
	private SellService service;
	
	@ResponseBody
	@RequestMapping(value="/getSellList.do", produces = "application/json;charset=utf-8")
	public String getList(MemberVO m, int reqPage) {
		HashMap<String, Object> list = service.selectAllList(reqPage);
		return new Gson().toJson(list);
	}
	@RequestMapping(value="/sellList.do")
	public String sellList(int reqPage, Model m) {
		m.addAttribute("reqPage", reqPage);
		return "sell/sellList";
	}
	@ResponseBody
	@RequestMapping(value="/pickList.do")
	public String insertPick(int no, MemberVO m) {
		int result = service.insertPick(no, m.getMemberNo());
		if (result == 0) {
			 return "0";
		} else 
		return "1";
	}
	@ResponseBody
	@RequestMapping(value="/deletePickList.do")
	public String deltePick(int no, MemberVO m) {
		int result = service.deletePick(no, m.getMemberNo());
		System.out.println(result);
		System.out.println("회원번호" + m.getMemberNo());
		if (result == 1) {
			 return "1";
		} 
		return "0";
	}
	
	@RequestMapping(value="/showList.do", produces = "application/json;charset=utf-8")
	public String showList(int sellNo, Model m, MemberVO member) {
		SellJoinOthersVO list = service.selectOneList(sellNo, member.getMemberNo());
		ArrayList<String> mul = new ArrayList<String>();
		ArrayList<String> skill = new ArrayList<String>();
		StringTokenizer st1 = new StringTokenizer(list.getMultiimgvo().getFilename(),"/");
		StringTokenizer st2 = new StringTokenizer(list.getSellvo().getSellSkill(),"/");
		while(st1.hasMoreTokens()) {
			mul.add(st1.nextToken());
		}
		while(st2.hasMoreTokens()) {
			skill.add(st2.nextToken());
		}
		m.addAttribute("multiImg", mul);
		m.addAttribute("skill", skill);
		m.addAttribute("sell", list);
		return "sell/showSell";
	}
	
	@ResponseBody
	@RequestMapping(value="/pickingSell.do")
	public String pickList(int memberNo, int sellNo) {
		int result = service.insertPick(sellNo, 2);
		if (result == 1) {
			return "1";
		} 
		return "0";
	}
	
	@ResponseBody
	@RequestMapping(value="/canclePickingSell.do")
	public String canclePickList(int memberNo, int sellNo) {
		System.out.println("잘되나");
		int result = service.deletePick(sellNo, 2);
		if (result == 1) {
			System.out.println("잘처리됐나");
			return "1";
		} 
		return "0";
	}
	
	@RequestMapping(value="/makeSell.do")
	public String makeSellFrm(SellVO sell, Model m) {
		int result = service.insertSell(sell);
		m.addAttribute("sellNo",result);
		return "sell/makeSell";
	}
	@ResponseBody
	@RequestMapping(value="/insertOpt.do")
	public String insertOpt(String[] optionTitle,String[] optionContent,Integer[] optionPrice,Integer[] optionPlusDate,int sellNo) {
		int result = 0;
		for(int i = 0; i < optionTitle.length; i++) {
			OptionsVO opt = new OptionsVO();
			System.out.println(sellNo);
			opt.setSellNo(sellNo);
			opt.setOptionTitle(optionTitle[i]);
			opt.setOptionContent(optionContent[i]);
			opt.setOptionPrice(optionPrice[i]);
			opt.setOptionPlusDate(optionPlusDate[i]);
			result = service.insertOpt(opt);
		}
		if (result == optionTitle.length) {
			return "1";
		}
		return "0";
	}
}
