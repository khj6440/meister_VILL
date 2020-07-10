package kr.or.meister.sell.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
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

import com.google.gson.Gson;

import kr.or.meister.etc.model.vo.MultiImgVO;
import kr.or.meister.etc.model.vo.PickVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.sell.model.service.SellService;
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
	@ResponseBody
	@RequestMapping(value="/getPick.do", produces = "application/json;charset=utf-8")
	public String getPlick(int memberNo) {
		ArrayList<PickVO> list = service.selectPickList(memberNo);
		ArrayList<Integer> sellNo = new ArrayList<Integer>(); 
		for(int i = 0; i < list.size(); i++) {
			sellNo.add(list.get(i).getSellNo());
		}
		return new Gson().toJson(sellNo);
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
		if (result == 1) {
			 return "1";
		} 
		return "0";
	}
	
	@RequestMapping(value = "/showList.do", produces = "application/json;charset=utf-8")
	public String showList(int sellNo, Model m) {
	SellJoinOthersVO list = service.selectOneList(sellNo);
			ArrayList<String> mul = new ArrayList<String>();
		ArrayList<String> skill = new ArrayList<String>();

		if (list.getMultiimgvo() != null) {
			StringTokenizer st1 = new StringTokenizer(list.getMultiimgvo().getFilename(), "/");
			while (st1.hasMoreTokens()) {
				mul.add(st1.nextToken());
				m.addAttribute("multiImg", mul);
			}
		}
		if (list.getSellvo().getSellSkill() != null) {
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
		int result = service.insertPick(sellNo, memberNo);
		if (result == 1) {
			return "1";
		} 
		return "0";
	}
	
	@ResponseBody
	@RequestMapping(value="/canclePickingSell.do")
	public String canclePickList(int memberNo, int sellNo) {
		int result = service.deletePick(sellNo, memberNo);
		if (result == 1) {
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
			}
		}
		System.out.println(sell.getSellOpt1());
		String filename = setImg(sellImgFile, request);
		if(sell.getSellOpt1() == null) {
			sell.setSellOpt1("0");
		} else {
			sell.setSellOpt1("상업적 이용");
		}
		if(sell.getSellOpt2() == null) {
			sell.setSellOpt2("0");
		} else {
			sell.setSellOpt1("소스코드 제공");
		}
		if(sell.getSellOpt3() == null) {
			sell.setSellOpt3("0");
		} else {
			sell.setSellOpt1("맞춤 디자인 제공");
		}
		int reqPage = 1;
		sell.setSellAppro(0);
		sell.setSellImg(filename);
		int result = service.updateSellList(sell);
		System.out.println("결과" + result);
		return "redirect:/meister/sell/sellList.do?reqPage="+reqPage;
	}
	
	public String setImg(MultipartFile files, HttpServletRequest request) {
		String filename = "";
		try {
		String originalFilename = files.getOriginalFilename(); // upload???�일???�제 ?�일�?
		String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf(".")); //?�장?��? ?�외???�일�?
		String extension = originalFilename.substring(originalFilename.lastIndexOf(".")); // ?�장??
		filename = onlyFilename+"_"+getCurrentTime()+extension;
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/multiImg/"); //?�?�할 경로
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
