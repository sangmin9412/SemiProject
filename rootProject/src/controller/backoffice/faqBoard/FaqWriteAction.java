package controller.backoffice.faqBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.FaqBoardDAO;
import model.DTO.FaqBoardDTO;

public class FaqWriteAction {

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
		
		FaqBoardDTO dto = new FaqBoardDTO();
		dto.setAdminId(adminId);
		dto.setBoardSubject(boardSubject);
		dto.setBoardContent(boardContent);
		dto.setIpAddr(ipAddr);
		
		FaqBoardDAO dao = new FaqBoardDAO();
		dao.faqInsert(dto);
		
	}
	
}
