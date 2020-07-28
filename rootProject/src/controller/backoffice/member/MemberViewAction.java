package controller.backoffice.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;


public class MemberViewAction {
	public void execute(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.memberSelect(1, 1, userId);
		request.setAttribute("list", list);
		
	}
}
