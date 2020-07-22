package controller.backoffice.answerBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.AnswerBoardDAO;
import model.DTO.AnswerBoardDTO;

public class AnswerListAction {

	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		AnswerBoardDAO dao = new AnswerBoardDAO();
		int count = dao.selectListCount("answerboard");
		List<AnswerBoardDTO> list = dao.ansSelectAll(page, limitPage, null);
		
		request.setAttribute("answerList", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "answerBoardList.boab");
		
	}
	
}
