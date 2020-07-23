package controller.backoffice.eventBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventListAction {

	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		EventBoardDAO dao = new EventBoardDAO();
		List<EventBoardDTO> list = dao.eventSelectAll(page, limit, null);
		int count = dao.selectListCount("eventboard");
		
		request.setAttribute("eventList", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "eventBoardList.boeb");
		
	}

}
