package controller.backoffice.faqBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.FaqBoardDAO;
import model.DTO.FaqBoardDTO;

public class FaqModifyAction {

	public String execute(HttpServletRequest request) {
		String result = null;
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String boardNum = request.getParameter("boardNum");
		String boardSubject = request.getParameter("boardSubject");
		String boardContent = request.getParameter("boardContent");
		
		FaqBoardDTO dto = new FaqBoardDTO();
		dto.setBoardNum(Long.parseLong(boardNum));
		dto.setBoardSubject(boardSubject);
		dto.setBoardContent(boardContent);
		
		FaqBoardDAO dao = new FaqBoardDAO();
		dao.faqUpdate(dto);
		
		result = "faqBoardView.bofb?boardNum=" + boardNum;
		
		return result;
	}

}
