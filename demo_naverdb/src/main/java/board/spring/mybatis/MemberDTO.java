package board.spring.mybatis;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	private String memberid;
	private String pw;
	private String membername;
	private String phone;
	private String email;
	private String regdate;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String memberid, String membername, String phone, String email) {
		super();
		this.memberid = memberid;
		this.membername = membername;
		this.phone = phone;
		this.email = email;
	}

	public MemberDTO(String memberid, String pw, String membername, String phone, String email, String regdate) {
		super();
		this.memberid = memberid;
		this.pw = pw;
		this.membername = membername;
		this.phone = phone;
		this.email = email;
		this.regdate = regdate;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
