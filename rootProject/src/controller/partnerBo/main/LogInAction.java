package controller.partnerBo.main;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.PartnerDAO;
import model.DTO.PartnerDTO;

public class LogInAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String partnerId = request.getParameter("partnerId");
		String partnerPw = request.getParameter("partnerPw");
		
		
		
		PartnerDAO dao = new PartnerDAO();
		Integer i = dao.partnerLogInChk(partnerId, partnerPw); 
		if (i >= 1) {
			List<PartnerDTO> list = dao.partnerSelect(1, 1, partnerId);
			session.setAttribute("logId", partnerId);
			session.setAttribute("logName", list.get(0).getPartnerName());
			try {
				response.sendRedirect("main.pomain");
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
				out.println("location.href = '/partnerBo/';");
				out.println("</script>");
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
