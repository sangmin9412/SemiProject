package controller.main;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class LogInOutAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.memberSelect(1, 1, userId);
		Integer i = dao.memberLogInChk(userId, userPw);
		if (i >= 1) {
			session.setAttribute("logId", userId);
			
			try {
				response.sendRedirect("/main.main");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				if (i == 0) {
					out.println("alert('비밀번호가 틀렸습니다.');");
				} else if (i == -1) {
					out.println("alert('아이디가 틀렸습니다.');");
				}
				out.println("location.href = '/main.main';");
				out.println("</script>");
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
}
