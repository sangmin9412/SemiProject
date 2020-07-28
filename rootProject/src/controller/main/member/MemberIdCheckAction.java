package controller.main.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.MemberDAO;

public class MemberIdCheckAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		MemberDAO dao = new MemberDAO();
		String chkResult = dao.memberIdChk(userId);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			if (chkResult.equals("x")) {
				out.println("중복된 아이디 입니다.");
			} else {
				out.println("사용가능한 아이디 입니다.");
			}
			
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
