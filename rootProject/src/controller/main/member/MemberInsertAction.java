package controller.main.member;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberInsertAction {

	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userBir = request.getParameter("userBirth");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		String userAddr = request.getParameter("userAddr");
		String userPh1 = request.getParameter("userPh1");
		String userPh2 = request.getParameter("userPh2");
		
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date =  null;
		try {
			date = dt.parse(userBir);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp userBirth = new Timestamp(date.getTime());
		
		MemberDTO dto = new MemberDTO();
		dto.setUserAddr(userAddr);
		dto.setUserBirth(userBirth);
		dto.setUserEmail(userEmail);
		dto.setUserGender(userGender);
		dto.setUserId(userId);
		dto.setUserName(userName);
		dto.setUserPh1(userPh1);
		dto.setUserPh2(userPh2);
		dto.setUserPw(userPw);
		
		MemberDAO dao = new MemberDAO();
		dao.memberInsert(dto);
		
	}
	
}
