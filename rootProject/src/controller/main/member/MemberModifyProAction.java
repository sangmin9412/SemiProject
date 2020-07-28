package controller.main.member;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberModifyProAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
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
			e.printStackTrace();
		}
		Timestamp userBirth = new Timestamp(date.getTime());
		
		
		dto.setUserId(request.getParameter("userId"));
		dto.setUserPw(request.getParameter("userPw"));
		dto.setUserName(request.getParameter("userName"));
		dto.setUserPh1(request.getParameter("userPh1"));
		dto.setUserPh2(request.getParameter("userPh2"));
		dto.setUserBirth(userBirth);
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserAddr(request.getParameter("userAddr"));
		
		MemberDAO dao = new MemberDAO();
		int i = dao.memberUpdate(dto);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if (i >= 1) {
				out.println("alert('회원정보가 수정되었습니다.');");
			} else {
				out.println("alert('비밀번호가 틀렸습니다.');");
			}
			out.println("location.href = 'memberModify.mem'");
			out.println("</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
