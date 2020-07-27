package controller.main.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberViewAction {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.memberSelect(1, 1, userId);
		request.setAttribute("list", list.get(0));
		
	}
	
}
