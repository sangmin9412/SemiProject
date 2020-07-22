package controller.backoffice.answerBoard;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.AnswerBoardDAO;
import model.DTO.AnswerBoardDTO;

public class AnswerModifyAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int conNum = 0;
		String realPath = request.getServletContext().getRealPath("/backoffice/page/cscenter/answerupload/");
		int fileLimit = 1024 * 1024 * 5;
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		String boardNum = null;
		
		AnswerBoardDAO dao = new AnswerBoardDAO();
		AnswerBoardDTO dto = new AnswerBoardDTO();
		File file = null;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileLimit, "utf-8", new DefaultFileRenamePolicy());
			boardNum = multi.getParameter("boardNum");
			String boardPass= multi.getParameter("boardPass");
			String boardSubject = multi.getParameter("boardSubject");
			String boardContent = multi.getParameter("boardContent");
			
			dto.setUserId(userId);
			dto.setBoardNum(Long.parseLong(boardNum));
			dto.setBoardPass(boardPass);
			dto.setBoardSubject(boardSubject);
			dto.setBoardContent(boardContent);
			conNum = dao.answerContentUpdate(dto);
			
			if (multi.getFile("fileUp") == null) { // 파일이 upload 되지 않은 경우
				if (!multi.getParameter("fileDel").trim().equals("")) {
					dto.setOriginalFileName("");
					dto.setStoreFileName("");
					dto.setFileSize(0L);
					int i = dao.answerFileUpdate(dto);
					if (i >= 1) {
						String fl = multi.getParameter("fileDel");
						file = new File(realPath + fl);
						if (file.exists()) {
							file.delete();
						}
					}
				}
			} else {  // 파일이 upload 된 경우
				String originalFileName = multi.getOriginalFileName("fileUp");
				String storeFileName = multi.getFilesystemName("fileUp");
				file = multi.getFile("fileUp");
				Long fileSize = file.length();
				dto.setOriginalFileName(originalFileName);
				dto.setStoreFileName(storeFileName);
				dto.setFileSize(fileSize);
				int i = dao.answerFileUpdate(dto);
				if (i >= 1) {
					String fl = multi.getParameter("fileDel");
					file = new File(realPath + fl);
					if (file.exists()) {
						file.delete();
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			if (conNum >= 1) {
				response.sendRedirect("answerBoardView.boab?boardNum=" + boardNum);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다.');");
				out.println("location.href = 'answerBoardModify.boab?boardNum="+boardNum+"'");
				out.println("</script>");
				out.close();		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
