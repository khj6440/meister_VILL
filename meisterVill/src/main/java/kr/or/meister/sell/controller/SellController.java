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

import kr.or.meister.coupon.model.vo.CouponApplyVO;
import kr.or.meister.coupon.model.vo.CouponJoinCouponIssuedVO;
import kr.or.meister.coupon.model.vo.CouponMemberVO;
import kr.or.meister.couponIssued.model.vo.CouponIssuedVO;
import kr.or.meister.etc.model.vo.MultiImgVO;
import kr.or.meister.etc.model.vo.PickVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.options.model.vo.OptionsVO;
import kr.or.meister.orders.model.vo.OrderOptionVO;
import kr.or.meister.orders.model.vo.OrdersVO;
import kr.or.meister.sell.model.service.SellService;
import kr.or.meister.sell.model.vo.SellJoinMemberVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;
import kr.or.meister.sell.model.vo.SellMemberOptionVO;
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
	
	@RequestMapping(value = "/showList.do")
	public String showList(int sellNo, Model m) {
		SellJoinMemberVO list = service.selectOneList(sellNo);
		ArrayList<String> skill = new ArrayList<String>();
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
	@RequestMapping(value="/getMultiImg.do", produces = "application/json;charset=utf-8")
	public String getMultiImg(int sellNo, Model m) {
		ArrayList<MultiImgVO> mul = service.selectMultiImg(sellNo);
		if (mul != null) {
			m.addAttribute("size", mul.size());
			return new Gson().toJson(mul);
		}
		return "0";
	}

	@ResponseBody
	@RequestMapping(value="/pickingSell.do")
	public String pickList(int memberNo, int sellNo) {
		System.out.println("memberno" + memberNo + "sellno" + sellNo);
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
			System.out.println("결과" + result);
		}
		if (result == 1) {
			return "1";
		}
		return "0";
	}
	@ResponseBody
	@RequestMapping(value="/deleteOpt.do")
	public String deleteOpt(String[] optionTitle, int sellNo) {
		int result = 0;
		for(int i = 0; i < optionTitle.length; i++) {
			HashMap<String, Object> opt = new HashMap<String, Object>();
			opt.put("sellNo", sellNo);
			opt.put("optionTitle", optionTitle);
			result = service.deleteOpt(opt);
			System.out.println("결과" + result);
		}
		if (result == 1) {
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
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/multiImg/");
				String filename = setImg(savePath, files, request);
				mul.setMultiBoardNo(sell.getSellNo());
				mul.setMultiBoardType(1);
				mul.setFilename(filename);
				mul.setFilepath("null");
				int result = service.insertMulImg(mul);
			}
		}
		System.out.println(sell.getSellOpt1());
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/sellImg/");
		String filename = setImg(savePath, sellImgFile, request);
		if(sell.getSellOpt1() == null) {
			sell.setSellOpt1("null");
		} else {
			sell.setSellOpt1("상업적 이용");
		}
		if(sell.getSellOpt2() == null) {
			sell.setSellOpt2("null");
		} else {
			sell.setSellOpt1("소스코드 제공");
		}
		if(sell.getSellOpt3() == null) {
			sell.setSellOpt3("null");
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
	
	public String setImg(String savePath, MultipartFile files, HttpServletRequest request) {
		String filename = "";
		try {
		String originalFilename = files.getOriginalFilename(); //
		String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf("."));
		String extension = originalFilename.substring(originalFilename.lastIndexOf(".")); 
		filename = onlyFilename+"_"+getCurrentTime()+extension;
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
	
	@RequestMapping("/order.do") 
	 public String order(int sellNo, int memberNo,Model model) { 
		 //유라: 구매하기 버튼 누름 
		 SellVO sellvo = service.selectSellInfo(sellNo);
		 MemberVO membervo = service.selectOneMember(memberNo);
		 MemberVO sellervo = service.selectOneMember(sellvo.getSellWriter());
		 ArrayList<OptionsVO> optionsvoArr = service.selectOptionsInfo(sellNo);
		 System.out.println("구매타이틀"+sellvo.getSellTitle());
		 System.out.println("구매가격"+sellvo.getSellPrice());
		 System.out.println("구매자닉네임"+membervo.getMemberNickname());
		 System.out.println("구매옵션1제목"+optionsvoArr.get(0).getOptionTitle());
		 SellMemberOptionVO smo = new SellMemberOptionVO();
		 smo.setMembervo(membervo);
		 smo.setSellvo(sellvo);
		 smo.setOptionsvoArr(optionsvoArr);
		 CouponMemberVO cm = new CouponMemberVO();
		 cm.setMemberNo(memberNo);
		 cm.setSellPrice(sellvo.getSellPrice());
		 ArrayList<CouponJoinCouponIssuedVO> arrCjci = service.getCouponCnt(cm);
		 model.addAttribute("sell",smo.getSellvo());
		 model.addAttribute("member",smo.getMembervo());
		 model.addAttribute("seller",sellervo);
		 model.addAttribute("options",smo.getOptionsvoArr()); 
		 model.addAttribute("coupons",arrCjci);
		 model.addAttribute("couponCnt",arrCjci.size());
		 return "order/order"; 
		 }
	
	
	@ResponseBody
	@RequestMapping(value = "/couponModalOpen.do", produces = "application/json;charset=UTF-8")
	public String couponModalOpen(ArrayList<CouponJoinCouponIssuedVO> arrCoupons) {
		//유라: 결제창에서 쿠폰모달 오픈
		System.out.println(arrCoupons);
		return new Gson().toJson(arrCoupons);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/couponApply.do", produces = "application/json;charset=UTF-8")
	public String couponApply(CouponApplyVO cav) {
		// 유라: 쿠폰 적용 버튼 누름
		System.out.println(cav.getTotalDiscount());
		return new Gson().toJson(cav);
	}
	
	@ResponseBody
	@RequestMapping(value = "/purchaseSuccess.do")
	public String purchaseSuccess(int orderMemberNo, int orderBoardNo, String sellTitle, String memberEmail, int price, int[] optionNo, int[] couponNo, Model model) {
		//유라: 결제하기 버튼 클릭
		System.out.println("uu"+orderMemberNo);
		System.out.println("uu"+orderBoardNo);
		System.out.println("uu"+sellTitle);
		System.out.println("uu"+memberEmail);
		System.out.println("uu"+price);
		System.out.println("uu"+optionNo);
		System.out.println("uu"+couponNo);
		OrdersVO ov = new OrdersVO();
		ov.setOrderMemberNo(orderMemberNo);
		ov.setOrderBoardNo(orderBoardNo);
		int result = service.purchaseSell(ov);
		if(result>0) {
			OrdersVO ov2 = service.getOrders(orderMemberNo);
			int resultOption=0;
			for(int i=0; i<optionNo.length;i++) {
				OrderOptionVO oov = new OrderOptionVO();
				oov.setOptionNo(optionNo[i]);
				oov.setOrderNo(ov.getOrderNo());
				resultOption += service.orderOption(oov);
			}	
			
			int resultCoupon= service.couponUse(couponNo);
			if(resultCoupon>0 && resultOption==optionNo.length) {
				model.addAttribute("memberNo", ov.getOrderMemberNo());
				model.addAttribute("memberEmail", memberEmail);
				model.addAttribute("sellTitle",sellTitle);
				model.addAttribute("date",ov.getOrderDate());
				model.addAttribute("price",price);
				return "1";
			}else {
				return "0";
			}
		}else {
			return "0";
		}
	} 
	
	@RequestMapping("/sellEnd.do")
	public String sellEnd(int orderMemberNo, int orderBoardNo, String sellTitle, String memberEmail, int price, Model model) {
		//결제완료 페이지 이동
		model.addAttribute("memberNo", orderMemberNo);
		model.addAttribute("orderBoardNo",orderBoardNo);
		model.addAttribute("memberEmail", memberEmail);
		OrdersVO ov = service.getOrders(orderMemberNo);
		model.addAttribute("orderNo",ov.getOrderNo());
		model.addAttribute("orderDate",ov.getOrderDate());
		model.addAttribute("sellTitle",sellTitle);
		model.addAttribute("price",price);
		return "order/purchaseSuccess";
	}
}
