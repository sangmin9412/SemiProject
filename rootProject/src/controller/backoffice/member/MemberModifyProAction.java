package controller.backoffice.member;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberModifyProAction {
	public void execute(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MemberDTO dto = new MemberDTO();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		
		String userBir = request.getParameter("userBirth");
		try {
			date = dt.parse(userBir);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp userBirth = new Timestamp(date.getDate());
		
		
		dto.setUserId(request.getParameter("userId"));
		dto.setUserPw(request.getParameter("userPw"));
		dto.setUserName(request.getParameter("userName"));
		dto.setUserPh1(request.getParameter("userPh1"));
		dto.setUserPh2(request.getParameter("userPh2"));
		dto.setUserBirth(userBirth);
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserAddr(request.getParameter("userAddr"));
		
		MemberDAO dao = new MemberDAO();
		dao.memberUpdate(dto);
		
		
		
	}
}
