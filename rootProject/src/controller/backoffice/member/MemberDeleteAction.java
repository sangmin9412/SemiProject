package controller.backoffice.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class MemberDeleteAction {
	public void execute(HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		MemberDAO dao = new MemberDAO();
		dao.memberDelete(userId);
		
		
	}
}
