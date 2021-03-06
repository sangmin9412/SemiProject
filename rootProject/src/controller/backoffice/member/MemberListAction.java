package controller.backoffice.member;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberListAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 5;
		int limitPage = 10;
		
		String userId = null;
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.memberSelect(page, limit, userId);
		Integer count = dao.memberCount();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "memberList.bomem?");

		
	}
}
