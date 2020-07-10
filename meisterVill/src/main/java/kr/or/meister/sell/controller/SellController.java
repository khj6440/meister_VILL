package kr.or.meister.sell.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;

import kr.or.meister.etc.model.vo.MultiImgVO;
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
	public String deletePick(int no, MemberVO m) {
		int result = service.deletePick(no, m.getMemberNo());
		System.out.println(result);
		System.out.println("?åÏõêÎ≤àÌò∏" + m.getMemberNo());
		if (result == 1) {
			 return "1";
		} 
		return "0";
	}
	
	@RequestMapping(value = "/showList.do", produces = "application/json;charset=utf-8")
	public String showList(int sellNo, Model m, int memberNo) {
		SellJoinOthersVO list = service.selectOneList(sellNo, memberNo);
		ArrayList<String> mul = new ArrayList<String>();
		ArrayList<String> skill = new ArrayList<String>();

		if (list != null) {
			StringTokenizer st1 = new StringTokenizer(list.getMultiimgvo().getFilename(), "/");
			while (st1.hasMoreTokens()) {
				mul.add(st1.nextToken());
				m.addAttribute("multiImg", mul);
			}
		}
		if (list != null) {
			StringTokenizer st2 = new StringTokenizer(list.getSellvo().getSellSkill(), "/");
			while (st2.hasMoreTokens()) {
				skill.add(st2.nextToken());
				m.addAttribute("skill", skill);
			}
		}
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
		System.out.println("?òÎêò??);
		int result = service.deletePick(sellNo, 2);
		if (result == 1) {
			System.out.println("?òÏ≤òÎ¶¨Îêê??);
			return "1";
		} 
		return "0";
	}
	
	@RequestMapping(value="/makeSell.do")
	public String makeSellFrm(SellVO sell, Model m) {
		int result = service.insertSell(sell);
		m.addAttribute("sellNo",result);
		return "sell/makeSellFrm";
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
	@RequestMapping(value="/insertSell.do")
	public String insertSell(HttpServletRequest request, MultipartHttpServletRequest mhsp, MultipartFile sellImgFile, SellVO sell) {
		MultiImgVO mul = new MultiImgVO();
		List<MultipartFile> multiList = mhsp.getFiles("files");
		if (!multiList.isEmpty()) {
			for(MultipartFile files : multiList) {
				String filename = setImg(files, request);
				mul.setMultiBoardNo(sell.getSellNo());
				mul.setMultiBoardType(1);
				mul.setFilename(filename);
				mul.setFilepath("null");
				int result = service.insertMulImg(mul);
				System.out.println("?±Î°ù?ÑÎ£å" + result);
			}
		}
		String filename = setImg(sellImgFile, request);
		if(sell.getSellOpt1() == null) {
			sell.setSellOpt1("0");
		} else if(sell.getSellOpt2() == null) {
			sell.setSellOpt2("0");
		} else if(sell.getSellOpt3() == null) {
			sell.setSellOpt3("0");
		}
		sell.setSellAppro(0);
		sell.setSellImg(filename);
		int result = service.updateSellList(sell);
		System.out.println("Í≤∞Í≥º" + result);
		return "sell/sellList?reqPage=1";
	}
	
	public String setImg(MultipartFile files, HttpServletRequest request) {
		String filename = "";
		try {
		String originalFilename = files.getOriginalFilename(); // upload???åÏùº???§Ï†ú ?åÏùºÎ™?
		String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf(".")); //?ïÏû•?êÎ? ?úÏô∏???åÏùºÎ™?
		String extension = originalFilename.substring(originalFilename.lastIndexOf(".")); // ?ïÏû•??
		filename = onlyFilename+"_"+getCurrentTime()+extension;
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/multiImg/"); //?Ä?•Ìï† Í≤ΩÎ°ú
		String fullpath = savePath+filename;
		byte[] bytes = files.getBytes();
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
		bos.write(bytes);
		bos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filename;
	}
	
	public long getCurrentTime() {
		Calendar today = Calendar.getInstance();
		return today.getTimeInMillis();
	}
}
