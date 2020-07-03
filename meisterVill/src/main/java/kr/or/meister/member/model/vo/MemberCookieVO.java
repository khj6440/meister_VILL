package kr.or.meister.member.model.vo;

public class MemberCookieVO {
	
	private int cookieNo;
	private String memberEmail;
	private String sessionkey;
	private int sessionlimit;
	public MemberCookieVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberCookieVO(int cookieNo, String memberEmail, String sessionkey, int sessionlimit) {
		super();
		this.cookieNo = cookieNo;
		this.memberEmail = memberEmail;
		this.sessionkey = sessionkey;
		this.sessionlimit = sessionlimit;
	}
	public int getCookieNo() {
		return cookieNo;
	}
	public void setCookieNo(int cookieNo) {
		this.cookieNo = cookieNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public int getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(int sessionlimit) {
		this.sessionlimit = sessionlimit;
	}

	
}
