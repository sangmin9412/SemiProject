package controller.backoffice.noticeBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeWriteAction {

	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		String adminId = session.getAttribute("logId").toString();
		String boardSubject = request.getParameter("boardSubject");
		String boardContent = request.getParameter("boardContent");
		String ipAddr = request.getRemoteAddr();
		
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setAdminId(adminId);
		dto.setBoardSubject(boardSubject);
		dto.setBoardContent(boardContent);
		dto.setIpAddr(ipAddr);
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.noticeInsert(dto);
		
	}
	
}
