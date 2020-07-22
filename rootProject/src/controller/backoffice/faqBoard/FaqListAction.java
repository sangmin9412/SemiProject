package controller.backoffice.faqBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.FaqBoardDAO;
import model.DTO.FaqBoardDTO;

public class FaqListAction {

	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		FaqBoardDAO dao = new FaqBoardDAO();
		FaqBoardDTO dto= new FaqBoardDTO();
		
		int count = dao.selectListCount("faqboard");
		List<FaqBoardDTO> list = dao.faqSelect(page, limit, null);
		
		request.setAttribute("faqList", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "faqBoardList.bofb");
	}

}
