package controller.backoffice.main;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.AdminDAO;

public class LogInAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String adminId = request.getParameter("adminId");
		String adminPw = request.getParameter("adminPw");
		
		AdminDAO dao = new AdminDAO();
		Integer i = dao.adminLogInChk(adminId, adminPw);
		if (i >= 1) {
			session.setAttribute("logId", adminId);
			try {
				response.sendRedirect("main.bomain");
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
				out.println("location.href = '/backoffice/';");
				out.println("</script>");
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
