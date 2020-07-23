package controller.backoffice.eventBoard;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventWriteAction {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String adminId = session.getAttribute("logId").toString();
		String ipAddr = request.getRemoteAddr();
		
		EventBoardDTO dto = new EventBoardDTO();
		EventBoardDAO dao = new EventBoardDAO();
		
		String realPath = request.getServletContext().getRealPath("/backoffice/page/cscenter/eventupload/");
		int fileLimit = 1024 * 1024 * 5;
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileLimit, "utf-8", new DefaultFileRenamePolicy());
			String boardSubject = multi.getParameter("boardSubject");
			String boardContent= multi.getParameter("boardContent");
			String startDt = multi.getParameter("startDate");
			String endDt = multi.getParameter("endDate");
			String storeFileName = multi.getFilesystemName("fileUp");
			
			date1 = dt.parse(startDt);
			date2 = dt.parse(endDt);
			
			Timestamp startDate = new Timestamp(date1.getTime());
			Timestamp endDate = new Timestamp(date2.getTime());
			
			dto.setAdminId(adminId);
			dto.setBoardSubject(boardSubject);
			dto.setBoardContent(boardContent);
			dto.setStartDate(startDate);
			dto.setEndDate(endDate);
			dto.setStoreFileName(storeFileName);
			dto.setIpAddr(ipAddr);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		dao.eventInsert(dto);
		
	}

}
