package kr.or.meister.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.or.meister.chat.model.vo.ChatVO;

import kr.or.meister.coupon.model.vo.CouponApplyVO;
import kr.or.meister.coupon.model.vo.CouponJoinCouponIssuedVO;
import kr.or.meister.coupon.model.vo.CouponJoinMemberVO;

import kr.or.meister.employ.model.vo.EmployVO;

import kr.or.meister.member.model.service.MemberService;
import kr.or.meister.member.model.vo.CareerVO;
import kr.or.meister.member.model.vo.LicenseVO;
import kr.or.meister.member.model.vo.MemberDataVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;
import kr.or.meister.sell.model.vo.SellJoinOthersVO;

@Controller
@RequestMapping("/meister/member")
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService service;

	@RequestMapping("/mypagego.do")
	public String mypagego(int reqPage, Model model) {
		model.addAttribute("reqPage",reqPage);
		return "member/mypage";
	}

	@RequestMapping("/mypage.do")
	public String mypage( Model model, HttpSession session) {
		
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);
	
		return "member/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="/joinMember.do",produces = "text/html;charset=utf-8")
	public String joinMember(MemberVO m) {
		//유라:회원가입
		System.out.println("회원가입"+m.getMemberEmail());
		int result = service.joinMember(m);
		if(result>0) {
			//웰컴쿠폰 발급
			MemberVO mem = service.selectLoginMember(m);
			int result2 = service.welcomeCoupon(mem.getMemberNo());
			if(result2>0) {
				System.out.println("쿠폰 발급 완");
				return "1";
			}else {
				System.out.println("쿠폰 ㄴㄴ");
				return "0";
			}
		}else {
			return "0";
		}
	}
	@RequestMapping("/myprofile.do")
	public String myprofile(HttpSession session, Model model, CareerVO cr, LicenseVO ls) {
		MemberVO m = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m);
		return "member/myprofile";
	}

	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		// hyeokjin
		return "project/login";
	}
	@RequestMapping("/login2.do")
	public String login2(HttpSession session, MemberVO m) {
		MemberVO loginM = service.selectOneMember3(m);

		if (loginM != null) {
			session.setAttribute("member", loginM);
			return "redirect:/meister/member/loginFrm.do";
		} else {
			return "redirect:/meister/member/loginFrm.do";
		}
	}
	
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, MemberVO m) {
		MemberVO loginM = service.selectOneMember3(m);

		if (loginM != null) {
			session.setAttribute("member", loginM);
			return "member/loginSuccess";
		} else {
			return "member/loginFail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectAllEmploy.do", produces = "application/json;charset=utf-8")
	public ModelAndView selectAllMember(int memberNo, int reqPage, String memberNickname, 
			@RequestParam(defaultValue = "0") int employstatus, @RequestParam(defaultValue = "0") int employappro) {
		System.out.println("memberNo :"+ memberNo);
		System.out.println("reqPage : "+ reqPage);
		System.out.println("employstatus="+employstatus);
		System.out.println("employappro="+employappro);
		HashMap<String, Object> list = service.selectAllEmploy(memberNo, reqPage, employstatus, employappro);
		HashMap<String,Object> list2 = service.selectAllRequest(memberNo, reqPage, memberNickname);
		System.out.println("controller list : "+list);
		ModelAndView mo=new ModelAndView();
		mo.addObject("reqPage", reqPage);
		mo.addObject("list", new Gson().toJson(list));
		mo.addObject("list2", new Gson().toJson(list2));
		mo.setViewName("member/mypage");
		return mo;
	}
	@ResponseBody
	@RequestMapping(value = "/selectAllRequest.do", produces = "application/json;charset=utf-8")
	public ModelAndView selectAllMember2(int memberNo, int reqPage, String memberNickname,
			@RequestParam(defaultValue = "0") int employstatus, @RequestParam(defaultValue = "0") int employappro) {
		System.out.println("memberNo :"+ memberNo);
		System.out.println("reqPage : "+ reqPage);
		HashMap<String, Object> list = service.selectAllEmploy(memberNo, reqPage, employstatus, employappro);
		HashMap<String,Object> list2 = service.selectAllRequest(memberNo, reqPage, memberNickname);
		System.out.println("controller list2 : "+list2);
		ModelAndView mo=new ModelAndView();
		mo.addObject("list", new Gson().toJson(list));
		mo.addObject("reqPage", reqPage);
		mo.addObject("list2", new Gson().toJson(list2));
		mo.setViewName("member/mypage");
		return mo;
	}
	
	@RequestMapping(value="/employList.do")
	   public String employList(int reqPage, Model m) {
	      m.addAttribute("reqPage", reqPage);
	      return "member/mypage";
	   }
	
	

	@RequestMapping("/mypage5.do")
	public String mypage5(HttpSession session, Model model) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);
		return "member/mypage5";
	}
	@RequestMapping("/mypage13.do")
	public String mypage13(HttpSession session, Model model) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);
		return "member/mypage13";
	}

	@ResponseBody
	@RequestMapping(value = "/transformMember.do", produces = "text/html;charset=utf-8")
	public String transformMember(String Nickname, int level, HttpSession session, int reqPage) {

		MemberVO member = new MemberVO();
		member.setMemberNickname(Nickname);
		member.setMemberLevel(level);

		MemberVO member2 = new MemberVO();
		String num="0";
		if (member.getMemberLevel() == 1) {

			int result = service.updateMemberLevel(member);

			if (result > 0) {
				member2 = service.selectOneMember4(member);
				session.setAttribute("member", member2);
			}

		} else if (member.getMemberLevel() == 0) {

			int result = service.updateMemberLevel2(member);

			if (result > 0) {
				member2 = service.selectOneMember4(member);
				session.setAttribute("member", member2);

			}

			num="1";
		}
		return num;
	}

	@RequestMapping("/mypage9.do")
	public String mypage9(HttpSession session, Model model) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);
		return "member/mypage9";
	}

	@ResponseBody
	@RequestMapping(value = "/checkLogin.do", produces = "application/json;charset=utf-8")
	public String checkLogin(MemberVO m, String loginMaintain) {
		//유라:로그인 이메일 검사
		System.out.println(m.getMemberEmail());
		MemberVO member = service.checkLoginEmail(m.getMemberEmail());
		if (member != null) {
			System.out.println("controller:" + member.getMemberName());
		}
		return new Gson().toJson(member);
	}

	@RequestMapping("/loginMember.do")
	public String loginMember(HttpSession session, MemberVO m, String loginMaintain, HttpServletResponse response) {
		//유라: 로그인
		System.out.println("로그인 : " + m.getMemberEmail());
		MemberVO member = service.selectLoginMember(m);
		if (member != null) {
			
			if(member.getMemberLevel() == 2) {
				session.setAttribute("member", member);
				return "redirect:/meister/admin/adminIndexFrm.do";
			}
			session.setAttribute("member", member);
			System.out.println(m.getMemberEmail());
			System.out.println("로그인성공");
			return "redirect:/";
		} else {
			System.out.println("로그인실패");
			return "redirect:/";
		}
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		//유라: 로그아웃
		session.invalidate();
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/findEmail.do", produces = "application/json;charset-utf-8")
	public String findEmail(MemberVO m) {
		//유라: 이메일 찾기
		String memberEmail = service.findEmail(m);

		System.out.println("비번찾기"+memberEmail);
		return new Gson().toJson(memberEmail);
	}

	@ResponseBody
	@RequestMapping(value = "/mailSend.do", method = RequestMethod.POST, produces = "application/json;charset-utf-8")
	public String mailSend(String memberEmail, Model model, HttpServletRequest request) {
		//유라: 회원가입-이메일 인증키 메일전송
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			sb.append(r.nextInt(10));
		}
		System.out.println(sb.toString());

		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("meister.vill0714@gmail.com", "meister0714!");
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("meister.vill0714@gmail.com", "마이스터빌"));
			System.out.println(memberEmail);
			InternetAddress to = new InternetAddress(memberEmail);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("메일제목: 인증메일", "UTF-8");
			
			msg.setContent(
					"    <div style='width:600px; height:400px; background-image: url(http://192.168.10.161/resources/yr/imgs/bg-5gray.png); background-position: bottom; background-repeat: no-repeat; background-size: 100%; padding: 50px; margin:100px auto; text-align: center; font-family: 'Noto Sans KR', sans-serif;'>" + 
					"        <div>" + 
					"            <div style='margin-top: 70px; color: #4d4d4d; font-size: 24px; font-weight: 700px;'>" + 
					"                이메일 인증 번호" + 
					"            </div>" + 
					"            <div style='margin-top: 30px; font-size: 30px;'>" + 
					sb.toString() + 
					"            </div>" + 
					"            <div class='margin-top: 20px;'>" + 
					"                정확하게 입력 해 주세요." + 
					"            </div>" + 
					"        </div>" + 
					"    </div>", "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return sb.toString();

	}
	@RequestMapping("/meisterList.do")
	public String meisterList() {
		//유라: 마이스터 찾기 페이지 이동
		return "member/meisterList";
	}

	@RequestMapping(value = "/goChat.do")
	public String chat(HttpSession session, Model model) {
		// hyeokjin
		MemberVO m = (MemberVO) session.getAttribute("member");
		ArrayList<ChatVO> list = service.selectAllChat(m);
		model.addAttribute("list", list);
		return "member/chat";
	}

	@ResponseBody
	@RequestMapping(value = "/showChat.do", produces = "application/json; charset=utf-8")
	public String showChat(HttpSession session, String sender) {
		// hyeokjin
		MemberVO m = (MemberVO) session.getAttribute("member");
		ArrayList<ChatVO> list = service.showChat(sender, m.getMemberNickname());
		Gson gson = new GsonBuilder().setPrettyPrinting().serializeNulls().create();
		return gson.toJson(list);
	}

	@RequestMapping(value = "/message.do")
	public String message() {
		// hyeokjin
		return "common/message";
	}

	@ResponseBody
	@RequestMapping(value = "/getMessage.do", produces = "application/json; charset=utf-8")
	public String getMessage(HttpSession session, String memberNickname) {
		// hyeokjin
		ArrayList<MessageVO> list = service.getMessage(memberNickname);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "/getUnreadMsgCnt.do", produces = "application/json; charset=utf-8")
	public int getUnreadMsgCnt(String memberNickname) {
		// hyeokjin
		int unReadMsgCnt = service.getUnreadMsgCnt(memberNickname);
		return unReadMsgCnt;
	}
	
	@ResponseBody
	@RequestMapping(value="/readMsg.do")
	public void readMsg(int msgNo) {
		// heokjin
		int result = service.readMsg(msgNo);
	}
	

	@ResponseBody
	@RequestMapping(value = "/uploadChatFile.do", produces = "text/html;charset=utf-8")
	public String uploadChatFile2(HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		// hyeokjin
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		ArrayList<String> resultList = new ArrayList<String>();
		if (!fileList.isEmpty()) {
			for (MultipartFile file : fileList) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/chat/");
				// 업로드한 파일의 실제 파일명
				String originalFilename = file.getOriginalFilename();
				// 확장자를 제외한 파일명 ->text
				String onlyFilename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
				// 확장자 ->.txt
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				String filepath = onlyFilename + "_" + Calendar.getInstance().getTimeInMillis() + extension;
				String fullpath = savePath + filepath;

				resultList.add(originalFilename + ":" + filepath);

				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
					bos.write(bytes);
					bos.close();
					System.out.println("파일 업로드 완료");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return new Gson().toJson(resultList);
	}
	

	@RequestMapping(value = "/chatFileDownload.do", produces = "application/octet-stream;charset=utf-8")
	public void chatFileDownload(String filename, String filepath, HttpServletRequest request,
			HttpServletResponse response) {
		//hyeokjin
		String resFilename=null;
		try {
			resFilename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + resFilename);
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/chat/");

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(new FileInputStream(saveDir + filepath));
			bos = new BufferedOutputStream(response.getOutputStream());
			int read = -1;
			while ((read = bis.read()) != -1) {
				bos.write(read);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/mailSendLink.do", method = RequestMethod.POST)
	public String mailSendLink(String memberEmail, Model model, HttpServletRequest request) {
		//유라: 비밀번호 찾기 이메일 링크 전송
		System.out.println("비번찾기"+memberEmail);
		long time = System.currentTimeMillis();
		System.out.println(time);
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("meister.vill0714@gmail.com", "meister0714!");
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("meister.vill0714@gmail.com", "마이스터빌"));
			System.out.println(memberEmail);
			InternetAddress to = new InternetAddress(memberEmail);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("메일제목: 비밀번호 수정", "UTF-8");
			msg.setContent(
					"    <div style='width:600px; height:400px; background-image: url(http://192.168.10.161/resources/yr/imgs/bg-5gray.png); background-position: bottom; background-repeat: no-repeat; background-size: 100%; padding: 50px; margin:100px auto; text-align: center; font-family: 'Noto Sans KR', sans-serif;'>" + 
					"        <div>" + 
					"            <div style='margin-top: 70px; color: #4d4d4d; font-size: 24px; font-weight: 700px;'>" + 
					"                비밀번호 변경" + 
					"            </div>" + 
					"            <div style='margin-top: 30px; font-size: 30px;'>" + 
					"<form action='http://192.168.10.161/meister/member/changePw.do' method='post'>" + 
					"                    <input type='hidden' value="+time+" name='time'>" + 
					"                    <input type='hidden' value="+memberEmail+" name='memberEmail'>" + 
					"                    <button type='submit' style='border-radius: 4px; width: 300px; height: 45px; background-color: #FFBC42; border: white; font-family: 'Noto Sans KR', sans-serif;font-size: 17px; font-weight: 700; outline: 0 none; color: white;'>비밀번호 변경하기</button>" + 
					"                </form>" + 
					"            </div>" + 
					"            <div class='margin-top: 20px;'>" + 
					"                메일 수신 후 3시간 이내로 버튼을 누르면 해당 페이지로 이동합니다." + 
					"            </div>" + 
					"        </div>" + 
					"    </div>", "text/html;charset=UTF-8");
			Transport.send(msg);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberEmail;

	}

	@ResponseBody
	@RequestMapping(value = "/checkEmail.do", produces = "text/html;charset=utf-8")
	public String checkEmail(String memberEmail) {
		//유라: 회원가입 - 이메일 중복검사
		MemberVO m = service.checkLoginEmail(memberEmail);
		if (m == null) {
			return "0";

		} else {
			return "1";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkNickname.do", produces = "text/html;charset=utf-8")
	public String checkNickname(String memberNickname) {
		//유라: 회원가입 - 닉네임 중복검사
		MemberVO m = service.checkNickname(memberNickname);
		if (m == null) {
			return "0";

		} else {
			return "1";
		}
	}
	
	@RequestMapping("/coupon.do")
	public String coupon() {
		//유라: 쿠폰페이지 이동
		return "member/coupon";
	}
	@RequestMapping("/joinEnd.do")
	public String joinEnd() {
		//유라: 회원가입 다음페이지 이동
		return "member/joinEnd";
	}
	
	@RequestMapping("/forgetIdPw.do")
	public String forgetIdPw() {
		//유라: 아이디. 비번찾기 페이지 이동
		return "member/forgetIdPw";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		//유라: 회원가입 페이지 이동
		return "member/join";
	}
	@RequestMapping("/purchaseSuccess.do")
	public String purchaseSuccess() {
		return "order/purchaseSuccess";
	}
	


	@RequestMapping("/joinEmail.do")
	public String joinEmail() {
		return "member/joinEmail";
	}

	

	@RequestMapping("/changePw.do")
	public String changePw(String memberEmail, long time, Model m) {
		//유라 : 비밀번호 변경페이지 링크 연결
		long time2 = System.currentTimeMillis();
		System.out.println(time2);
		System.out.println(time);
		long time3 = (long)((time2-time)/1000);
		System.out.println("!!"+time3);
		if(time3>60*60*3) {
			System.out.println("링크 시간 초과!");
			return "redirect:/";
		}else {
			m.addAttribute("memberEmail",memberEmail);
			return "member/changePw";
			
		}
	}
	@ResponseBody
	@RequestMapping(value="/changeForgottenPw.do", produces = "text/html;charset=utf-8")
	public String changeForgottenPw(MemberVO m){
		//유라: 비밀번호 변경
		int result = service.changeForgottenPw(m);
		if(result>0) {
			return "0";
		}else {
			return "1";
		}
	}
	
	@RequestMapping("/goMain.do")
	public String goMain() {
		//유라: 메인 이동
		return "redirect:/";
	}
	@RequestMapping("/pwChangeSuccessModalTest.do")
	public String pwChangeSuccessModalTest() {
		return "member/pwChangeSuccessModalTest";
	}

	@RequestMapping("/serviceTermModalTest.do")
	public String serviceTermModalTest() {
		return "member/serviceTermModalTest";
	}

	@RequestMapping("/useTermModalTest.do")
	public String useTermModalTest() {
		return "member/useTermModalTest";
	}

	@RequestMapping("/joinSuccessModalTest.do")
	public String joinSuccessModalTest() {
		return "member/joinSuccessModalTest";
	}

	@RequestMapping("/loginModal.do")
	public String loginModal() {
		return "member/loginModal";
	}

	@RequestMapping("/forgetIdPwTest.do")
	public String forgetIdPwTest() {
		return "member/forgetIdPwTest";
	}
	@RequestMapping("/changePwLink.do")
	public String changePwLink() {
		return "member/pwLinkEmail";
	}
	@RequestMapping("/couponListModal.do")
	public String couponListModal() {
		return "member/couponListModal";
	}
	
	@ResponseBody
	@RequestMapping(value = "/couponMoalOpen.do", produces = "application/json;charset=UTF-8")
	public String couponMoalOpen(int memberNo){
		//유라: 구매화면에서 쿠폰모달 오픈
		ArrayList<CouponJoinCouponIssuedVO> arr = service.selectAllCoupon(memberNo);
		return new Gson().toJson(arr);
	}
	
	@RequestMapping("/couponWriteFrm.do")
	public String couponWriteFrm() {
		//유라: 쿠폰이벤트 작성 페이지 이동
		 return "member/couponWrite";
	}
	
	@RequestMapping("/order.do")
	public String order(SellJoinOthersVO sjo, Model model) {
		//유라: 구매하기 버튼 누름
		ArrayList<CouponJoinCouponIssuedVO> arrCjci = service.selectAllCoupon(sjo);
		model.addAttribute("sell",sjo.getSellvo());
		model.addAttribute("member",sjo.getMembervo());
		model.addAttribute("options",sjo.getOptionsvo());
		int cnt = arrCjci.size();
		model.addAttribute("couponCnt",cnt);
		return "order/order";
	}
	
	@ResponseBody
	@RequestMapping(value="/couponApply.do", produces="application/json;charset=UTF-8")
	public String couponApply(CouponApplyVO cav) {
		//유라: 쿠폰 적용 버튼 누름
		System.out.println(cav.getTotalDiscount());
		return new Gson().toJson(cav);
	}
	@RequestMapping("/carouselTestFrm.do")
	public String carouselTestFrm() {
		//유라: 캐러셀 테스트
		
		return "member/test";
	}
	@RequestMapping("/carouselTestFrm2.do")
	public String carouselTestFrm2() {
		//유라: 캐러셀 테스트2
		
		return "member/test2";
	}
	

}
