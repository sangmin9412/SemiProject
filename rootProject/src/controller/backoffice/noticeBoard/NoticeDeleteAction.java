package controller.backoffice.noticeBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.NoticeBoardDAO;

public class NoticeDeleteAction {

	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.noticeDelete(boardNum);
		
	}

}
