package controller.backoffice.partner;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.PartnerDAO;
import model.DTO.PartnerDTO;

public class PartnerModifyProAction {
	public String execute(HttpServletRequest request) {
		
		String realPath = request.getServletContext().getRealPath("/backoffice/page/partner/upload");
		int limitSize = 1024 * 1024 * 5;
		PartnerDTO dto = new PartnerDTO();
		PartnerDAO dao = new PartnerDAO();
		MultipartRequest multi = null;
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;
		try {
			multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			String openingD = multi.getParameter("openingDay");
			String businessRegistD = multi.getParameter("businessRegistDate");
			date1 = dt.parse(openingD);
			date2 = dt.parse(businessRegistD);	
			Timestamp openingDay = new Timestamp(date1.getTime());
			Timestamp businessRegistDate = new Timestamp(date2.getTime());
			
			dto.setPartnerName(multi.getParameter("partnerName"));
			dto.setPartnerNum(multi.getParameter("partnerNum"));
			dto.setPartnerCeo(multi.getParameter("partnerCeo"));
			dto.setResidentNum(multi.getParameter("residentNum"));
			dto.setPartnerAddr(multi.getParameter("partnerAddr"));
			dto.setOpeningDay(openingDay);
			dto.setBusinessRegistDate(businessRegistDate);
			dto.setSalesType(multi.getParameter("salesType"));
			dto.setBusinessType(multi.getParameter("businessType"));
			dto.setCooperative(multi.getParameter("cooperative"));
			dto.setBookInfo(multi.getParameter("bookInfo"));
			dto.setPartnerAccNum(multi.getParameter("partnerAccNum"));
			dto.setPartnerEmail(multi.getParameter("partnerEmail"));
			
			dao.PartnerUpdate(dto);
			if(multi.getFile("businessRegistFile") != null || multi.getFile("bankBookFile") != null) {
				System.out.println("111");
				dto.setBusinessRegistFile(multi.getFilesystemName("businessRegistFile"));
				dto.setBankBookFile(multi.getFilesystemName("bankBookFile"));
				int i = dao.fileUpdate(dto);
				File file = null;
				if(i >= 1) {
					String fileName = realPath + "/" + multi.getParameter("fileDel");
					file = new File(fileName);
					if(file.exists()) file.delete();
					else System.out.println("파일이 없다.");
				}
			}else {
				System.out.println("222");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	return multi.getParameter("partnerNum");
	}
}
