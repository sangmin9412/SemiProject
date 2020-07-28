package controller.backoffice.partner;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PartnerDAO;
import model.DTO.PartnerDTO;

public class PartnerDeleteAction {
	public void execute(HttpServletRequest request) {
		String partnerNum = request.getParameter("partnerNum");
		PartnerDAO dao = new PartnerDAO();
		List<PartnerDTO> list = dao.partnerSelect(1, 1, partnerNum);
		int i = dao.partnerDel(partnerNum);
		File file1 = null;
		File file2 = null;
		String path = request.getServletContext().getRealPath("/backoffice/page/partner/upload");
		if(i >= 1) {
			file1 = new File(path + "/" + list.get(0).getBusinessRegistFile());
			file2 = new File(path + "/" + list.get(0).getBankBookFile());
			if(file1.exists()) {
				file1.delete();
				file2.delete();
			}
		}
	}
	
}
