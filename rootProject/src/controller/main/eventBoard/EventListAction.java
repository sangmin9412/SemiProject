package controller.main.eventBoard;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		
		Date currentDt = new Date();
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		
		request.setAttribute("eventList", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("cDate", dt.format(currentDt));
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "eventList.eb");
		
	}

}
