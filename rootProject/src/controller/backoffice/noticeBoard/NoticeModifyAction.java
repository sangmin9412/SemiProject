package controller.backoffice.noticeBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeModifyAction {

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
		
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setBoardNum(Long.parseLong(boardNum));
		dto.setBoardSubject(boardSubject);
		dto.setBoardContent(boardContent);
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.noticeUpdate(dto);
		
		result = "noticeBoardView.bonb?boardNum=" + boardNum;
		
		return result;
	}

}
