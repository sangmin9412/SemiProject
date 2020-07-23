package controller.backoffice.eventBoard;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventDeleteAction {

	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		
		EventBoardDAO dao = new EventBoardDAO();
		List<EventBoardDTO> list = dao.eventSelectAll(1, 1, boardNum);
		
		int i = dao.eventDelete(boardNum);
		String realPath = request.getServletContext().getRealPath("/backoffice/page/cscenter/eventupload/");
		File file = null;
		
		if (i >= 1) {
			file = new File(realPath + list.get(0).getStoreFileName());
			if (file.exists()) {
				file.delete();
			}
			
		}
		
	}

}
