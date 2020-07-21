package controller.backoffice.noticeBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeListAction {

	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		NoticeBoardDTO dto= new NoticeBoardDTO();
		
		int count = dao.selectListCount("noticeboard");
		List<NoticeBoardDTO> list = dao.noticeSelect(page, limit, null);
		
		request.setAttribute("noticeList", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "noticeBoardList.bonb");
	}

}
