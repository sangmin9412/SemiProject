package controller.main.eventBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventDetailAction {

	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		EventBoardDAO dao = new EventBoardDAO();
		List<EventBoardDTO> list = dao.eventSelectAll(1, 1, boardNum);
		int count = dao.selectListCount("eventboard");
		request.setAttribute("eventList", list.get(0));
		request.setAttribute("count", count);
		dao.updateReadCount(boardNum, "eventboard");

	}

}
