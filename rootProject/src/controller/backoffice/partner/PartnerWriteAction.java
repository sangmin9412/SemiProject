package controller.backoffice.partner;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.PartnerDAO;
import model.DTO.PartnerDTO;

public class PartnerWriteAction {
	public void execute(HttpServletRequest request) {
		
		PartnerDTO dto = new PartnerDTO();
		String filePath= "/backoffice/page/partner/upload";
		String realPath = request.getServletContext().getRealPath(filePath);
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;
		int fileSize = 1024*1024*5;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileSize, "utf-8", new DefaultFileRenamePolicy());
			String partnerName = multi.getParameter("partnerName");
			String partnerNum = multi.getParameter("partnerNum");
			String partnerCeo = multi.getParameter("partnerCeo");
			String residentNum = multi.getParameter("residentNum");
			String partnerAddr = multi.getParameter("partnerAddr");
			String openingD = multi.getParameter("openingDay");
			String businessRegistD = multi.getParameter("businessRegistDate");
			String salesType = multi.getParameter("salesType");
			String businessType = multi.getParameter("businessType");
			String cooperative = multi.getParameter("cooperative");
			String bookInfo = multi.getParameter("bookInfo");
			String businessRegistFile = multi.getFilesystemName("businessRegistFile");
			String bankBookFile = multi.getFilesystemName("bankBookFile");
			String partnerAccNum = multi.getParameter("partnerAccNum");
			String partnerEmail = multi.getParameter("partnerEmail");
			
			date1 = dt.parse(openingD);
			date2 = dt.parse(businessRegistD);	
			Timestamp openingDay = new Timestamp(date1.getTime());
			Timestamp businessRegistDate = new Timestamp(date2.getTime());
			
			dto.setPartnerName(partnerName);
			dto.setPartnerNum(partnerNum);
			dto.setPartnerCeo(partnerCeo);
			dto.setResidentNum(residentNum);
			dto.setPartnerAddr(partnerAddr);
			dto.setOpeningDay(openingDay);
			dto.setBusinessRegistDate(businessRegistDate);
			dto.setSalesType(salesType);
			dto.setBusinessType(businessType);
			dto.setCooperative(cooperative);
			dto.setBookInfo(bookInfo);
			dto.setPartnerAccNum(partnerAccNum);
			dto.setBusinessRegistFile(businessRegistFile);
			dto.setBankBookFile(bankBookFile);
			dto.setPartnerEmail(partnerEmail);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		PartnerDAO dao = new PartnerDAO();
		dao.partnerInsert(dto);
		
	}
}
