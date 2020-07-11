package kr.or.meister.admin.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.meister.admin.model.service.AdminService;
import kr.or.meister.review.model.service.ReviewService;
import kr.or.meister.review.model.vo.ReviewJoinMemberVO;
import kr.or.meister.sell.model.service.SellService;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;

@Controller
@RequestMapping(value="/meister/adminSellView")
public class AdminSellViewController {

	@Autowired
	@Qualifier("adminService")
	private AdminService service;
	
	@Autowired
	@Qualifier("sellService")
	private SellService sellService;
	
	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;
	
	@ResponseBody
	@RequestMapping(value = "/selectReview.do",produces = "application/json;charset=utf-8")
	public String selectReview(int sellNo, Model m) {
		ArrayList<ReviewJoinMemberVO> list = reviewService.selectReview(sellNo);
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/pickingSell.do")
	public String pickList(int memberNo, int sellNo) {
		int result = sellService.insertPick(sellNo, 2);
		if (result == 1) {
			return "1";
		} 
		return "0";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/canclePickingSell.do")
	public String canclePickList(int memberNo, int sellNo) {
		System.out.println("잘되나");
		int result = sellService.deletePick(sellNo, 2);
		if (result == 1) {
			System.out.println("잘처리됐나");
			return "1";
		} 
		return "0";
	}
	
	
	
	@RequestMapping(value ="/showList.do"/* , produces = "application/json;charset=utf-8" */)
	public String showList(int sellNo, Model m,int memberNo) {
		System.out.println("셀번호 : "+sellNo+"유저 번호 : "+memberNo);
		SellJoinOthersVO list = sellService.selectOneList(sellNo);
		ArrayList<String> mul = new ArrayList<String>();
		ArrayList<String> skill = new ArrayList<String>();
		System.out.println(mul);
		System.out.println(skill);
		
		

		if(mul.size() > 0) {
			StringTokenizer st1 = new StringTokenizer(list.getMultiimgvo().getFilename(),"/");
			while(st1.hasMoreTokens()) {
				mul.add(st1.nextToken());
				m.addAttribute("multiImg", mul);
			}
		}

		if(skill.size() > 0) {
		StringTokenizer st2 = new StringTokenizer(list.getSellvo().getSellSkill(),"/");
		while(st2.hasMoreTokens()) {
			skill.add(st2.nextToken());
			m.addAttribute("skill", skill);
			}
		}
		
		m.addAttribute("sell", list);
		m.addAttribute("sellView", list.getSellvo());
		return "admin/sellOneView";
	}
}
