package board.spring.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	public String memberVerification(MemberDTO dto) {
		if (memberDAO.oneMember(dto.getMemberid()) == null || dto.getMemberid() == null || dto.getMemberid() == "") {
			return "errorid";
		} else {
			String member = memberDAO.memberVerification(dto);
			if(member == null || member.equals("") || member.equals("-")) {
				return "errorpw";
			} else {
				return member;
			}
		}
	}

	@Override
	public MemberDTO oneMember(String memberid) {
		// TODO Auto-generated method stub
		return memberDAO.oneMember(memberid);
	}

}
