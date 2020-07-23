package controller.backoffice.eventBoard;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventModifyAction {

	public String execute(HttpServletRequest request) {
		String result = null;
		int conNum = 0;
		String realPath = request.getServletContext().getRealPath("/backoffice/page/cscenter/eventupload/");
		int fileLimit = 1024 * 1024 * 5;
		String boardNum = null;
		
		EventBoardDAO dao = new EventBoardDAO();
		EventBoardDTO dto = new EventBoardDTO();
		File file = null;
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date data1 = null;
		Date data2 = null;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileLimit, "utf-8", new DefaultFileRenamePolicy());
			boardNum = multi.getParameter("boardNum");
			String boardSubject = multi.getParameter("boardSubject");
			String boardContent = multi.getParameter("boardContent");
			String startDt = multi.getParameter("startDate");
			String endDt = multi.getParameter("endDate");
			
			data1 = dt.parse(startDt);
			data2 = dt.parse(endDt);
			
			Timestamp startDate = new Timestamp(data1.getTime());
			Timestamp endDate = new Timestamp(data2.getTime());

			dto.setBoardNum(Long.parseLong(boardNum));
			dto.setBoardSubject(boardSubject);
			dto.setBoardContent(boardContent);
			dto.setStartDate(startDate);
			dto.setEndDate(endDate);
			conNum = dao.eventContentUpdate(dto);
			
			if (multi.getFile("fileUp") == null) { // 파일이 upload 되지 않은 경우
				if (!multi.getParameter("fileDel").trim().equals("")) {
					dto.setStoreFileName("");
					int i = dao.eventFileUpdate(dto);
					if (i >= 1) {
						String fl = multi.getParameter("fileDel");
						file = new File(realPath + fl);
						if (file.exists()) {
							file.delete();
						}
					}
				}
			} else {  // 파일이 upload 된 경우
				String storeFileName = multi.getFilesystemName("fileUp");
				dto.setStoreFileName(storeFileName);
				int i = dao.eventFileUpdate(dto);
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
		
		result = "eventBoardView.boeb?boardNum=" + boardNum;;
		
		return result;
	}

}
