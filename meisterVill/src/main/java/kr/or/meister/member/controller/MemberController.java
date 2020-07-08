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
import java.util.List;
import java.util.Properties;
import java.util.Random;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.or.meister.chat.model.vo.ChatVO;
import kr.or.meister.member.model.service.MemberService;
import kr.or.meister.member.model.vo.MemberDataVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.message.model.vo.MessageVO;

@Controller
@RequestMapping("/meister/member")
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService service;

	@RequestMapping("/mypagego.do")
	public String mypagego() {
		return "member/mypage";
	}

	@RequestMapping("/mypage.do")
	public String mypage(Model model, HttpSession session) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);

		return "member/mypage";
	}

	@RequestMapping("/myprofile.do")
	public String myprofile(HttpSession session, Model model, MemberDataVO mdv) {
		MemberDataVO mdv2 = service.selectOneMember2(mdv);
		MemberVO m = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m);
		model.addAttribute("list", mdv2);
		System.out.println(mdv2);
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

	@RequestMapping("/mypage5.do")
	public String mypage5(HttpSession session, Model model) {
		MemberVO m2 = (MemberVO) session.getAttribute("member");
		model.addAttribute("m", m2);
		return "member/mypage5";
	}

	@ResponseBody
	@RequestMapping(value = "/transformMember.do", produces = "text/html;charset=utf-8")
	public String transformMember(String Nickname, int level, HttpSession session) {

		MemberVO member = new MemberVO();
		member.setMemberNickname(Nickname);
		member.setMemberLevel(level);

		MemberVO member2 = new MemberVO();

		if (member.getMemberLevel() == 1) {

			int result = service.updateMemberLevel(member);

			if (result > 0) {
				member2 = service.selectOneMember4(member);
				session.setAttribute("member", member2);
			}
			return "0";

		} else if (member.getMemberLevel() == 0) {

			int result = service.updateMemberLevel2(member);

			if (result > 0) {
				member2 = service.selectOneMember4(member);
				session.setAttribute("member", member2);

			}

		}
		return "1";
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
		System.out.println(m.getMemberEmail());
		MemberVO member = service.checkLoginEmail(m.getMemberEmail());
		if (member != null) {
			System.out.println("controller:" + member.getMemberName());
		}
		return new Gson().toJson(member);
	}

	@RequestMapping("/loginMember.do")
	public String loginMember(HttpSession session, MemberVO m, String loginMaintain, HttpServletResponse response) {
		System.out.println("로그인 : " + m.getMemberEmail());
		MemberVO member = service.selectLoginMember(m);
		if (member != null) {
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
		session.invalidate();
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/findEmail.do", produces = "application/json;charset-utf-8")
	public String findEmail(MemberVO m) {
		String memberEmail = service.findEmail(m);

		System.out.println(memberEmail);
		return new Gson().toJson(memberEmail);
	}

	@ResponseBody
	@RequestMapping(value = "/mailSend.do", method = RequestMethod.POST, produces = "application/json;charset-utf-8")
	public String mailSend(String memberEmail, Model model, HttpServletRequest request) {

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
			msg.setContent("<h1>이메일 인증번호</h1><h3>[" + sb.toString() + "]", "text/html;charset=UTF-8");
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
	@RequestMapping(value = "/mailSendLink.do", method = RequestMethod.POST, produces = "application/json;charset-utf-8")
	public void mailSendLink(String memberEmail, Model model, HttpServletRequest request) {

		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("meister@gmail.com", "meister0714!");
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("meister@gmail.com", "마이스터빌"));
			System.out.println(memberEmail);
			InternetAddress to = new InternetAddress(memberEmail);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("메일제목: 비밀번호 수정", "UTF-8");
			msg.setContent("<h1>비밀번호 수정 링크:</h1>", "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@ResponseBody
	@RequestMapping(value = "/checkEmail.do", produces = "text/html;charset=utf-8")
	public String checkEmail(String memberEmail) {
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
		MemberVO m = service.checkNickname(memberNickname);
		if (m == null) {
			return "0";

		} else {
			return "1";
		}
	}

	@RequestMapping("/loginModalTest.do")
	public String loginModalTest() {
		return "member/loginModal";
	}

	@RequestMapping("/forgetIdPw.do")
	public String forgetIdPw() {
		return "member/forgetIdPw";
	}

	@RequestMapping("/changePw.do")
	public String changePw() {
		return "member/changePw";
	}

	@RequestMapping("/pwChangeSuccessModalTest.do")
	public String pwChangeSuccessModalTest() {
		return "member/pwChangeSuccessModalTest";
	}

	@RequestMapping("/join.do")
	public String join() {
		return "member/join";
	}

	@RequestMapping("/joinInput.do")
	public String joinInput() {
		return "member/joinEnd";
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

	@RequestMapping("/joinEnd.do")
	public String joinEnd() {
		return "member/joinEnd";
	}

	@RequestMapping("/coupon.do")
	public String coupon() {
		return "member/coupon";
	}

}
