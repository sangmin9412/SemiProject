package controller.backoffice.answerBoard;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.AnswerBoardDAO;
import model.DTO.AnswerBoardDTO;

public class AnswerWriteAction {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		String ipAddr = request.getRemoteAddr();
		
		String realPath = request.getServletContext().getRealPath("/backoffice/page/cscenter/answerupload/");
		int fileLimit = 1024 * 1024 * 5;
		File file = null;
		
		AnswerBoardDAO dao = new AnswerBoardDAO();
		AnswerBoardDTO dto = new AnswerBoardDTO();
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileLimit, "utf-8", new DefaultFileRenamePolicy());
			String boardPass = multi.getParameter("boardPass");
			String boardName = multi.getParameter("boardName");
			String boardSubject = multi.getParameter("boardSubject");
			String boardContent= multi.getParameter("boardContent");
			String originalFileName = multi.getOriginalFileName("fileUp");
			String storeFileName = multi.getFilesystemName("fileUp");
			file = multi.getFile("fileUp");
			Long fileSize = file.length();
			
			dto.setUserId(userId);
			dto.setBoardPass(boardPass);
			dto.setBoardName(boardName);
			dto.setBoardSubject(boardSubject);
			dto.setBoardContent(boardContent);
			dto.setOriginalFileName(originalFileName);
			dto.setStoreFileName(storeFileName);
			dto.setFileSize(fileSize);
			dto.setIpAddr(ipAddr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		dao.answerInsert(dto);
		
	}
	
}
