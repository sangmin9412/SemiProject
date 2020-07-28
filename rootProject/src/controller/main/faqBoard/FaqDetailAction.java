package controller.main.faqBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.FaqBoardDAO;
import model.DTO.FaqBoardDTO;

public class FaqDetailAction {

	public void execute(HttpServletRequest request) {
		String boardNum = request.getParameter("boardNum");
		FaqBoardDAO dao = new FaqBoardDAO();
		List<FaqBoardDTO> list = dao.faqSelect(1, 1, boardNum);
		int count = dao.selectListCount("faqboard");
		request.setAttribute("faqList", list.get(0));
		request.setAttribute("count", count);
		dao.updateReadCount(boardNum, "faqboard");
	}

}
