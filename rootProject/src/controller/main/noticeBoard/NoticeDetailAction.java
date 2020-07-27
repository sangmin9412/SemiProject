package controller.main.noticeBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeDetailAction {

	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		NoticeBoardDAO dao = new NoticeBoardDAO();
		List<NoticeBoardDTO> list = dao.noticeSelect(1, 1, boardNum);
		int count = dao.selectListCount("noticeboard");
		request.setAttribute("noticeList", list.get(0));
		request.setAttribute("count", count);
		dao.updateReadCount(boardNum, "noticeboard");
	}

}
