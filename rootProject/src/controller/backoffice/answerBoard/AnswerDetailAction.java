package controller.backoffice.answerBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.AnswerBoardDAO;
import model.DTO.AnswerBoardDTO;

public class AnswerDetailAction {

	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		AnswerBoardDAO dao = new AnswerBoardDAO();
		List<AnswerBoardDTO> list = dao.answerSelectAll(1, 1, boardNum);
		request.setAttribute("answerList", list.get(0));
		dao.updateReadCount(boardNum, "answerboard");
		
	}
	
}
