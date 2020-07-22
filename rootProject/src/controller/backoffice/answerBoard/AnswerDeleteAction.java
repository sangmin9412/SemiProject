package controller.backoffice.answerBoard;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.AnswerBoardDAO;
import model.DTO.AnswerBoardDTO;

public class AnswerDeleteAction {

	public String execute(HttpServletRequest request) {
		String result = null;
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		String boardPass = request.getParameter("boardPass");
		String boardNum = request.getParameter("boardNum");
		
		AnswerBoardDAO dao = new AnswerBoardDAO();
		List<AnswerBoardDTO> list = dao.ansSelectAll(1, 1, boardNum);
		
		int i = dao.answerDelete(userId, boardPass, boardNum);
		String realPath = request.getServletContext().getRealPath("/backoffice/page/cscenter/answerupload/");
		File file = null;
		
		if (i >= 1) {
			file = new File(realPath + list.get(0).getStoreFileName());
			if (file.exists()) {
				file.delete();
			}
			
			result = "answerBoardList.boab";
		} else {
			result = "answerBoardView.boab?boardNum=" + boardNum;
		}
		
		return result;
		
	}

}
