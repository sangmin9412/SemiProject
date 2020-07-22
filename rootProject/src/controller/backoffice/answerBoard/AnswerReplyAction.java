package controller.backoffice.answerBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.AnswerBoardDAO;
import model.DTO.AnswerBoardDTO;

public class AnswerReplyAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString(); 
		String boardSubject = request.getParameter("boardSubject");
		String boardContent = request.getParameter("boardContent");
		String boardName = request.getParameter("boardName");
		String boardPass = request.getParameter("boardPass");
		String boardReRef = request.getParameter("boardReRef");
		String boardReLev = request.getParameter("boardReLev");
		String boardReSeq = request.getParameter("boardReSeq");
		String ipAddr = request.getRemoteAddr();
		
		AnswerBoardDTO dto = new AnswerBoardDTO();
		dto.setUserId(userId);
		dto.setBoardSubject(boardSubject);
		dto.setBoardContent(boardContent);
		dto.setBoardName(boardName);
		dto.setBoardPass(boardPass);
		dto.setBoardReRef(Integer.parseInt(boardReRef));
		dto.setBoardReLev(Integer.parseInt(boardReLev));
		dto.setBoardReSeq(Integer.parseInt(boardReSeq));
		dto.setIpAddr(ipAddr);
		
		AnswerBoardDAO dao = new AnswerBoardDAO();
		dao.answerSeqUpdate(dto);
		dao.answerReplyInsert(dto);
		
	}
}
