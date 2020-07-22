package controller.backoffice.faqBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.FaqBoardDAO;

public class FaqDeleteAction {

	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		FaqBoardDAO dao = new FaqBoardDAO();
		dao.faqDelete(boardNum);
		
	}

}
