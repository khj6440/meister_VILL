package kr.or.meister.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
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
import javax.servlet.http.Cookie;
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

import com.google.gson.Gson;

import kr.or.meister.member.model.service.MemberService;
import kr.or.meister.member.model.vo.MemberCookieVO;
import kr.or.meister.member.model.vo.MemberVO;

@Controller
@RequestMapping("/meister/member")
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	private MemberService service;
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("/myprofile.do")
	public String myprofile() {
		return "member/myprofile";
	}
	@RequestMapping("/login.do")
	public void login(MemberVO m) {
		MemberVO member = new MemberVO();	
		MemberVO loginM =  service.selectOneMember(m);
		
		if(loginM!=null){
			System.out.println("�꽦怨�");
		}else {
			System.out.println("�떎�뙣");
		}

		
	}
	@ResponseBody
	@RequestMapping(value="/checkLogin.do", produces="application/json;charset=utf-8")
	public String checkLogin(MemberVO m, String loginMaintain) {
		System.out.println(m.getMemberEmail());
		MemberVO member = service.checkLoginEmail(m.getMemberEmail());
		if(member!=null) {
			
			System.out.println("controller:"+member.getMemberName());
		}
		return new Gson().toJson(member);
	}
	@RequestMapping("/loginMember.do")
	public String loginMember(HttpSession session, MemberVO m, String loginMaintain, HttpServletResponse response) {
		System.out.println(loginMaintain);
		MemberVO member = service.selectLoginMember(m);
		if(member !=null) {
			session.setAttribute("member", member);
			if(loginMaintain=="true") {
				//로그인 유지에 체크한 상태
				//쿠키를 생성하고 현재 로그인 되어있을 때 생성되었던 세션의 id를 쿠키에 저장
				Cookie cookie = new Cookie("loginCookie",session.getId());
				cookie.setPath("/");//쿠키 찾을 경로를 컨텍스트 경로로 변경...
				cookie.setMaxAge(60*60*24*7);//단위(초) :  7일 유효시간 설정
				response.addCookie(cookie);
				MemberCookieVO mcookie = new MemberCookieVO();
				mcookie.setSessionkey(session.getId());
				mcookie.setMemberEmail(m.getMemberEmail());
				mcookie.setSessionlimit(cookie.getMaxAge());
				int result = service.loginMaintain(mcookie);
			}
			System.out.println("로그인성공");
			return "redirect:/";
		}else {
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
	@RequestMapping(value="/findEmail.do",produces="application/json;charset-utf-8")
	public String findEmail(MemberVO m) {
		String memberEmail = service.findEmail(m);
		
		System.out.println(memberEmail);
		return new Gson().toJson(memberEmail);
	}
	
	@ResponseBody
	@RequestMapping(value="/mailSend.do",method=RequestMethod.POST, produces="application/json;charset-utf-8")
	public String mailSend(String memberEmail, Model model, HttpServletRequest request) {
		
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0; i<6;i++) {
			sb.append(r.nextInt(10));
		}
		System.out.println(sb.toString());
		
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("ravly.b.4702@gmail.com", "930706!ra");
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("ravly.b.4702@gmail.com","마이스터빌"));
			System.out.println(memberEmail);
			InternetAddress to = new InternetAddress(memberEmail);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("메일제목: 인증메일","UTF-8");
			msg.setContent("<h1>이메일 인증번호</h1><h3>["+sb.toString()+"]","text/html;charset=UTF-8");
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
	
	@ResponseBody
	@RequestMapping(value="/mailSendLink.do",method=RequestMethod.POST, produces="application/json;charset-utf-8")
	public String mailSendLink(String memberEmail, Model model, HttpServletRequest request) {
		
		
		
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("ravly.b.4702@gmail.com", "930706!ra");
			}
		});
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("ravly.b.4702@gmail.com","마이스터빌"));
			System.out.println(memberEmail);
			InternetAddress to = new InternetAddress(memberEmail);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("메일제목: 비밀번호 수정","UTF-8");
			msg.setContent("<h1>비밀번호 수정 링크:</h1>","text/html;charset=UTF-8");
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
